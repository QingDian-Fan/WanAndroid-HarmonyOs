import prompt from '@ohos.promptAction';
import router from '@ohos.router';
import viewModel from '../vm/NetViewModel'

@Entry
@Component
struct RegisterPage {
  accountNumber: string
  passwordString: string

  build() {
    Column() {
      Blank().layoutWeight(1)

      Image($r('app.media.icon_logo_transparent')).width('100vp').height('100vp')

      Text("注册页面")
        .fontColor($r('app.color.text_color'))
        .fontSize('24fp')
        .fontWeight(FontWeight.Medium)
        .margin({ top: "12vp" })

      TextInput({ placeholder: '账号' })
        .width("90%")
        .height('50vp')
        .margin({ top: '24vp' })
        .padding({ left: '24vp' })
        .onChange((value) => {
          this.accountNumber = value
        })

      TextInput({ placeholder: '密码' })
        .width("90%")
        .height('50vp')
        .margin({ top: '24vp' })
        .padding({ left: '24vp' })
        .type(InputType.Password)
        .onChange((value) => {
          this.passwordString = value
        })


      Button('注册')
        .width('70%')
        .height('45vp')
        .fontColor($r('app.color.colorWhite'))
        .fontSize('20fp')
        .backgroundColor($r('app.color.text_blue_color'))
        .margin({ top: '80vp' })
        .onClick(() => {
          if (this.accountNumber == null || this.passwordString == null || this.accountNumber === '' || this.passwordString === '') {
            prompt.showToast({ message: "账号或密码不能为空" })
            return
          }
          router.back()
        })
      Blank().layoutWeight(2.5)
    }
    .width('100%')
    .height('100%')
  }
}