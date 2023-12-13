## dataORM单元测试用例

该测试用例基于OpenHarmony系统下，进行接口单元测试

### 单元测试用例覆盖情况

|接口名 | 是否通过 |备注|
|---|---|---|
|setEncrypt(encrypt: boolean)|pass|
|getWritableDb()|pass|
|setEntities(...entities: any[])|pass|
|onCreate_D(db: Database)|pass|
|addColumn(columnName: string, columnType: string)|pass|
|setMigration(...migration: Array<Migration>)|pass|
|setVersion(version: number)|pass|
|newSession(type_s=IdentityScopeType.Session)|pass|
|getBaseDao<T, K>(entity: any)|pass|
|queryBuilder()|pass|
|orderAsc(properties: Property)|pass|
|build()|pass|
|insert(entity: T):|pass|
|convertCursor2Entity(cursor: any)|pass|
|queryBuilder()|pass|
|where(cond: WhereCondition, condMore?: Array<WhereCondition>)|pass|
|buildDelete()|pass|
|executeDeleteWithoutDetachingEntities()|pass|
|update(entity: T)|pass|
|refresh(entity: T)|pass|
|whereOr(cond1: WhereCondition, cond2: WhereCondition, ...condMore: Array<WhereCondition>)|pass|
|from(model: Model) |pass|
|eq(columnName: string, value: ValueType)|pass|
|querySingle(entityCls: any)|pass|
|@Entity|pass|
|@Id|pass|
|@Columns|pass|
|@NotNull|pass|
|@Unique|pass|
|@Index|pass|
|@Convert|pass|
|@Embedded|pass|
|@Transient|pass|



