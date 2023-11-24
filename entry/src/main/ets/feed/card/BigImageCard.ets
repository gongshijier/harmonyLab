/**
 * big image card
 */
import { Cell } from '../model/Cell'

@Component
@Preview
export struct BigImageCard {
  cell: Cell

  build() {
    Column() {
      Text(this.cell.title)
        .fontSize('18fp')
        .alignSelf(ItemAlign.Start)

      Image(this.cell.imageSrc)
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