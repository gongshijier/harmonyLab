import { TabInfo } from '../model/TabInfo'

const buttonInfo: TabInfo[] = [
  {
    index: 0,
    img: $r('app.media.ic_home_normal'),
    selectImg: $r('app.media.ic_home_focus'),
    title: $r('app.string.home')
  },
  {
    index: 1,
    img: $r('app.media.ic_product_normal'),
    selectImg: $r('app.media.ic_product_focus'),
    title: $r('app.string.video')
  },
  {
    index: 2,
    img: $r('app.media.ic_cart_normal'),
    selectImg: $r('app.media.ic_cart_focus'),
    title: $r('app.string.mall')
  },
  {
    index: 3,
    img: $r('app.media.ic_personal_normal'),
    selectImg: $r('app.media.ic_personal_focus'),
    title: $r('app.string.mine')
  }
]
const categoryTabs: TabInfo[] = [
  {
    index: 0,
    img: $r('app.media.ic_home_normal'),
    selectImg: $r('app.media.ic_home_focus'),
    title: $r('app.string.recommend')
  },
  {
    index: 1,
    img: $r('app.media.ic_product_normal'),
    selectImg: $r('app.media.ic_product_focus'),
    title: $r('app.string.discovery')
  },
  {
    index: 2,
    img: $r('app.media.ic_cart_normal'),
    selectImg: $r('app.media.ic_cart_focus'),
    title: $r('app.string.local')
  },
  {
    index: 3,
    img: $r('app.media.ic_personal_normal'),
    selectImg: $r('app.media.ic_personal_focus'),
    title: $r('app.string.hot')
  },
  {
    index: 4,
    img: $r('app.media.ic_personal_normal'),
    selectImg: $r('app.media.ic_personal_focus'),
    title: $r('app.string.novel')
  },
  {
    index: 5,
    img: $r('app.media.ic_personal_normal'),
    selectImg: $r('app.media.ic_personal_focus'),
    title: $r('app.string.sports')
  },
  {
    index: 6,
    img: $r('app.media.ic_personal_normal'),
    selectImg: $r('app.media.ic_personal_focus'),
    title: $r('app.string.military')
  },
  {
    index: 7,
    img: $r('app.media.ic_personal_normal'),
    selectImg: $r('app.media.ic_personal_focus'),
    title: $r('app.string.entertain')
  }
]


export { buttonInfo }
export { categoryTabs }