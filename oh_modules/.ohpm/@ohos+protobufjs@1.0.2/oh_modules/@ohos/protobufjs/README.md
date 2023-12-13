# protobuf

## 介绍

ProtoBuf(protocol buffers) 是一种语言无关、平台无关、可扩展的序列化结构数据的方法，它可用于（数据）通信协议、数据存储等。,是一种灵活，高效，自动化机制的结构数据序列化方法比XML更小,更快,更为简单。

本项目主要是OpenHarmony系统下以[protobuf.js 5.0.3](https://github.com/protobufjs/protobuf.js)为主要依赖开发，主要接口针对OpenHarmony系统进行合理的适配研发。

## 下载安装

1.安装

```
ohpm install @ohos/protobufjs
```

2.在需要使用的页面导入protobuf

```
import protobuf from '@ohos/protobufjs'
```

## 使用说明

**protobuf支持的输入格式**

1.proto格式字符串

```
const protoStr = 'syntax = "proto3"; package com.user;message UserLoginResponse{string sessionId = 1;string userPrivilege = 2;bool isTokenType = 3;string formatTimestamp = 4;}';
```

2.proto文件映射的json字符串

```
const protoJson = '{
      "package": "com.user",
      "messages": [
        {
          "name": "UserLoginResponse",
          "fields": [
            {
              "rule": "optional",
              "type": "string",
              "name": "sessionId",
              "id": 1
            },
            {
              "rule": "optional",
              "type": "string",
              "name": "userPrivilege",
              "id": 2
            },
            {
              "rule": "optional",
              "type": "bool",
              "name": "isTokenType",
              "id": 3
            },
            {
              "rule": "optional",
              "type": "string",
              "name": "formatTimestamp",
              "id": 4
            }
          ]
        }
      ]
}'
```

3.proto文件

在resource->rawfile文件夹下按照 .proto文件格式定义消息体结构，如：userproto.proto文件。

```
syntax = "proto3";

package com.user;
message UserLoginResponse{
   string sessionId = 1;
   string userPrivilege = 2;
   bool isTokenType = 3;
   string formatTimestamp = 4;
}
```

4.json文件

在resource->rawfile文件夹下存放proto文件映射的json文件，参照第二点。

**对象编解码**

1.在resource->rawfile文件夹下按照 .proto文件格式定义消息体结构，如：userproto.proto文件。

```
syntax = "proto3";

package com.user;
message UserLoginResponse{
   string sessionId = 1;
   string userPrivilege = 2;
   bool isTokenType = 3;
   string formatTimestamp = 4;
}
```

2.读取.proto 文件

```
let builder = await Protobuf.loadProtoFile("userproto.proto", null, null, getContext(this).resourceManager)
```

3.对象编码

```
// 构建消息体
var UserLoginResponse = builder.build("com.user.UserLoginResponse");
let userLoginData = {
    sessionId: "testAsynchronouslyLoadProtoFile",
    userPrivilege: "John123",
    isTokenType: false,
    formatTimestamp: "12342222"
  };

// 对象编码的两种方式
// 方式一：通过消息体静态编码方法进行编码
var arrayBuffer = UserLoginResponse.encode(userLoginData).toArrayBuffer();

// 方式二：通过消息体实例进行编解码
var msg = new UserLoginResponse(userLoginData);
var arrayBuffer = msg.toArrayBuffer();
```

4.对象解码

```
let decode = UserLoginResponse.decode(arrayBuffer)
```

**主要接口示例：**

1.proto字符串编解码

```
Button("proto字符串编解码")
  .width('80%')
  .type(ButtonType.Capsule)
  .backgroundColor('#0D9FFB')
  .onClick(async () => {
    try {
      // 1.创建protbuf.Builder对象：用于构造协议消息体。
      var builder = protobuf.newBuilder();
      
      // 2.加载proto字符串：解析协议消息体定义。
      var root = await protobuf.loadProto(protoStr, builder, "user.proto");
      
      // 3.构建协议消息体。
      var UserLoginResponse = root.build("com.user.UserLoginResponse");
      
	  // 设置编解码数据
      const userLogin = {
        sessionId: "loadProto",
        userPrivilege: "John123",
        isTokenType: false,
        formatTimestamp: "12342222"
      };
      
	  // 4.实例Message消息体：通过builder找到协议名后会产生Message，创建符合协议结构的数据对象，作为参数实例协议消息体。
      var msg = new UserLoginResponse(userLogin);
      
      // 5.消息体编码：可用于通信传递或存储
      var arrayBuffer = msg.toArrayBuffer();
      
      // 6.消息体解码：得到原始消息体内容
      var decodeMsg = UserLoginResponse.decode(arrayBuffer);
    } catch (error) {
      console.info('protobuf single file catch error: ' + error)
    }
  });
```

2.json字符串编解码

```
Button("json字符串编解码")
  .width('80%')
  .type(ButtonType.Capsule)
  .backgroundColor('#0D9FFB')
  .onClick(async () => {
    try {
      // 1.创建protbuf.Builder对象：用于构造协议消息体。
      var builder = protobuf.newBuilder();
      
      // 2.加载json字符串：解析协议消息体定义。
      var root = await protobuf.loadProto(protoJson, builder, "user.json");
      
      // 3.构建协议消息体。
      var UserLoginResponse = root.build("com.user.UserLoginResponse");
      
	  // 设置编解码数据
      const userLogin = {
        sessionId: "loadJson",
        userPrivilege: "John123",
        isTokenType: false,
        formatTimestamp: "12342222"
      };
      
	  // 4.实例Message消息体：通过builder找到协议名后会产生Message，创建符合协议结构的数据对象，作为参数实例协议消息体。
      var msg = new UserLoginResponse(userLogin);
      
      // 5.消息体编码：可用于通信传递或存储
      var arrayBuffer = msg.toArrayBuffer();
      
      // 6.消息体解码：得到原始消息体内容
      var decodeMsg = UserLoginResponse.decode(arrayBuffer);
    } catch (error) {
      console.info('protobuf single file catch error: ' + error)
    }
  });
```

3.同步方式进行proto文件编解码

```
Button("同步方式进行proto文件编解码")
  .width('80%')
  .type(ButtonType.Capsule)
  .backgroundColor('#0D9FFB')
  .onClick(async () => {
    try {
    	// 读取文件需要借助全球化资源子系统中的ResourceManager来进行，支持多种方式获取
    	// 方式一： 通过GlobalContext对象保存ability上下文中的resourceManager对象
    	// 方式二： 通过getContext()方式获取
    	// 在pages页面中获取: getContext(this).resourceManager
    	let context: Context = GlobalContext.getContext().getObject("context") as Context;
        var builder = await protobuf.loadProtoFile('userproto.proto', null, null, context.resourceManager);
        if (!builder) {
          console.error('protobuf codec: builder is null|undefined.');
          return;
        }
        var UserLoginResponse = builder.build("com.user.UserLoginResponse");
        var msg = new UserLoginResponse(this.userLogin);
        var arrayBuffer = msg.toArrayBuffer();
        console.log("protobuf arrayBuffer:" + new Uint8Array(arrayBuffer));

        var decodeMsg = UserLoginResponse.decode(arrayBuffer);
        console.log("protobuf decode:" + JSON.stringify(decodeMsg));
      } catch (error) {
        console.info('protobuf single file catch error: ' + error)
      }
  });
```

4.异步方式进行proto文件编解码

```
Button("异步方式进行proto文件编解码")
  .width('80%')
  .type(ButtonType.Capsule)
  .backgroundColor('#0D9FFB')
  .onClick(() => {
    try {
      let context: Context = GlobalContext.getContext().getObject("context") as Context;
      protobuf.loadProtoFile('userproto.proto', (error, builder) => {
        if (error) {
          console.error('protobuf codec catch error: ' + error);
          return;
        }
        if (!builder) {
          console.error('protobuf codec: builder is null|undefined.');
          return;
        }
        var UserLoginResponse = builder.build("com.user.UserLoginResponse");
        var msg = new UserLoginResponse(this.userLogin);
        console.log("protobuf msg:" 
        var arrayBuffer = msg.toArrayBuffer();
        console.log("protobuf arrayBuffer:" + new Uint8Array(arrayBuffer));
        this.bufferData = Array.prototype.toString.call(new Uint8Array(arrayBu
        var decodeMsg = UserLoginResponse.decode(arrayBuffer);
        console.log("protobuf decode:" + JSON.stringify(decodeMsg));
        this.decodeData = JSON.stringify(decodeMsg);
      }, null, context.resourceManager);
    } catch (error) {
      console.info('protobuf single file catch error: ' + error)
    }
  });
```

## 接口说明

**loadProto**

static loadProto(proto:string,builder?:ProtoBuf.Builder|string|{root: string, file: string},filename?:string|{root: string, file: string}) :ProtoBuf.Builder;

加载proto格式字符串，进行内容解析，并返回协议消息体构建器。

参数：

| 参数名   | 类型                                                         | 必填 | 说明                                                   |
| -------- | ------------------------------------------------------------ | ---- | ------------------------------------------------------ |
| proto    | string                                                       | 是   | proto格式的字符串。                                    |
| builder  | [Builder]() &#124;string &#124; {root: string, file: string} | 否   | 指定已有的协议消息体构建器，如果未指定将重新创建一个。 |
| filename | string &#124; {root: string, file: string}                   | 否   | 如果知道对应的文件名称，必须为导入文件指定。           |

返回值：

| 类型    | 说明               |
| ------- | ------------------ |
| Builder | 协议消息体构建器。 |

**protoFromString**

static protoFromString(proto:string,builder?:ProtoBuf.Builder|string|{root: string, file: string},filename?:string|{root: string, file: string}) :ProtoBuf.Builder;

loadProto方法的别名，加载proto格式字符串，进行内容解析，并返回协议消息体构建器。

参数

| 参数名   | 类型                                                         | 必填 | 说明                                                   |
| -------- | ------------------------------------------------------------ | ---- | ------------------------------------------------------ |
| proto    | string                                                       | 是   | proto格式的字符串。                                    |
| builder  | [Builder]() &#124;string &#124; {root: string, file: string} | 否   | 指定已有的协议消息体构建器，如果未指定将重新创建一个。 |
| filename | string &#124; {root: string, file: string}                   | 否   | 如果知道对应的文件名称，必须为导入文件指定。           |

返回值：

| 类型    | 说明               |
| ------- | ------------------ |
| Builder | 协议消息体构建器。 |

**loadProtoFile**

static loadProtoFile(filename:string|{root: string, file: string}, callback?=(error?:Error,builder:Protobuf.Builder)=>void,builder?:Protobuf.Builder,resourceManager: @ohos.resourceManager.ResourceManager):ProtoBuf.Builder|undefined;

加载proto文件，进行内容解析，并返回协议消息体构建器。

| 参数名          | 类型                                       | 必填 | 说明                                                         |
| --------------- | ------------------------------------------ | ---- | ------------------------------------------------------------ |
| filename        | string &#124; {root: string, file: string} | 是   | 原始文件的路径或指定'file'的对象，并为所有导入的文件覆盖'根'路径。 |
| callback        | function                                   | 否   | 成功时将接收' null '作为第一个参数，并将Builder作为第二个参数，否则将Error作为第一个参数。如果省略，文件将被同步读取。 |
| builder         | Builder                                    | 否   | 指定已有的协议消息体构建器，如果未指定将重新创建一个。       |
| resourceManager | @ohos.resourceManager.ResourceManager      | 是   | 访问应用资源的能力。                                         |

表1 callback的参数说明

| 参数名  | 类型    | 说明                                                     |
| ------- | ------- | -------------------------------------------------------- |
| error   | Error   | 如果解析成功，此参数返回'null',如果失败，返回对应Error。 |
| builder | Builder | 协议消息体构建器。                                       |

返回值：

| 类型                | 说明               |
| ------------------- | ------------------ |
| Builder &#124; null | 协议消息体构建器。 |

**protoFromFile**

static protoFromFile(filename:string|{root: string, file: string}, callback?=(error?:Error,builder:Protobuf.Builder)=>void,builder?:Protobuf.Builder,resourceManager: @ohos.resourceManager.ResourceManager):ProtoBuf.Builder|undefined;

loadProtoFile方法别名，加载proto文件，进行内容解析，并返回协议消息体构建器。

| 参数名          | 类型                                       | 必填 | 说明                                                         |
| --------------- | ------------------------------------------ | ---- | ------------------------------------------------------------ |
| filename        | string &#124; {root: string, file: string} | 是   | 原始文件的路径或指定'file'的对象，并为所有导入的文件覆盖'根'路径。 |
| callback        | function                                   | 否   | 成功时将接收' null '作为第一个参数，并将Builder作为第二个参数，否则将Error作为第一个参数。如果省略，文件将被同步读取。 |
| builder         | Builder                                    | 否   | 指定已有的协议消息体构建器，如果未指定将重新创建一个。       |
| resourceManager | @ohos.resourceManager.ResourceManager      | 是   | 访问应用资源的能力。                                         |

表1 callback的参数说明

| 参数名  | 类型    | 说明                                                     |
| ------- | ------- | -------------------------------------------------------- |
| error   | Error   | 如果解析成功，此参数返回'null',如果失败，返回对应Error。 |
| builder | Builder | 协议消息体构建器。                                       |

返回值：

| 类型                     | 说明               |
| ------------------------ | ------------------ |
| Builder &#124; undefined | 协议消息体构建器。 |

**loadJson**

static loadJson(json:string|any, builder?:Protobuf.Builder|string| {root: string, file: string}, filename?: string| {root: string, file: string} ): ProtoBuf.Builder;

参数：

| 参数名   | 类型                                                         | 必填 | 说明                                                   |
| -------- | ------------------------------------------------------------ | ---- | ------------------------------------------------------ |
| json     | string &#124; any                                            | 是   | proto格式的json字符串或者proto文件对应的json对象。     |
| builder  | [Builder]() &#124;string &#124; {root: string, file: string} | 否   | 指定已有的协议消息体构建器，如果未指定将重新创建一个。 |
| filename | string &#124; {root: string, file: string}                   | 否   | 如果知道对应的文件名称，必须为导入文件指定。           |

返回值：

| 类型    | 说明               |
| ------- | ------------------ |
| Builder | 协议消息体构建器。 |

**loadJsonFile**

static loadJsonFile(filename:string|{root: string, file: string}, callback?=(error?:Error,builder:Protobuf.Builder)=>void,builder?:Protobuf.Builder,resourceManager: @ohos.resourceManager.ResourceManager):ProtoBuf.Builder|undefined;

加载proto文件，进行内容解析，并返回协议消息体构建器。

| 参数名          | 类型                                       | 必填 | 说明                                                         |
| --------------- | ------------------------------------------ | ---- | ------------------------------------------------------------ |
| filename        | string &#124; {root: string, file: string} | 是   | 原始文件的路径或指定'file'的对象，并为所有导入的文件覆盖'根'路径。 |
| callback        | function                                   | 否   | 成功时将接收' null '作为第一个参数，并将Builder作为第二个参数，否则将Error作为第一个参数。如果省略，文件将被同步读取。 |
| builder         | Builder                                    | 否   | 指定已有的协议消息体构建器，如果未指定将重新创建一个。       |
| resourceManager | @ohos.resourceManager.ResourceManager      | 是   | 访问应用资源的能力。                                         |

表1 callback的参数说明

| 参数名  | 类型    | 说明                                                     |
| ------- | ------- | -------------------------------------------------------- |
| error   | Error   | 如果解析成功，此参数返回'null',如果失败，返回对应Error。 |
| builder | Builder | 协议消息体构建器。                                       |

返回值：

| 类型                     | 说明               |
| ------------------------ | ------------------ |
| Builder &#124; undefined | 协议消息体构建器。 |

**newBuilder**

static newBuilder():Protobuf.Builder;

返回值：

| 类型    | 说明               |
| ------- | ------------------ |
| Builder | 协议消息体构建器。 |

**Util**

以下接口在Util对象内，须通过Protobuf.Util方式调用。

**fetch**

static fetch(path:string, callback?:(content?:string)=> void):string|undefined.

获取文件内容，需要先设置资源文件读取对象ResourceManager。

参数：

| 参数名   | 类型                     | 必填 | 说明                                                         |
| -------- | ------------------------ | ---- | ------------------------------------------------------------ |
| path     | string                   | 是   | 资源文件路径。                                               |
| callback | (content?:string)=> void | 否   | 回调接收资源的内容。如果省略，资源将被同步获取。如果请求失败，内容将为空。 |

返回值：

| 类型                    | 说明           |
| ----------------------- | -------------- |
| string &#124; undefined | 资源文件内容。 |

**toCamelCase**

static toCamelCase(str:string):string;

用于将字符串转换为驼峰格式。

参数：

| 参数名 | 类型   | 必填 | 说明                     |
| ------ | ------ | ---- | ------------------------ |
| str    | string | 是   | 将字符串转换为驼峰格式。 |

返回值：

| 类型   | 说明             |
| ------ | ---------------- |
| string | 驼峰格式字符串。 |

**Builder**

构建协议消息体的构建器，提供构建协议消息的功能。

**isMessage**

static isMessage(def:Object):boolean;

用于判断指定对象是否为消息体。

参数：

| 参数名 | 类型   | 必填 | 说明                       |
| ------ | ------ | ---- | -------------------------- |
| def    | Object | 是   | 判断指定对象是否为消息体。 |

返回值：

| 类型    | 说明                   |
| ------- | ---------------------- |
| boolean | 指示对象是否为消息体。 |

**isMessageField**

static isMessageField(def:Object):boolean;

用于判断指定对象是否为消息体的字段。

参数：

| 参数名 | 类型   | 必填 | 说明                             |
| ------ | ------ | ---- | -------------------------------- |
| def    | Object | 是   | 判断指定对象是否为消息体的字段。 |

返回值：

| 类型    | 说明                         |
| ------- | ---------------------------- |
| boolean | 指示对象是否为消息体的字段。 |

**isEnum**

static isEnum(def:Object):boolean;

用于判断指定对象是否为枚举对象。

参数：

| 参数名 | 类型   | 必填 | 说明                         |
| ------ | ------ | ---- | ---------------------------- |
| def    | Object | 是   | 判断指定对象是否为枚举对象。 |

返回值：

| 类型    | 说明                     |
| ------- | ------------------------ |
| boolean | 指示对象是否为枚举对象。 |

**build**

build(path?: string | string[]) : Protobuf.Builder.Message | Object;

用于构建协议，解析所有定义，返回构建的协议消息包。

参数：

| 参数名 | 类型                   | 必填 | 说明               |
| ------ | ---------------------- | ---- | ------------------ |
| path   | string &#124; string[] | 否   | 协议内包完整路径。 |

返回值：

| 类型                                   | 说明         |
| -------------------------------------- | ------------ |
| Protobuf.Builder.Message &#124; Object | 协议消息包。 |

**lookup**

lookup(path?: string, excludeNonNamespace?: boolean) : ProtoBuf.Reflect.T;

用于构建协议消息包。

参数：

| 参数名              | 类型    | 必填 | 说明                                       |
| ------------------- | ------- | ---- | ------------------------------------------ |
| path                | string  | 否   | 协议内包完整路径。                         |
| excludeNonNamespace | boolean | 否   | 排除非命名空间类型，如fields,默认为false。 |

返回值：

| 类型               | 说明         |
| ------------------ | ------------ |
| ProtoBuf.Reflect.T | 反射的描述。 |

**Message**

提供协议消息体的编解码方法。

**constructor**

new Message(values:Object);

构建消息体实例。

| 参数名 | 类型   | 必填 | 说明                           |
| ------ | ------ | ---- | ------------------------------ |
| values | Object | 是   | 符合协议消息体结构的数据对象。 |

**encode**

static encode(data: Object, buffer?: ByteBuffer | boolean, noVerify?: boolean):ByteBuffer;

将协议消息体编码为ByteBuffer格式。

参数：

| 参数名   | 类型    | 必填 | 说明                                                         |
| -------- | ------- | ---- | ------------------------------------------------------------ |
| data     | string  | 是   | 消息体对应的数据。                                           |
| buffer   | boolean | 否   | 指定编解码结果的ByteBuffer对象，如果未指定，将创建一个新的。 |
| noVerify | boolean | 否   | 是否不验证字段值，默认为false。                              |

返回值：

| 类型       | 说明                                   |
| ---------- | -------------------------------------- |
| ByteBuffer | 协议消息体数据编码后的ByteBuffer数据。 |

**encode**

encode(buffer?: ByteBuffer| boolean, noVerify?: boolean): ByteBuffer;

将消息编码为ByteBuffer格式数据。

参数：

| 参数名   | 类型    | 必填 | 说明                                                         |
| -------- | ------- | ---- | ------------------------------------------------------------ |
| buffer   | string  | 是   | 指定编解码结果的ByteBuffer对象，如果未指定，将创建一个新的。 |
| noVerify | boolean | 否   | 是否不验证字段值，默认为false。                              |

返回值：

| 类型       | 说明                                   |
| ---------- | -------------------------------------- |
| ByteBuffer | 协议消息体数据编码后的ByteBuffer数据。 |

**encodeAB**

encodeAB():ArrayBuffer;

将消息编码为ArrayBuffer格式。

返回值：

| 类型        | 说明                                    |
| ----------- | --------------------------------------- |
| ArrayBuffer | 协议消息体数据编码后的ArrayBuffer数据。 |

**toArrayBuffer**

toArrayBuffer():ArrayBuffer;

encodeAB方法的别名，用于将消息编码为ArrayBuffer格式。

返回值：

| 类型        | 说明                                    |
| ----------- | --------------------------------------- |
| ArrayBuffer | 协议消息体数据编码后的ArrayBuffer数据。 |

**calculate**

calculate(): Number;

计算消息体长度。

返回值：

| 类型   | 说明               |
| ------ | ------------------ |
| Number | 协议消息体的长度。 |

**encodeDelimited**

encodeDelimited(buffer?: ByteBuffer| boolean, noVerify?: boolean): ByteBuffer;

将消息编码为ByteBuffer格式数据。

参数：

| 参数名   | 类型    | 必填 | 说明                                                         |
| -------- | ------- | ---- | ------------------------------------------------------------ |
| buffer   | string  | 是   | 指定编解码结果的ByteBuffer对象，如果未指定，将创建一个新的。 |
| noVerify | boolean | 否   | 是否不验证字段值，默认为false。                              |

返回值：

| 类型       | 说明                                   |
| ---------- | -------------------------------------- |
| ByteBuffer | 协议消息体数据编码后的ByteBuffer数据。 |

**encode64**

encode64(): string;

将消息编码为base64编码的字符串。

返回值：

| 类型   | 说明                             |
| ------ | -------------------------------- |
| string | 将消息编码为base64编码的字符串。 |

**toBase64**

toBase64(): string;

encode64方法的别名，将消息编码为base64编码的字符串。

返回值：

| 类型   | 说明                             |
| ------ | -------------------------------- |
| string | 将消息编码为base64编码的字符串。 |

**encodeHex**

encodeHex(): string;

将消息编码为十六进制编码的字符串。

返回值：

| 类型   | 说明                               |
| ------ | ---------------------------------- |
| string | 将消息编码为十六进制编码的字符串。 |

**toHex**

toHex(): string;

encodeHex方法的别名，将消息编码为十六进制编码的字符串。

返回值：

| 类型   | 说明                               |
| ------ | ---------------------------------- |
| string | 将消息编码为十六机制编码的字符串。 |

**encodeJson**

encodeJson(): string;

将消息编码为Json字符串。

返回值：

| 类型   | 说明                     |
| ------ | ------------------------ |
| string | 将消息编码为Json字符串。 |

**toRaw**

toRaw(binaryAsBase64?:boolean, longsAsStrings:boolean):Object;

返回消息的原始负载。

参数：

| 参数名             | 类型    | 必填 | 说明                                                         |
| ------------------ | ------- | ---- | ------------------------------------------------------------ |
| databinaryAsBase64 | boolean | 否   | 指示是否包含二进制数据作为base64字符串而不是缓冲区，默认为false。 |
| longsAsStrings     | boolean | 是   | 指示是否将long编码为字符串。                                 |

返回值：

| 类型   | 说明                 |
| ------ | -------------------- |
| Object | 返回消息的原始负载。 |

**decode**

static decode(data: ByteBuffer|ArrayBuffer|Buffer|string, length?: Number| string, enc?: string):Protobuf.Builder.Message;

从指定的缓冲区或字符串解码消息。

参数：

| 参数名 | 类型                                                      | 必填 | 说明                                                         |
| ------ | --------------------------------------------------------- | ---- | ------------------------------------------------------------ |
| data   | ByteBuffer &#124; ArrayBuffer &#124; Buffer &#124; string | 是   | 要解码的数据。                                               |
| length | Number &#124; string                                      | 否   | 消息体长度，默认解码所有数据。                               |
| enc    | string                                                    | 否   | 如果缓冲区是字符串，将进行编码，支持hex，base64，utf8(不推荐)，默认为base64 |

返回值：

| 类型                     | 说明                             |
| ------------------------ | -------------------------------- |
| Protobuf.Builder.Message | 从指定的缓冲区或字符串解码消息。 |

**decode64**

static decode64(str:string):Protobuf.Builder.Message;

从指定的base64编码字符串解码消息。

参数：

| 参数名 | 类型   | 必填 | 说明                           |
| ------ | ------ | ---- | ------------------------------ |
| str    | string | 是   | 要解码的base64编码字符串数据。 |

返回值：

| 类型                     | 说明                               |
| ------------------------ | ---------------------------------- |
| Protobuf.Builder.Message | 从指定的base64编码字符串解码消息。 |

**decodeHex**

static decodeHex(str:string):Protobuf.Builder.Message;

从指定的十六进制编码字符串解码消息。

参数：

| 参数名 | 类型   | 必填 | 说明                             |
| ------ | ------ | ---- | -------------------------------- |
| str    | string | 是   | 要解码的十六进制编码字符串数据。 |

返回值：

| 类型                     | 说明                                 |
| ------------------------ | ------------------------------------ |
| Protobuf.Builder.Message | 从指定的十六进制编码字符串解码消息。 |

**decodeJson**

static decodeJson(str:string):Protobuf.Builder.Message;

从JSON字符串解码消息。

参数：

| 参数名 | 类型   | 必填 | 说明                   |
| ------ | ------ | ---- | ---------------------- |
| str    | string | 是   | 从JSON字符串解码消息。 |

返回值：

| 类型                     | 说明                   |
| ------------------------ | ---------------------- |
| Protobuf.Builder.Message | 从JSON字符串解码消息。 |

**decodeDelimited**

static decodeDelimited(buffer: ByteBuffer | ArrayBuffer | Buffer | string, enc?: string):Protobuf.Builder.Message;

从指定的缓冲区或字符串解码以长度分隔的varint32消息。

参数：

| 参数名 | 类型                                                      | 必填 | 说明                                                         |
| ------ | --------------------------------------------------------- | ---- | ------------------------------------------------------------ |
| buffer | ByteBuffer &#124; ArrayBuffer &#124; Buffer &#124; string | 是   | 指定的缓冲区或字符串。                                       |
| enc    | string                                                    | 否   | 如果缓冲区是字符串，将进行编码，支持hex，base64，utf8(不推荐)，默认为base64。 |

返回值：

| 类型                     | 说明                                                 |
| ------------------------ | ---------------------------------------------------- |
| Protobuf.Builder.Message | 从指定的缓冲区或字符串解码以长度分隔的varint32消息。 |

## 约束与限制
在下述版本验证通过：

- DevEco Studio: 4.0 (4.0.3.512), SDK: API10 (4.0.10.9)
- DevEco Studio: 4.0 Release(4.0.3.413), SDK: API10 (4.0.10.3)

## 目录结构

```
|---- protobuf
|     |---- AppScrope  # 示例代码文件夹
|     |---- entry  # 示例代码文件夹
|     |---- protobufjs  # protobufjs库文件夹
|           |---- src/main  # 模块代码
|                |---- ets/   # 模块代码
|                     |---- dist     # 打包文件
|            |---- index.ets          # 入口文件
|            |---- .ohpmignore        # ohpm发布的忽略文件
|            |---- *.json5      # 配置文件
|     |---- README.md  # 安装使用方法
|     |---- README.OpenSource  # 开源说明
|     |---- CHANGELOG.md  # 更新日志
```

## 贡献代码

使用过程中发现任何问题都可以提 [Issue](https://gitee.com/openharmony-tpc/protobuf/issues) 给我们，当然，我们也非常欢迎你给我们发 [PR](https://gitee.com/openharmony-tpc/protobuf/pulls) 。

## 开源协议

本项目基于 [BSD License](https://gitee.com/openharmony-tpc/protobuf/blob/master/LICENSE) ，请自由地享受和参与开源。
