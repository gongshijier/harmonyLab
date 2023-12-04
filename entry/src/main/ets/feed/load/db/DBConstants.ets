
/**
 * db constant
 */
export class DBConstants {
  static readonly CREATE_TABLE_TEST = "CREATE TABLE IF NOT EXISTS test (" + "id INTEGER PRIMARY KEY AUTOINCREMENT, " + "name TEXT NOT NULL, " + "age INTEGER, " + "salary REAL, " + "blobType BLOB)";
  static readonly STORE_CONFIG = { name: "rdbstore.db" }
}