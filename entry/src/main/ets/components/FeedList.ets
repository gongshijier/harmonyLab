import { FeedDataSource } from '../feed/source/FeedDataSource'

@Component
export struct FeedList {
  private data: FeedDataSource = new FeedDataSource()

  build() {
    Scroll() {
      List() {
        LazyForEach(this.data, (item: string, index: number) => {
          ListItem() {
            Text(item).fontSize(20).margin(10)
          }.width('100%')
        })
      }.width('100%').height('100%')
    }.backgroundColor(Color.Pink)
  }
}
