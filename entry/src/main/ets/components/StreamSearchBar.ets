import router from '@ohos.router';
import promptAction from '@ohos.promptAction'

@Component
@Preview
export struct StreamSearchBar {
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
