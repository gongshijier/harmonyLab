/*
  * Copyright (c) 2022 Huawei Device Co., Ltd.
  *
  * Licensed under the Apache License, Version 2.0 (the "License");
  * you may not use this file except in compliance with the License.
  * You may obtain a copy of the License at
  *
  *   http://www.apache.org/licenses/LICENSE-2.0
  *
  * Unless required by applicable law or agreed to in writing, software
  * distributed under the License is distributed on an "AS IS" BASIS,
  * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  * See the License for the specific language governing permissions and
  * limitations under the License.
  */

import dataRdb from '@ohos.data.relationalStore';
import { GlobalContext } from '../GlobalContext';

import { StorageUtils } from '../StorageUtils'
import { Unit8ArrayUtils } from '../Unit8ArrayUtils'

export abstract class SQLiteOpenHelper {
  context: any;
  dbPath: string;
  dbName: string;
  mNewVersion: number = 1;
  cfg = undefined;
  encrypt: boolean = false;

  public constructor(context: any, name: string, version: number, factory?: any, errorHandler?: any) {
    this.dbName = name;
    this.context = context;
    this.mNewVersion = version;
  }

  getDatabaseName(): string {
    return this.dbName;
  }

  async getWritableDatabase(): Promise<dataRdb.RdbStore> {
    this.onConfigure();
    let rdbStore = await this.getRdbStoreV9();
    let version = rdbStore.version;
    if (version != this.mNewVersion) {
      if (version > this.mNewVersion) {
        throw new Error("the set new version cannot be less than old version");
      }
      await this.onCreate(rdbStore);
      if (version < this.mNewVersion) {
        rdbStore.beginTransaction();
        await this.onUpgrade(rdbStore, version, this.mNewVersion);
        rdbStore.version = this.mNewVersion;
        rdbStore.commit();
      }
    }
    return rdbStore;
  }

  async getReadableDatabase(): Promise<dataRdb.RdbStore> {
    let rdbStore = await this.getRdbStoreV9();
    return rdbStore;
  }

  abstract onCreate(db: dataRdb.RdbStore);

  abstract onConfigure();

  abstract onUpgrade(db: dataRdb.RdbStore, oldVersion: number, newVersion: number);

  onOpen(db: dataRdb.RdbStore) {
  }

  setEncrypt(encrypt: boolean) {
    this.encrypt = encrypt;
  }

  protected async getRdbStoreV9(): Promise<dataRdb.RdbStore> {
    this.mNewVersion = await StorageUtils.getValueByKey("dbVersion", 1, this.context);
    if (this.cfg == undefined) {
      this.cfg = {
        name: this.dbName,
        encrypt: this.encrypt,
        securityLevel: dataRdb.SecurityLevel.S1
      }
    }
    let promise = dataRdb.getRdbStore(this.context, this.cfg);
    return promise;
  }

  protected getFileDir(): string {
    return this.context.filesDir;
  }
}
