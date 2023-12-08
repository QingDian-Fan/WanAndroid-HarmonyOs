@Component
export default struct Mine {
  @Builder SettingBar(image: Resource, title: string) {
    Row() {
      Image(image).height('25vp').width('25vp')
      Text(title).fontColor($r('app.color.text_color')).fontSize('18fp').layoutWeight(1).margin({ left: '18vp' })
      Image($r('app.media.right_grey')).height('18vp').width('18vp').margin({ right: '10vp' })
    }.width("90%").height('45vp')
  }

  /**
   *我的积分、我的收藏、我的分享 todo、系统设置
   */
  build() {
    Column() {
      Blank().layoutWeight(1)
      Image($r('app.media.account')).width('65vp').height('65vp')

      Text("NickName")
        .fontColor($r('app.color.text_color'))
        .fontSize('18fp')
        .fontWeight(FontWeight.Bold)
        .margin({ top: '18vp' })

      Text("等级：--  排名：--")
        .fontSize('14fp')
        .fontColor($r('app.color.text_light_color'))
        .margin({ top: '12vp', bottom: '45vp' })

      this.SettingBar($r('app.media.icon_integral'), "我的积分")
      this.SettingBar($r('app.media.icon_collect'), "我的收藏")
      this.SettingBar($r('app.media.icon_share'), "我的分享")
      this.SettingBar($r('app.media.icon_todo'), "Todo")
      this.SettingBar($r('app.media.icon_setting'), "系统设置")
      Blank().layoutWeight(4)
    }
    .width('100%')
    .height('100%')
  }
}