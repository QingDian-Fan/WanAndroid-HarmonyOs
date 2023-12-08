import http from '@ohos.net.http';
import ResponseResult from '../model/ResponseResult'


export function httpRequestPost(url: string,username:string,password:string): Promise<ResponseResult> {
  let httpRequest = http.createHttp();
  let responseResult = httpRequest.request(url, {
    method: http.RequestMethod.POST,
    readTimeout: 10000,
    header: {
      'Content-Type': 'application/json'
    },
    connectTimeout: 5000,
    extraData: {
      'username':username,
      'password':password
    }
  });
  let serverData: ResponseResult = new ResponseResult();
  // Processes the data and returns.
  return responseResult.then((value: http.HttpResponse) => {
    if (value.responseCode === 200) {
      // Obtains the returned data.
      let result = `${value.result}`;
      let resultJson: ResponseResult = JSON.parse(result);
      if (resultJson.errorCode === 0) {
        serverData.data = resultJson.data;
      }
      serverData.errorCode = resultJson.errorCode;
      serverData.errorMsg = resultJson.errorMsg;
    } else { //`${$r('app.string.http_error_message')}&${value.responseCode}`
      serverData.errorMsg = "网络请求失败，请稍后尝试！";
    }
    return serverData;
  }).catch(() => {
    serverData.errorMsg = "网络请求失败，请稍后尝试！";
    return serverData;
  })
}