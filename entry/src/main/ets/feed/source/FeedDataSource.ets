import ArrayList from '@ohos.util.ArrayList';
import { NetLoader } from '../load/net/NetLoader';
import { Cell, ViewType } from '../model/Cell';
import { NewCell } from '../model/NewCell';
import { BasicDataSource } from './BasicDataSource';

/**
 * feed data
 */
export class FeedDataSource extends BasicDataSource {
  private cells: ArrayList<NewCell> = new ArrayList()

  constructor() {
    super();
    NetLoader.load().then(res => {
      this.cells = res
      this.notifyDataReload()
    })
  }

  private testDataArray: Array<Cell> = [
    {
      imageSrc: $r('app.media.img_1'),
      title: "总设计师为你讲述中国空间站故事",
      viewType: ViewType.TEXT
    },
    {
      imageSrc: $r('app.media.b'),
      title: "女子参加婚礼随错份子钱！事后想把钱要回来，可万万没想到……",
      viewType: ViewType.TEXT
    },
    {
      imageSrc: $r('app.media.a'),
      title: "落马贪官吃早餐不舍得加鸡蛋，贪的钱竟去干这事……",
      viewType: ViewType.TEXT
    },
    {
      imageSrc: $r('app.media.c'),
      title: "大消息！国务院批准！",
      viewType: ViewType.TEXT
    },
    {
      imageSrc: $r('app.media.d'),
      title: "当年差点没考上高中的他，如今当选为中国科学院院士",
      viewType: ViewType.TEXT
    },
    {
      imageSrc: $r('app.media.img_2'),
      title: "陕西榆林原副市长王长安被决定逮捕：当了12年副市长，被查时已退休近7年",
      viewType: ViewType.BIG_IMAGE
    },
    {
      imageSrc: $r('app.media.img_3'),
      title: "中国疾控中心通报：河南确诊8例！",
      viewType: ViewType.BIG_IMAGE
    },
    {
      imageSrc: $r('app.media.img_4'),
      title: "上网遇到不良信息？来看看这份避坑指南",
      viewType: ViewType.BIG_IMAGE
    },
    {
      imageSrc: $r('app.media.img_5'),
      title: "浙江女子因不想浪费丈夫基因，结婚13年生9个娃，只为凑齐12生肖",
      viewType: ViewType.BIG_IMAGE
    },
    {
      imageSrc: $r('app.media.img_6'),
      title: "美国发达到什么程度了？带你看看真实的，美国生活！",
      viewType: ViewType.BIG_IMAGE
    },
    {
      imageSrc: $r('app.media.img_7'),
      title: "一觉醒来，乌军突然打响战斗，留下一地尸体，美国开始察觉不对劲",
      viewType: ViewType.BIG_IMAGE
    },
    {
      imageSrc: $r('app.media.img_8'),
      title: "又一座中国城市被老外“占据”，十万老外赖着不走，你知道在哪吗",
      viewType: ViewType.BIG_IMAGE
    },
    {
      imageSrc: $r('app.media.img_9'),
      title: "中国最干净的10位女星，不傍富豪、不滥情、个个清白干净",
      viewType: ViewType.BIG_IMAGE
    },
    {
      imageSrc: $r('app.media.img_10'),
      title: "中国最干净的10位女星，不傍富豪、不滥情、个个清白干净",
      viewType: ViewType.BIG_IMAGE
    },
    {
      imageSrc: $r('app.media.img_11'),
      title: "中国最干净的10位女星，不傍富豪、不滥情、个个清白干净",
      viewType: ViewType.BIG_IMAGE
    },
    {
      imageSrc: $r('app.media.img_12'),
      title: "中国最干净的10位女星，不傍富豪、不滥情、个个清白干净",
      viewType: ViewType.BIG_IMAGE
    },
    {
      imageSrc: $r('app.media.img_13'),
      title: "中国最干净的10位女星，不傍富豪、不滥情、个个清白干净",
      viewType: ViewType.BIG_IMAGE
    },
    {
      imageSrc: $r('app.media.img_14'),
      title: "中国最干净的10位女星，不傍富豪、不滥情、个个清白干净",
      viewType: ViewType.BIG_IMAGE
    },
    {
      imageSrc: $r('app.media.img_15'),
      title: "中国最干净的10位女星，不傍富豪、不滥情、个个清白干净",
      viewType: ViewType.BIG_IMAGE
    }
  ]

  public getData(index: number): NewCell {
    return this.cells[index]
  }

  public totalCount(): number {
    return this.cells.length
  }
}