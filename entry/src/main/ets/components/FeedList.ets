import { BigImageCard } from '../feed/card/BigImageCard'
import { Flavor } from '../feed/card/Flavor'
import { TextCard } from '../feed/card/TextCard'
import { Cell, ViewType } from '../feed/model/Cell'
import { FeedDataSource } from '../feed/source/FeedDataSource'

@Component
export struct FeedList {
  private data: FeedDataSource = new FeedDataSource()
  private flavor: Flavor

  build() {
    Scroll() {
      List() {
        LazyForEach(this.data, (item: Cell, index: number) => {
          ListItem() {
            this.buildCard(item)
          }
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
