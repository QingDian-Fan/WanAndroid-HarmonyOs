import router from '@ohos.router';


@Entry
@Component
struct SplashPage {
  build() {
    Column() {
      Blank().layoutWeight(1.2)
      Image($r('app.media.icon_logo_transparent')).width('120vp').height('120vp')
      Text("玩 Android ").fontColor($r('app.color.text_color')).fontSize('24fp').fontWeight(FontWeight.Medium).margin({
        top: '12vp'
      })
      Blank().layoutWeight(2)
    }.width("100%")
    .height("100%")
  }


  onPageShow() {
    this.jumpToLoginPage()
  }

  jumpToLoginPage() {
    setTimeout(() => {
      router.pushUrl({
        url: 'pages/LoginPage'
      })
    }, 3000)
  }
}

