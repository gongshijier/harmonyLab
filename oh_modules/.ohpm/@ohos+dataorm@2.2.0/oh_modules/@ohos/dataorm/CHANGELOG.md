## 2.2.0
- 新增支持以下功能：
  - 支持Convert注解的能力
  - 支持Transient注解的能力
  - 支持Embedded注解的能力
  - 支持Entity注解中，增加禁止创建表的高级标志createInDb
- 优化以下功能：
  - 去除在创建数据库时，全局变量的配置
  - 更改onCreate_D及其onUpgrade_D方法名分别为：onCreateDatabase及其onUpgradeDatabase
  - 去除在创建数据库时，主动调用onCreate_D
  - 优化数据库版本升级功能
  - 在用CursorQuery查询的时候，在CursorQuery中新增list接口封装，少了dao.convertCursor2Entity(query)动作，可以直接调用list接口

## 2.1.1
- 修复部分接口时序错误问题

## 2.1.0
- 适配ArkTS语法
- globalThis全局设置更改单例模式GlobalContext设置

## 2.0.3
- 修复了 query aaa 按钮失效的问题
- 修复了 Query aaa bbb ccc 按钮失效的问题

## 2.0.2
- 添加复合主键功能 
- 修改代码中的单词错误，并规范命名

## 2.0.1

- 修复使用insertOrReplace()接口的逻辑问题
- 修复数据库的@Columns装饰器的columnName必须要和被其修饰的属性名保持一样的问题
- 修复demo添加数据之后save和修改的逻辑问题

## 2.0.0

- 适配DevEco Studio 版本：3.1 Beta2（3.1.0.400），OpenHarmony SDK:API9（3.2.11.9）

## 1.1.4

- 增加支持以下功能：

1.支持多个表之间查询的功能，也就是join查询（JoinEntry） 
2.支持一对多ToMany查询
3.支持关系映射用来表示一个实体与另一个实体的一对一关系的查询（ToOne）
4.关联查询的升、降序排列（OrderBy）
5.索引表的创建

## 1.1.3

- 升级到apiV9
- 修改数据库加密库加密方式（以前版本通过加密键值进行加密，现通过bool开关进行控制，值为true值时为加密库）
- 添加注解使用方式说明
- 修改列名和实体名称不一致数据操作异常问题


## 1.1.2

- 修复方法名和原生属性名冲突的问题
- 修复数据库备份的问题（通过库名称备份库，若存在则执行失败。示例里给的固定库名，只能生效一次）

## 1.1.1

- 修复npm引用包编译报错的问题

## 1.1.0

- 变更数据库备份实现方式

## 1.0.3

1. 修复在3.2beta版本Add数据无响应的问题
2. 添加支持数据回滚功能
3. 插入逻辑异常抛出处理
4. 标签处理
5. 优化sqlite支持的枚举类型

## 1.0.2

- api8升级到api9

## 1.0.1

- 新增以下功能：

1. 数据库加密功能

2. 数据库数据导入

3. sql原始语句查询

## 1.0.0

- 支持以下功能：

1. 数据库数据插入功能
2. 数据库查询功能
3. 数据库编辑功能
4. 数据库删除功能
5. 数据库缓存功能
6. 数据库实体和表列关系映射功能
7. 数据库表创建、删除等sql语句生成
8. 数据库备份功能
9. 数据库升级功能
10. 数据库数据操作监听

