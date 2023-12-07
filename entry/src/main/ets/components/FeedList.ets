import http from '@ohos.net.http'
import Network from '@system.network'
import { BigImageCard } from '../feed/card/BigImageCard'
import { Flavor } from '../feed/card/Flavor'
import { TextCard } from '../feed/card/TextCard'
import { DBHelper } from '../feed/load/db/DBHelper'
import { NetLoader } from '../feed/load/net/NetLoader'
import { Cell, ViewType } from '../feed/model/Cell'
import { NewCell } from '../feed/model/NewCell'
import { FeedDataSource } from '../feed/source/FeedDataSource'

@Component
export struct FeedList {
  private data: FeedDataSource = new FeedDataSource()
  private flavor: Flavor

  /**
   * network load case
   */
  private clickNetwork = (event) => {

  }

  /**
   * db load case
   */
  longPressLoadDB() {

  }

  build() {
    Scroll() {
      List() {
        LazyForEach(this.data, (item: Cell, index: number) => {
          ListItem() {
            this.buildCard(item)
          }
          .onClick(this.clickNetwork)
          .gesture(
            // 绑定可以重复触发的LongPressGesture
            LongPressGesture({ repeat: true })
              .onAction((event: GestureEvent) => {
                console.log('item long press: onAction');
              })
              .onActionEnd(() => {
                this.longPressLoadDB()
                console.log('item long press: onActionEnd');
              }))
          .width('95%')
          .margin({ top: 16, left: 10, bottom: 10 })
        })
      }
      .cachedCount(3)
      .lanes(this.flavor.lanes)
      .width('100%')
      .height('100%')
      .divider({ strokeWidth: 0.2, color: '#d6d6d6' })

    }.backgroundColor(Color.White)
  }

  @Builder buildCard(item: Cell) {
    if (this.flavor.lanes == 1 && item.viewType == ViewType.TEXT) {
      TextCard({ cell: item })
    } else if (item.viewType == ViewType.BIG_IMAGE) {
      BigImageCard({ cell: item })
    } else {
      BigImageCard({ cell: item })
    }
  }
}
