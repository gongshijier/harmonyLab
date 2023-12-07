import ArrayList from '@ohos.util.ArrayList';
import http from '@ohos.net.http';
import { NewCell } from '../../model/NewCell';
/**
 * load from net
 */
export class NetLoader {

  /**
   * load data
   */
  static load(): ArrayList<NewCell> {
    console.info('load data star');
    let httpRequest = http.createHttp();
    httpRequest.request("http://v.juhe.cn/toutiao/index?type=top&key=6351037e0245a94ecae0bd699f2d72f3",
      {
        method: http.RequestMethod.GET,
        header: {
          'Content-Type': 'application/x-www-form-urlencoded'
        },
        readTimeout: 60000,
        connectTimeout: 60000
      }, (err, data) => {
        if (!err) {
          var cells: ArrayList<NewCell>
          var cellString = JSON.parse(data.result.toString()).result.data
          cells = JSON.parse(JSON.stringify(cellString))
          cells.forEach(item => {
            console.info('log new cell info： ')
            console.info(item.title)
            console.info(item.url)
          })
        } else {
          console.info('网络error:' + JSON.stringify(err));
        }
      });
    return
  }

  /**
   * parse
   */
  parse() {

  }
}