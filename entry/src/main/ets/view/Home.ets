import viewModel from '../vm/NetViewModel'
import ArticleBean from '../model/ArticleBean'
import BannerBean from '../model/BannerBean'


@Component
export default struct Home {
  private swiperController = new SwiperController()

  build() {
    Column() {
      Swiper(this.swiperController) {
        ForEach(viewModel.getBannerData(), (item: BannerBean) => {
          Image(item.imagePath).borderRadius('16vp')
        }, (item: BannerBean) => JSON.stringify(item.id))
      }
      .autoPlay(true)
      .margin('18vp')

      List() {
        ForEach(viewModel.getHomeList(0), (item: ArticleBean) => {
          ListItem() {

          }
        }, (item: ArticleBean) => JSON.stringify(item.id))
      }
    }.width('100%')
    .height('100%')

  }
}