/*
 * Copyright (c) 2022 Huawei Device Co., Ltd.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

import dataRdb from '@ohos.data.relationalStore'
import { Database } from './Database';
import { SQLiteOpenHelper } from './SQLiteOpenHelper'
import { StandardDatabase } from './StandardDatabase'
import { Migration } from '../dbflow/Migration'
import { StorageUtils } from '../StorageUtils'
import { GlobalContext } from '../GlobalContext';

/**
 * SQLiteOpenHelper to allow working with dataORM's {@link Database} abstraction to create and update database schemas.
 */
export abstract class DatabaseOpenHelper extends SQLiteOpenHelper {
  private contexts: any
  private name: string
  private versions: number
  protected entities: any
  private migrations: Array<Migration>

  constructor(context: any, name: string, version: number, factory?: any, errorHandler?: any) {
    super(context, name, version, factory, errorHandler);
    this.contexts = context;
    this.name = name;
    this.versions = version;
  }

  setEntities(...entities: any[]) {
    let dbArray = new Array();
    if (entities) {
      for (let index = 0; index < entities.length; index++) {
        const element = entities[index];
        let createDB = this.isCreateDB(element);
        if (createDB) {
          dbArray.push(element);
        }
      }
    }
    this.entities = dbArray;
  }

  setMigration(...migration: Array<Migration>) {
    this.migrations = migration
  }

  getMigration(): Array<Migration> {
    return this.migrations;
  }

  /**
   * set db version
   * @param version
   * @returns
   */
  async setVersion(version: number): Promise<void> {
    this.versions = await StorageUtils.getValueByKey("dbVersion", 1, this.contexts)
    if (version > this.versions) {
      this.versions = version;
      this.mNewVersion = version;
      await StorageUtils.putValue("dbVersion", this.versions, this.contexts);
    } else if (version < this.versions) {
      throw Error("The database version does not support rollback")
    }
  }

  /**
   * set db version
   * @param version
   * @returns
   */
  async setVersionAsync(version: number): Promise<void> {
    this.versions = await StorageUtils.getValueByKey("dbVersion", 1, this.contexts)
    let db = await this.getWritableDb();
    if (version != this.versions) {
      if (version > this.versions) {
        await this.onUpgradeDatabase(db, version, this.versions)
      } else if (version < this.versions) {
        throw Error("The database version does not support rollback")
      }
      this.versions = version;
      await StorageUtils.putValue("dbVersion", this.versions, this.contexts);
    }
  }

  private initGlobalData() {
    if (!GlobalContext.getContext().getValue(GlobalContext.KEY_CTX)) {
      GlobalContext.getContext().setValue(GlobalContext.KEY_CTX, this.context);
      GlobalContext.getContext().setValue(GlobalContext.KEY_CLS, {});
      GlobalContext.getContext().setValue(GlobalContext.KEY_CLS_ARRAY, {});
      GlobalContext.getContext().setValue(GlobalContext.KEY_CLS_RE_SHIP_ARRAY, {});
      GlobalContext.getContext().setValue(GlobalContext.KEY_CLS_RE_SHIP, {});
    }
    if (this.entities) {
      GlobalContext.getContext().setValue(GlobalContext.KEY_CLS_ARRAY, this.entities);
    }
  }

  private isCreateDB<T>(t: T): boolean {
    let v = Reflect.getMetadata("CreateInDb", t);
    return v ? true : false;
  }

  /**
   * Like {@link #getWritableDatabase()}, but returns a dataORM abstraction of the database.
   * The backing DB is an standard {@link SQLiteDatabase}.
   */
  async getWritableDb(): Promise<Database> {
    return this.wrap(await this.getWritableDatabase());
  }

  /**
   * Like {@link #getReadableDatabase()}, but returns a dataORM abstraction of the database.
   * The backing DB is an standard {@link SQLiteDatabase}.
   */
  async getReadableDb(): Promise<Database> {
    return this.wrap(await this.getReadableDatabase());
  }

  wrap(sqLiteDatabase: dataRdb.RdbStore): Database {
    return new StandardDatabase(sqLiteDatabase);
  }

  onConfigure() {
    this.initGlobalData();
  }

  /**
   *Delegates to {@link #onCreate(Database)}, which uses dataORM's database abstraction.
   * @param db
   * @useinstead DatabaseOpenHelper#onCreateDatabase
   */
  async onCreate(db: dataRdb.RdbStore): Promise<void> {
    await this.onCreateDatabase(this.wrap(db));
  }

  /**
   * Override this if you do not want to depend on {@link SQLiteDatabase}.
   * @param db
   * @useinstead DatabaseOpenHelper#onCreate_D
   */
  abstract onCreateDatabase(db: Database): Promise<void>

  /**
   * Delegates to {@link #onUpgrade(Database, int, int)}, which uses dataORM's database abstraction.
   * @param db
   * @param oldVersion
   * @param newVersion
   * @useinstead DatabaseOpenHelper#onUpgradeDatabase
   */
  async onUpgrade(db: dataRdb.RdbStore, oldVersion: number, newVersion: number): Promise<void> {
    await this.onUpgradeDatabase(this.wrap(db), oldVersion, newVersion);
  }


  /**
   * Override this if you do not want to depend on {@link SQLiteDatabase}.
   * @param db
   * @param oldVersion
   * @param newVersion
   * @useinstead DatabaseOpenHelper#onUpgradeDatabase
   */
  abstract onUpgradeDatabase(db: Database, oldVersion: number, newVersion: number): Promise<void>

  /**
   * Delegates to {@link #onOpen(Database)}, which uses dataORM's database abstraction.
   */
  onOpen(db: dataRdb.RdbStore) {
    this.onOpen_D(this.wrap(db));
  }

  /**
   * Override this if you do not want to depend on {@link SQLiteDatabase}.
   */
  onOpen_D(db: Database) {
    // Do nothing by default
  }
}
