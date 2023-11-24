/**
 * Copyright (c) 2023 Wathinst <wxz@xkzhineng.com>
 * OhBili is licensed under Mulan PSL v2.
 * You can use this software according to the terms and conditions of the Mulan PSL v2.
 * You may obtain a copy of Mulan PSL v2 at:
 * http://license.coscl.org.cn/MulanPSL2
 * THIS SOFTWARE IS PROVIDED ON AN "AS IS" BASIS, WITHOUT WARRANTIES OF ANY KIND,
 * EITHER EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO NON-INFRINGEMENT,
 * MERCHANTABILITY OR FIT FOR A PARTICULAR PURPOSE.
 * See the Mulan PSL v2 for more details.
 */

import router from '@ohos.router';
import promptAction from '@ohos.promptAction'

@Component
@Preview
export struct HomePageSearchBar {
  private isShowHeatImg: boolean = true
  private barHeight: Length = 50
  @StorageLink("isShowPage") isShowPage: boolean = true;
  @StorageLink("searchDefault") searchDefault: string = "";

  build() {
    Row() {
      Image($r('app.media.ic_home_search'))
        .width(24)
        .height(24)
      TextInput({ placeholder: this.searchDefault })
        .focusable(this.isShowPage)
        .layoutWeight(1)
        .backgroundColor(Color.Transparent)
        .onFocus(() => {
          router.pushUrl({ url: 'pages/Search', params: {
            defaultKeyword: this.searchDefault
          } });
        })
      if (this.isShowHeatImg) {
        Image($r('app.media.icon'))
          .width(36)
          .height(36)
          .borderRadius(12)
          .onClick(() => {
            promptAction.showToast({
              message: '登录功能暂未实现',
              duration: 2000
            });
          })
      }
    }
    .width('96%')
    .margin({
      top: 10,
      bottom: 10
    })
    .height(this.barHeight)
    .borderRadius(25)
    .padding({ left: 20, right: 20 })
    .backgroundColor("#eeeeee")
  }
}

@Component
export struct SearchBar {
  private keyword?: ResourceStr
  private placeholder?: ResourceStr = $r('app.string.mine')

  build() {
    Row() {
      Image($r('app.media.ic_personal_focus'))
        .width(48)
        .height(48)
        .onClick(() => {
          router.back();
        }).padding(12)
      TextInput({ text: this.keyword, placeholder: this.placeholder })
        .layoutWeight(1)
        .margin({ left: 6, right: 12 })
        .onChange((value: string) => {
          this.keyword = value;
        })
        .border({
          width: 1,
          color: Color.Gray
        })
        .height(40)
        .backgroundColor(Color.White)
        .onSubmit((enterKey: EnterKeyType) => {
          this.searchKeyword();
        })
      Text($r('app.string.module_desc')).padding(12)
        .onClick(() => {
          this.searchKeyword();
        })
    }.width('100%').height(50)
    .padding({ left: 8, right: 8 })
  }

  private searchKeyword() {
    if (this.keyword != null && this.keyword as string && (this.keyword as string) != "") {
      router.pushUrl({ url: "pages/SearchResult", params: { keyword: this.keyword } })
    } else if (this.placeholder != null && this.placeholder as string && this.placeholder != $r("app.string.home")) {
      router.pushUrl({ url: "pages/SearchResult", params: { keyword: this.placeholder } })
    } else {
      promptAction.showToast({
        message: '关键字不能为空',
        duration: 2000
      })
    }
  }
}