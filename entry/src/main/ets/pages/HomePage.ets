import Home from '../view/Home'
import Mine from '../view/Mine'

@Entry
@Component
struct HomePage {
  @State currentIndex: number = 0
  private tabController = new TabsController()

  @Builder TabBuilder(title: string, index: number, normalImg: Resource, selectedImg: Resource) {
    Column() {
      Image(this.currentIndex == index ? selectedImg : normalImg).height('25vp').width('25vp')
      Text(title)
        .margin({ top: '4vp' })
        .fontSize('10fp')
        .fontColor(this.currentIndex == index ? $r('app.color.text_blue_color') : $r('app.color.text_light_color'))
    }
  }

  build() {
    Tabs({
      barPosition: BarPosition.End,
      controller: this.tabController
    }) {
      TabContent() {
        Home()
      }
      .padding({ left: '12vp', right: '12vp' })
      .backgroundColor($r('app.color.bg_common'))
      .tabBar(this.TabBuilder('首页', 0, $r('app.media.home_normal'), $r('app.media.home_selected')))

      TabContent() {
        Mine()
      }
      .padding({ left: '12vp', right: '12vp' })
      .backgroundColor($r('app.color.bg_common'))
      .tabBar(this.TabBuilder('我的', 1, $r('app.media.mine_normal'), $r('app.media.mine_selected')))

    }
    .width('100%')
    .backgroundColor(Color.White)
    .barHeight('56vp')
    .barMode(BarMode.Fixed)
    .onChange((index: number) => {
      this.currentIndex = index;
    })
  }
}