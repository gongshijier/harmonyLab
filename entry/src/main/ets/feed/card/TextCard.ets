/**
 * pure text card
 */
import { Cell } from '../model/Cell'
import { NewCell } from '../model/NewCell'

@Component
export struct TextCard {
  cell: NewCell

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