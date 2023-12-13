/**
 * big image card
 */
import { Cell } from '../model/Cell'
import { NewCell } from '../model/NewCell'

@Component
@Preview
export struct BigImageCard {
  cell: NewCell

  build() {
    Column() {
      Text(this.cell.title)
        .fontSize('18fp')
        .alignSelf(ItemAlign.Start)

      Image(this.cell.thumbnail_pic_s)
        .width('100%')
        .height('100vp')
        .objectFit(ImageFit.Cover)
        .margin({
          left: 10,
          right: 10,
          top: 6
        })
    }
  }
}