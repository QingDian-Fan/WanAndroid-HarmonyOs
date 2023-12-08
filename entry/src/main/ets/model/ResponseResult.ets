export default  class ResponseResult {
  errorCode: string|number;
  errorMsg: string ;
  data: string | Object | ArrayBuffer;

  constructor() {
    this.errorCode = '';
    this.errorMsg = '';
    this.data = '';
  }
}