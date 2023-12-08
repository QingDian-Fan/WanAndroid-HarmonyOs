import { httpRequestPost } from '../net/HttpUtils';
import ResponseResult from '../model/ResponseResult'


export class NetViewModel {
  login(accountNumber: string, passwordString: string): boolean {
    httpRequestPost("https://www.wanandroid.com/user/login",accountNumber,passwordString).then((data: ResponseResult) => {
      if (data.errorCode === 0) {
        return true
      }

    });
    return false
  }
}

export default new NetViewModel()