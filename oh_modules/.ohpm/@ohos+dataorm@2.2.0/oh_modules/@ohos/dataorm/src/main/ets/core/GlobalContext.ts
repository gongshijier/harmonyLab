/*
  * Copyright (c) 2022 Huawei Device Co., Ltd.
  *
  * Licensed under the Apache License, Version 2.0 (the "License");
  * you may not use this file except in compliance with the License.
  * You may obtain a copy of the License at
    *
  * http://www.apache.org/licenses/LICENSE-2.0
    *
  * Unless required by applicable law or agreed to in writing, software
  * distributed under the License is distributed on an "AS IS" BASIS,
  * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  * See the License for the specific language governing permissions and
  * limitations under the License.
  */

export class GlobalContext {
  public static KEY_CTX: string = "contt"; // key 全局上下文
  public static KEY_CLS: string = "entityCls"; // key entity 属性集合，通过类名获取
  public static KEY_CLS_ARRAY: string = "entityClsArr"; // key 记录要做处理的实体类，通过类名获取
  public static KEY_CLS_RE_SHIP: string = "entityClsRelationship"; // key entity 属性toMany、 toOne关系集合
  public static KEY_CLS_RE_SHIP_ARRAY: string = "entityClsRelationshipArr"; // key 全局临时变量，用于特殊情况存储数据

  private constructor() {
  }

  private static instance: GlobalContext;
  private _objects = new Map<string, Object>();

  public static getContext(): GlobalContext {
    if (!GlobalContext.instance) {
      GlobalContext.instance = new GlobalContext();
    }
    return GlobalContext.instance;
  }

  getValue(value: string): Object | undefined {
    let result = this._objects.get(value);
    if (!result) {
      return undefined;
    }
    return result;
  }

  setValue(key: string, objectClass: Object): void {
    this._objects.set(key, objectClass);
  }
}