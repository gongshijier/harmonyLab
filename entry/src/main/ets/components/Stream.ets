import hilog from '@ohos.hilog'
import { PageConstants } from '../constant/PageConstants'
import { StyleConstants } from '../constant/StyleConstants'
import { TabInfo } from '../model/TabInfo'
import { categoryTabs } from '../viewmodel/MainPage'
import { FeedList } from './FeedList'
import { HomePageSearchBar } from './HomePageSearchBar'

@Component
@Preview
export struct Stream {
  private tag: string = "Stream"

  build() {
    Column() {
      HomePageSearchBar()
      Tabs({
        barPosition: BarPosition.Start,
        index: 0
      }) {
        TabContent() {
          FeedList()
        }.tabBar(this.CategoryTab(categoryTabs[0]))

        TabContent() {

        }.tabBar(this.CategoryTab(categoryTabs[1]))

        TabContent() {

        }.tabBar(this.CategoryTab(categoryTabs[2]))

        TabContent() {
        }.tabBar(this.CategoryTab(categoryTabs[3]))

        TabContent() {
        }.tabBar(this.CategoryTab(categoryTabs[4]))

        TabContent() {
        }.tabBar(this.CategoryTab(categoryTabs[5]))

        TabContent() {
        }.tabBar(this.CategoryTab(categoryTabs[6]))

        TabContent() {
        }.tabBar(this.CategoryTab(categoryTabs[7]))
      }
      .barWidth(StyleConstants.FULL_WIDTH)
      .barHeight($r('app.float.category_tab_strip_height'))
      .vertical(false)
      .scrollable(true)
      .onChange((index: number) => {
        hilog.info(0x00000, this.tag, "change tab ...")
      })
    }
    .width('100%')
    .height('100%')
    .backgroundColor(Color.Green)
  }



  @Builder CategoryTab(info: TabInfo) {
    Column({ space: PageConstants.BUTTON_SPACE }) {
      Text(info.title)
        .fontColor($r('app.color.focus_color'))
        .opacity(StyleConstants.FULL_OPACITY)
        .fontWeight(StyleConstants.FONT_WEIGHT_FIVE)
        .textAlign(TextAlign.Center)
        .fontSize($r('app.float.category_tab_font_size'))
    }
    .width(StyleConstants.FULL_WIDTH)
    .height(StyleConstants.FULL_HEIGHT)
    .alignItems(HorizontalAlign.Center)
    .justifyContent(FlexAlign.Center)
    .backgroundColor(Color.Black)
  }
}