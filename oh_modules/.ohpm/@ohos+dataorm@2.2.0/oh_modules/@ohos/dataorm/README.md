# dataORM

## 简介

> dataORM是一个具有一行代码操作数据库或链式调用,备份、升级、缓存等特性的关系映射数据库

## 效果展示

![效果展示](gif/sample.gif)

## 下载安装

```
ohpm install @ohos/dataorm --save
```

OpenHarmony ohpm
环境配置等更多内容，请参考[如何安装 OpenHarmony ohpm 包](https://gitee.com/openharmony-tpc/docs/blob/master/OpenHarmony_har_usage.md)

## 使用说明

1. 创建实体类，如Note

```
import { Id } from '@ohos/dataorm';
import { NotNull } from '@ohos/dataorm';
import { Entity, Columns } from '@ohos/dataorm';
import { Unique } from '@ohos/dataorm';
import { Index } from '@ohos/dataorm';
import { ToMany } from '@ohos/dataorm';
import { ColumnType } from '@ohos/dataorm';
import { ToOne } from '@ohos/dataorm';

@Entity('NOTE')
export class Note {
    @Id()
    @Columns({ columnName: 'ID', types: ColumnType.num })
    id: number;
    @NotNull()
    @Unique()
    @Index(true)
    @Columns({ columnName: 'TEXT', types: ColumnType.str })
    text: string;
    @Columns({ columnName: 'COMMENT', types: ColumnType.str })
    comment: string;
    @Columns({ columnName: 'DATE', types: ColumnType.str })
    date: Date;
    @Columns({ columnName: 'TYPE', types: ColumnType.str })
    type: string;
    @Columns({ columnName: 'MONEYS', types: ColumnType.real })
    moneys: number;

    //todo 类中必须在constructor中声明所有非静态变量，用于反射生成列
    constructor(id?: number, text?: string, comment?: string, date?: Date, types?: string, moneys?: number) {
        this.id = id;
        this.text = text;
        this.comment = comment;
        this.date = date;
        this.type = types;
        this.moneys = moneys;
    }

    getMoneys(): number {
        return this.moneys;
    }

    setMoneys(moneys: number) {
        this.moneys = moneys;
    }

    getId(): number {
        return this.id;
    }

    setId(id: number) {
        this.id = id;
    }

    getText(): string {
        return this.text;
    }

    /** Not-null value; ensure this value is available before it is saved to the database. */
    setText(text: string) {
        this.text = text;
    }

    getComment(): string {
        return this.comment;
    }

    setComment(comment: string) {
        this.comment = comment;
    }

    getDate(): Date {
        return this.date;
    }

    setDate(date: Date) {
        this.date = date;
    }

    getType(): string {
        return this.type;
    }

    setType(types: string) {
        this.type = types;
    }
}
```

#### 注解对外开放部分：Column、Entity、Id、NotNull、Unique、Index、ToMany、ToOne、JoinEntity、OrderBy、Convert、Embedded、Transient。

可使用注解使用示例及说明：

#### （1）Id的使用：

1、导入引用

```
import {Id} from '@ohos/dataorm'; 
```

2、使用方式：

A、

```
@Id()
id: number;
```

B、

```
@Id({ isPrimaryKey: true ,autoincrement:false})
id: number;
```

说明：在类属性中使用，定义表主键和键值是否是自增长。A和B的定义方式等同，isPrimaryKey值为true（是表主键），autoincrement值为false（不为自增长）

#### （2）Entity的使用：

1、导入引用

```
import {Entity} from '@ohos/dataorm';
```

2、使用方式：

```
@Entity('NOTE')
export  class Note {}
```

说明：在类头使用，定义表表名，如该示例定义为表名为NOTE。

#### （3）Column的使用：

1、导入引用

```
import {Columns} from '@ohos/dataorm';
```

2、使用方式：

```
@Columns({ columnName: 'ID', types: ColumnType.num })
text: string;
```

说明：在类属性中使用，定义在表中的列名和列类型。第一个参数为列名，第二个参数为列的数据类型

#### （4）NotNull的使用：

1、导入引用

```
import {NotNull} from '@ohos/dataorm';
```

2、使用方式：

A、

```
@NotNull()
text: string;
```

B、

```
@NotNull(true)
text: string;
```

说明：在类属性中使用，定义在表中该列是否可空，当为true值时，在表中该列值为非空值。其中A和B的定义方式等同，该列为非空值。

#### （5）Unique的使用：

1、导入引用

```
import {Unique} from '@ohos/dataorm';
```

2、使用方式：

A、

```
@Unique()
text: string;
```

B、

```
@Unique(true)
text: string;
```

说明：在类属性中使用，定义在表中该列是否是唯一值，当为true值时，在表中该列值为唯一值。其中A和B的定义方式等同，该列为唯一值。

#### （6）Index的使用：

1、导入引用

```
import {Index} from '@ohos/dataorm';
```

2、使用方式：

A、

```
@Index()
text: string;
```

B、

```
@Index(true)
text: string;
```

c、

```
@Index(false)
text: string;
```

说明：在类属性中使用，定义创建索引表的列以及是否是唯一，当为true值时，为唯一。其中A定义为非唯一索引，B的定义为唯一索引，C定义为非唯一索引.A和C的定义等同。

#### （7）ToMany的使用

1、导入引用

```
import {  ToMany } from '@ohos/dataorm';
```

2、使用方式：

```
@ToMany({ targetClsName: "Student", joinProperty: [{ name: "ID", referencedName: "TID" }] })
@OrderBy("NAME ASC")
students: Array<Student>
```

说明：在类属性中使用，定义了目标关系表 targetClsName, 当前要查询的列 name 与外部目标表关联的列名 referencedName
,其中的name的值是目标referencedName的值 ,
返回的是目标的表的对象数组。

调用时方式：

```
  async queryByToManyFunctionTest() {
    this.daoSession = GlobalContext.getContext().getValue("daoSession") as DaoSession;
    this.studentDao = this.daoSession.getBaseDao(Student);
    var teacherId: string[] = ["1"]
    let data = await this.studentDao.queryToManyListByColumnName("students", teacherId)
    data.forEach(element => {
      console.info("-----tonMany-----" + JSON.stringify(element))
    });
  }
```

说明： 获取目标表的Dao , 调用queryToManyListByColumnName(toManyColumnName: string, arr: string[])，
传入参数toManyColumnName为当前表所创建类的@ToMany下面的变量名,传入参数arr为关联列的查询值。

#### （8）JoinEntity的使用

1、导入引用

```
import { JoinEntity } from '@ohos/dataorm';
```

2、使用方式

```
@JoinEntity({ entityName: 'JoinManyToDateEntity', targetClsName: 'DateEntity',  sourceProperty: 'ID_TO_MANY', targetProperty: 'ID_DATE' })
@OrderBy("ID DESC")
dateEntityList: Array<DateEntity>
```

说明：在类属性中使用，定义了联接表之间的关系， entityName 为链接表的实体类名称, targetClsName 目标表的实体类，
sourceProperty为连接实体中包含源(当前)实体id的属性的名称
,targetProperty 为连接实体中包含目标实体id的属性的名称 , 返回的是目标的表的对象数组。

调用时方式：

```
  async queryByJoinEntityFunctionTest(){
    this.daoSession = GlobalContext.getContext().getValue("daoSession") as DaoSession;
    this.studentDao = this.daoSession.getBaseDao(DateEntity);
    var teacherId: string[] = ["11"]
    let data = await this.studentDao.queryToManyListByColumnName("dateEntityList", teacherId)
    data.forEach(element => {
      console.info("-----JoinEntity-----" + JSON.stringify(element))
    });
  }
```

说明： 获取目标表的Dao , 调用queryToManyListByColumnName(toManyColumnName: string, arr: string[])，
传入参数toManyColumnName为当前表所创建类的@ToMany下面的变量名,传入参数arr为关联列的查询值。

#### （9）ToOne的使用

1、导入引用

```
import { ToOne } from '@ohos/dataorm';
```

2、使用方式

```
@ToOne({ value: 'TID', targetObj: Teacher })
teacher: Teacher
```

说明：在类属性中使用，定义了当前表 value为关联的列,targetObj 为关链创建的表的类。

调用时方式：

A、

```
async loadDeep() {
   this.daoSession = GlobalContext.getContext().getValue("daoSession") as DaoSession;
   this.studentDao = this.daoSession.getBaseDao(Student);
   let studentId =         1
   let student: Student = await this.studentDao.loadDeep(studentId);
}
```

B、

```
async queryByToOneFunctionTest() {
     this.daoSession = GlobalContext.getContext().getValue("daoSession") as DaoSession;
     this.studentDao = this.daoSession.getBaseDao(Student);
     let columnName = this.studentDao.getPkProperty().columnName
     let entityList = await this.studentDao.queryDeep("WHERE T." + columnName + "=?", ["1"]);
     let entity3: Student = entityList[0];
}
```

说明： 获取目标表的Dao,拼接查询Sql 作为queryDeep(where: string, selectionArg: string[])的参数去查询。

#### （10）Convert的使用

1、导入引用

```
import { Convert } from '@ohos/dataorm';
```

2、使用方式

```
@Convert({ converter: TypeConvert, columnType: ColumnType.str })
images: ArrayList<string>;
```

说明：在类属性中使用，将对应的属性的集合或者数组，在数据库中存储与取出的操作，@Convert其参数说明：converter：继承PropertyConverter实体，实现其抽象方法；columnType：对应存储到数据库中的类型

PropertyConverter方法介绍：
|接口名|功能描述|
|-----|------|
|convertToEntityProperty(databaseValue: Q): P|将数据库数据转化成对应的集合或者数组|
|convertToDatabaseValue(entityProperty: P): Q|将对象实体中集合或者数组数据转换为数据库存储的类型|

#### （11）Transient的使用

1、导入引用

```
import { Transient } from '@ohos/dataorm';
```

2、使用方式

```
@Transient()
home: string
```
说明：Transient注解修饰的属性不会映射到数据库中

#### （12）Embedded的使用

1、导入引用

```
import { Embedded } from '@ohos/dataorm';
```

2、使用方式

```
@Embedded({ prefix: "f_", targetClass: Father })
father: Father
```
说明：Embedded注解：数据实体嵌套的功能，其参数说明,prefix:实体中对应数据库中列名的前缀定义，targetClass：对应嵌套的实体


#### 1. 非加密库在AbilityStage.ts进行初始化

 ```

 let helper: ExampleOpeHelper = new ExampleOpenHelper(this.context, "notes.db");
 helper.setEntities(Note);
 let db: Database = await helper.getWritableDb();
 this.data.daoSession = new DaoMaster(db).newSession();
 ```

#### 2. 加密库在AbilityStage.ets进行初始化

 ```
 let helper: ExampleOpenHelper = new ExampleOpenHelper(context, "notes.db");
 //设定数据加密密钥，加密后不可变更，加密和非加密库暂不能切换（普通数据库不能在设定为加密库，加密库不能变更为普通库，一经生成不可变更）
 helper.setEncrypt(true);
 //将所有的表 (新增,修改,已存在)加到全局
 helper.setEntities(Note);
 let db: Database = await helper.getWritableDb();
 this.data.daoSession = new DaoMaster(db).newSession();
 ```

#### 3. 获取daoSession和Dao对象：在调用页面，如demo中的index页中

 ```
private aboutToAppear() {
    daoSess =  GlobalContext.getContext().getValue("daoSession") as DaoSession;
    that.daoSession = daoSess;
    noteDaos = that.daoSession.getBaseDao(Note);
}
 ```

#### 4. 添加和移除监听

 ```
 /*
   *监听
   */
 private tabListener(): OnTableChangedListener<any>{
    let that = this;
    return {
      async onTableChanged(t: any, err, action: TableAction) {
        if (action == TableAction.INSERT) {          
          await that.updateNotes();
        } else if(action == TableAction.UPDATE){
          await that.updateNotes();
        } else if(action == TableAction.DELETE){
          await that.updateNotes();
        } else if (action == TableAction.QUERY) {
        }
      }
    }
  }
  /*
   *添加监听
   */
  noteDaos.addTableChangedListener(that.tabListener())；
  
  /**
   * 移除监听
   */
  noteDaos.removeTableChangedListener();
      
 ```

#### 5. 数据库操作

```
//新增
let date = new Date()
let comment = "Added on " + date.toLocaleString();

let note = new Note();
note.setText(this.noteText);
note.setComment(comment);
note.setDate(new Date());
note.setType(NoteType[NoteType.TEXT]);
noteDaos.insert(note);


//查询
let entityClass = GlobalContext.getContext().getValue(GlobalContext.KEY_CLS) as Record<string, Object>;
let properties = entityClass.Note as Record<string, Property>;
let notesQuery = that.noteDao.queryBuilder().orderAsc(properties.text).build();
this.arr = await this.notesQuery.list();

或者

let entityClass = GlobalContext.getContext().getValue(GlobalContext.KEY_CLS) as Record<string, Object>;
let properties = entityClass.Note as Record<string, Property>;
let query = this.noteDao.queryBuilder().orderAsc(properties.text).buildCursor();
let a = await query.list();


//删除
let entityClass = GlobalContext.getContext().getValue(GlobalContext.KEY_CLS) as Record<string, Object>;
let properties = entityClass.Note as Record<string, Property>;
let deleteQuery = this.noteDao.queryBuilder().where(properties.text.eq("bbb"))
  .buildDelete();
deleteQuery.executeDeleteWithoutDetachingEntities()
```

## 接口说明

接口准备

``` 
   // regular SQLite database
   let helper: ExampleOpenHelper = new ExampleOpenHelper(this.context, "notes.db");
   //设定数据加密密钥，加密后不可变更，加密和非加密库暂不能切换（普通数据库不能在设定为加密库，加密库不能变更为普通库，一经生成不可变更）
   helper.setEncrypt(true);
   //将所有的表(新增,修改,已存在)加到全局
   helper.setEntities(Note, Student, Teacher, JoinManyToDateEntity, DateEntity);
   let db: Database = await helper.getWritableDb();
```

1. 新增
   `noteDao.insert(note)`
2. 修改
   `noteDao.update(note)`
3. 删除
   `noteDao.delete(note)`
4. 主键删除
   `noteDao.deleteByKey(id)`
5. 条件删除
   `noteDao.queryBuilder().where(properties['text'].eq("bbb")).buildDelete()`
6. 查询
   `noteDao.queryBuilder().list()`
7. 条件查询
   `noteDao.queryBuilder.whereOr(properties['text'].eq("aaa"), properties['text'].eq("bbb"), properties['text'].eq("ccc")).list()`
8. 缓存查询
   `noteDao.load(id)`
9. 更新数据,通过从数据库重新加载值来重置实体的所有本地更改的属性
   `noteDao.refresh(note)`
10. 链式查询
    `new inquiry().from(Note).query(Note).then((data) => { if(data)this.arr = data; })`
11. 链式条件查询
    `inquiry().from(Note).eq("ID", 2).querySingle(Note).then((data) => {if(data) this.arr = data; })`
12. 添加监听
    `noteDao.addTableChangedListener()`
13. 移除监听
    `noteDao.removeTableChangedListener()`
14. 保存(无则新增,有则更新)
    `noteDao.save(note)`
15. 备份数据库
    `Migration.backupDB(dbName, tableName, version, context)`
16. 升级数据库
    `migration.execute(context)`
17. 数据库从资源文件导入数据
    `executeSqlScript(resourceMgr: any, db: Database, rawFilename: string)`
18. 原始sql语句查询
    `rawQueries(sql: string, selectionArgs: Array<any>)`
19. ToMany 查询
    `queryToManyListByColumnName(toManyColumnName: string, arr: string[])`
20. JoinEntity
    `queryToManyListByColumnName(toManyColumnName: string, arr: string[])`
21. ToOne 查询
    `queryDeep(where: string, selectionArg: string[])`

单元测试用例详情见[TEST.md](https://gitee.com/openharmony-sig/dataORM/blob/master/TEST.md)

## 约束与限制

- DevEco Studio: 4.0 Release(4.0.3.513), SDK: API10 (4.0.10.10)

- DevEco Studio 版本：4.0 Release（4.0.3.418），OpenHarmony SDK:（4.0.10.6）

## 目录结构

```
|---- dataORM  
|     |---- entry  # 示例代码文件夹
|     |---- dataORM  # dataORM库文件夹
|               |----annotation # 注解相关
|               |----common # 公用类包
|               |----converter # convert注解辅助
|               |----database # 数据库相关
|               |----dbflow # 链式查询
|                   |----base # 链式封装
|                   |----listener # 监听回调
|               |----identityscope # 缓存相关
|               |----internal # 内部调用文件
|               |----query # 查询
|           |---- index.ts  # 对外接口
|     |---- README.MD  # 安装使用方法
```

## 贡献代码

使用过程中发现任何问题都可以提 [Issue](https://gitee.com/openharmony-sig/dataORM/issues)
给我们，当然，我们也非常欢迎你给我们发 [PR](https://gitee.com/openharmony-sig/dataORM/pulls) 。

## 开源协议

本项目基于 [Apache License 2.0](https://gitee.com/openharmony-sig/dataORM/blob/master/LICENSE) ，请自由地享受和参与开源。

## 遗留问题

1、AbstractDao类下的save(entity: T)、insertOrReplace(entity: T)接口，在API9中暂不支持有则更新，无则新增的能力。