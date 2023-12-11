@CustomDialog
export default struct PrivacyDialog {
  dialogController: CustomDialogController
  cancel:Function = () => {
  }
  confirm:Function = () => {
  }

  build() {
    Column() {
      Text("欢迎使用我的应用")
        .fontSize('20vp')
        .fontColor($r('app.color.text_color'))
        .fontWeight(FontWeight.Bold)
        .margin({ top: '20vp' })

      Text() {
        Span("我们充分尊重用户的隐私权，并按照法律要求和业界成熟的安全标准，为您的个人信息提供相应的安全保护措施。")
          .fontSize('14vp')
          .fontColor($r('app.color.text_color'))
          .fontWeight(FontWeight.Normal)
        Span("隐私协议保护声明")
          .fontSize('14vp')
          .fontColor($r('app.color.text_blue_color'))
          .fontWeight(FontWeight.Normal)
        Span("（以下简称为“本声明”）以便您了解我们如何搜集、使用、披露、保护、存储及传输您的个人数据。请您仔细阅读本声明。如您有任何疑问，请告知我们。")
          .fontSize('14vp')
          .fontColor($r('app.color.text_color'))
          .fontWeight(FontWeight.Normal)

      }.margin({ top: '20vp' })

      Row() {
        Button('退出')
          .fontSize('18vp')
          .layoutWeight(1)
          .backgroundColor('#00000')
          .fontColor($r('app.color.text_blue_color'))
          .fontWeight(FontWeight.Medium)
          .onClick(() => {
            this.dialogController.close()
            this.cancel()
          })
        Blank().backgroundColor($r('app.color.line_color')).height('15vp').width('1vp')
        Button('同意')
          .fontSize('18vp')
          .layoutWeight(1)
          .backgroundColor('#00000')
          .fontColor($r('app.color.text_blue_color'))
          .fontWeight(FontWeight.Medium)
          .onClick(() => {
            this.dialogController.close()
            this.confirm()
          })
      }.width("100%")
      .margin({ top: '20vp' })
      .height('40vp')
    }
    .padding({ left: '15vp', right: '15vp' })
    .borderRadius('12vp')
    .backgroundColor($r('app.color.bg_common'))
    .width("90%")
    .alignItems(HorizontalAlign.Center)
  }
}