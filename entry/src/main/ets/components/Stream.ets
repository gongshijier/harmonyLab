import hilog from '@ohos.hilog'
import { PageConstants } from '../constant/PageConstants'
import { StyleConstants } from '../constant/StyleConstants'
import { Flavor } from '../feed/card/Flavor'
import { TabInfo } from '../model/TabInfo'
import { categoryTabs } from '../viewmodel/MainPage'
import { FeedList } from './FeedList'
import { StreamSearchBar } from './StreamSearchBar'

@Component
@Preview
export struct Stream {
  private tag: string = "Stream"
  @StorageLink("searchDefault") searchDefault: string = "王毅同新加坡外长通电话"

  build() {
    Column() {
      StreamSearchBar({
        barHeight: 44,
        isShowHeatImg: false
      })
      Tabs({
        barPosition: BarPosition.Start,
        index: 0
      }) {
        ForEach(categoryTabs, (item, index) => {
          TabContent() {
            FeedList({ flavor: this.getFlavor('' + index) })
          }.tabBar(this.CategoryTab(item))
        })
      }
      .barWidth(StyleConstants.FULL_WIDTH)
      .barHeight($r('app.float.category_tab_strip_height'))
      .vertical(false)
      .scrollable(true)
      .onChange((index: number) => {
        hilog.info(0x00000, this.tag, "change tab ...")
      })
    }
    .margin({
      top: 30 //状态栏高度
    })
    .width('100%')
    .height('100%')
    .backgroundColor(Color.White)
  }

  /**
   * get feed flavor by key
   */
  getFlavor(key: string): Flavor {
    var flavor = new Flavor()
    switch (key) {
      case '1':
        flavor.lanes = 2
        break;

      case '3':
        flavor.lanes = 2
        break;

      default:
        break;
    }
    return flavor
  }

  @Builder CategoryTab(info: TabInfo) {
    Column({ space: PageConstants.BUTTON_SPACE }) {
      Text(info.title)
        .fontColor(Color.Black)
        .opacity(StyleConstants.FULL_OPACITY)
        .fontWeight(320)
        .textAlign(TextAlign.Center)
        .fontSize($r('app.float.category_tab_font_size'))

      Divider()
        .strokeWidth('0.4')
    }
    .width(StyleConstants.FULL_WIDTH)
    .height(StyleConstants.FULL_HEIGHT)
    .alignItems(HorizontalAlign.Center)
    .justifyContent(FlexAlign.Center)
    .backgroundColor(Color.White)
  }
}