import router from '@ohos.router';
import preferences from '@ohos.data.preferences';
import PrivacyDialog from '../view/PrivacyDialog'
import common from '@ohos.app.ability.common';

@Entry
@Component
struct SplashPage {
  getDataStore(common: Object) {
    return preferences.getPreferences(getContext(common), "dataStore")
  }

  private context?: common.UIAbilityContext
  private customController: CustomDialogController = new CustomDialogController({
    builder: PrivacyDialog({
      confirm: () => {
        console.log("do it !!!!")
        this.jumpToLoginPage()
        this.getDataStore(this).then((preferences: preferences.Preferences) => {
          preferences.put("isPrivacy", false)
          preferences.flush();
        })
      },
      cancel: () => {
        this.context.terminateSelf()
      }
    }),
    alignment: DialogAlignment.Bottom,
    customStyle: true,
    offset: {
      dy: -15,
      dx: 0
    }
  })

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
    this.context = getContext(this) as common.UIAbilityContext
    this.getDataStore(this).then((preferences: preferences.Preferences) => {
      preferences.get("isPrivacy", true).then((value: preferences.ValueType) => {
        if (value) {
          this.customController.open()
        } else {
          this.jumpToLoginPage()
        }
      })
    })

  }

  jumpToLoginPage() {
    setTimeout(() => {
      router.pushUrl({
        url: 'pages/LoginPage'
      })
    }, 3000)
  }
}

