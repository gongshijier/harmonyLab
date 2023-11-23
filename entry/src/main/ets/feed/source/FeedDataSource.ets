import { BasicDataSource } from './BasicDataSource';

/**
 * feed data
 */
export class FeedDataSource extends BasicDataSource {
  private testDataArray: Array<any> = new Array(100).fill("test")

  public getData(index: number): any {
    return this.testDataArray[index]
  }

  public totalCount(): number {
    return this.testDataArray.length
  }
}