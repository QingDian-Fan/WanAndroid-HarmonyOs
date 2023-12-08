import { httpRequestPost } from '../net/HttpUtils';
import { httpRequestGet } from '../net/HttpUtils';
import ResponseResult from '../model/ResponseResult'
import ArticleBean from '../model/ArticleBean'
import BannerBean from '../model/BannerBean'


export class NetViewModel {
  login(accountNumber: string, passwordString: string): boolean {
    httpRequestPost("https://www.wanandroid.com/user/login", accountNumber, passwordString)
      .then((data: ResponseResult) => {
        if (data.errorCode === 0) {
          return true
        }

      });
    return false
  }

  getBannerData(): Array<BannerBean> {
    httpRequestGet("https://www.wanandroid.com/banner/json")
      .then((data: ResponseResult) => {
        if (data.errorCode === 0) {

        }
      })
    return null
  }


  getHomeList(page: number): Array<ArticleBean> {
    httpRequestGet('https://www.wanandroid.com/article/list/${page}/json')
      .then((data: ResponseResult) => {

      })
    return null
  }

  getUserInfo() {
    httpRequestGet("https://wanandroid.com//user/lg/userinfo/json")
      .then((data: ResponseResult) => {

      })
  }
}

export default new NetViewModel()