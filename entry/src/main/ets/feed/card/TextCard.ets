/**
 * pure text card
 */
import { Cell } from '../model/Cell'

@Component
export struct TextCard {
  cell: Cell

  build() {
    Column() {
      Text(this.cell.title)
        .fontSize('18fp')
        .margin({
          top: 1
        })
        .maxLines(1)
        .alignSelf(ItemAlign.Start)
    }
    .width('100%')
  }
}