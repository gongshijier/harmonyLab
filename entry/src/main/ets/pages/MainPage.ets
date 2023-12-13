import hilog from '@ohos.hilog'
import { Stream } from '../components/Stream'
import { PageConstants } from '../constant/PageConstants'
import { StyleConstants } from '../constant/StyleConstants'
import { TabInfo } from '../model/TabInfo'
import { buttonInfo } from '../viewmodel/MainPage'

@Entry
@Component
@Preview
struct MainPage {
  @State message: string = 'Hello World'
  @StorageLink('IndexPage') currentIndex: number = 0

  build() {
    Column() {
      Tabs({
        barPosition: BarPosition.End,
        index: 0
      }) {
        ForEach(buttonInfo, (item, index) => {
          TabContent() {
            if (index == 0) {
              Stream()
            }
          }.tabBar(this.BottomTab(item))
        })
      }
      .barWidth(StyleConstants.FULL_WIDTH)
      .barHeight($r('app.float.vp_fifty_six'))
      .vertical(false)
      .scrollable(false)
      .onChange((index: number) => {
        this.currentIndex = index;
        hilog.info(0x00000, "hello", "hello")
      })
    }
  }

  @Builder BottomTab(info: TabInfo) {

    Column({ space: PageConstants.BUTTON_SPACE }) {
      Image(info.img)
        .objectFit(ImageFit.Contain)
        .width($r('app.float.main_image_size'))
        .height($r('app.float.main_image_size'))
      Text(info.title)
        .fontColor(Color.Black)
        .opacity(StyleConstants.FULL_OPACITY)
        .fontWeight(StyleConstants.FONT_WEIGHT_FIVE)
        .textAlign(TextAlign.Center)
        .fontSize($r('app.float.micro_font_size'))
    }
    .width(StyleConstants.FULL_WIDTH)
    .height(StyleConstants.FULL_HEIGHT)
    .alignItems(HorizontalAlign.Center)
    .justifyContent(FlexAlign.Center)
  }
}