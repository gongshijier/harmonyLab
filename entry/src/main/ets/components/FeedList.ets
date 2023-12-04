import http from '@ohos.net.http'
import { BigImageCard } from '../feed/card/BigImageCard'
import { Flavor } from '../feed/card/Flavor'
import { TextCard } from '../feed/card/TextCard'
import { Cell, ViewType } from '../feed/model/Cell'
import { FeedDataSource } from '../feed/source/FeedDataSource'

@Component
export struct FeedList {
  private data: FeedDataSource = new FeedDataSource()
  private flavor: Flavor

  /**
   * network case
   */
  private clickNetwork = (event) => {
    let httpRequest = http.createHttp();
    httpRequest.request("http://apis.juhe.cn/simpleWeather/query?key=397c9db4cb0621ad0313123dab416668&city=深圳",
      {
        method: http.RequestMethod.GET,
        header: {
          'Content-Type': 'application/json'
        },
        readTimeout: 60000,
        connectTimeout: 60000
      }, (err, data) => {
        if (!err) {
          console.info('网络Result:' + data.result);
          console.info('网络code:' + data.responseCode);
          console.info('网络header:' + JSON.stringify(data.header));
          console.info('网络cookies:' + data.cookies); // 8+
          console.info('网络header.Content-Type:' + data.header['Content-Type']);
          console.info('网络header.Status-Line:' + data.header['Status-Line']);
        } else {
          console.info('网络error:' + JSON.stringify(err));
        }
      });
  }

  build() {
    Scroll() {
      List() {
        LazyForEach(this.data, (item: Cell, index: number) => {
          ListItem() {
            this.buildCard(item)
          }
          .onClick(this.clickNetwork)
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
