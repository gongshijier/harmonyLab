import hilog from '@ohos.hilog'
import db from '@ohos.data.relationalStore'
import { DBConstants } from './DBConstants'

/**
 * db manager
 */
export class DBHelper {
  private dbInstance: any

  private constructor() {
    this.initDb()
  }

  public static getInstance(): DBHelper {
    if (globalThis.dbInstance == null) {
      globalThis.dbInstance = new DBHelper()
    }
    return globalThis.dbInstance
  }

  /**
   * create && init db
   */
  initDb() {
    db.getRdbStore(globalThis.appContext, { name: "rdbstore.db", securityLevel: 1 }, (err, rdbStore) => {
      this.dbInstance = rdbStore
      rdbStore.executeSql(DBConstants.CREATE_TABLE_TEST)
      this.insert()
      this.query()
      hilog.info(0x0000, 'DBHelper', '%{public}s', 'db init !');
    })
  }

  /**
   * insert item
   */
  insert() {
    var u8 = new Uint8Array([1, 2, 3])
    const valueBucket = { "name": "Tom", "age": 18, "salary": 100.5, "blobType": u8 }
    let insertPromise = this.dbInstance.insert("test", valueBucket)
  }

  /**
   * query item
   */
  query() {
    let promisequery = this.dbInstance.query(new db.RdbPredicates("test"))
    promisequery.then((resultSet) => {
      console.log("resultSet column names:" + resultSet.columnNames)
      console.log("resultSet column count:" + resultSet.columnCount)

      resultSet.goToFirstRow()
      const id = resultSet.getLong(resultSet.getColumnIndex("id"))
      const name = resultSet.getString(resultSet.getColumnIndex("name"))
      const age = resultSet.getLong(resultSet.getColumnIndex("age"))
      const salary = resultSet.getDouble(resultSet.getColumnIndex("salary"))
      const blobType = resultSet.getBlob(resultSet.getColumnIndex("blobType"))
      resultSet.close()
      console.log("query result: id: " + id + " name: " + name + " age: " + age + " salary: " + salary + " blobType: " + blobType)

    }).catch((err) => {
      console.info('Query failed.')
    })
  }
}