class SlidesModel {
  List<Slide> slides;
  ShopInfo shopInfo;
  IntegralMallPic integralMallPic;
  ShareCode toShareCode;
  List<RecommendInfo> recommend;

  SlidesModel(Map map) {
    //1、slides
    List slideMapList = map['slides'];
    List<Slide> slideList = [];

    for (int i = 0; i < slideMapList.length; i++) {
      Map m = slideMapList[i];
      slideList.add(Slide(image: m['image'], goodsId: m['goodsId']));
    }

    this.slides = slideList;


    //2、shopInfo
    Map shopInfoMap = map['shopInfo'];
    this.shopInfo = ShopInfo(
        leaderImage: shopInfoMap['leaderImage'],
        leaderPhone: shopInfoMap['leaderPhone']
    );

    //3、integralMallPic
    Map picMap = map['integralMallPic'];
    this.integralMallPic = IntegralMallPic(
      PICTURE_ADDRESS: picMap['PICTURE_ADDRESS'],
      TO_PLACE: picMap['TO_PLACE']
    );


    //4、toShareCode
    Map shareCodeMap = map['toShareCode'];
    this.toShareCode = ShareCode(
        PICTURE_ADDRESS: picMap['PICTURE_ADDRESS'],
        TO_PLACE: picMap['TO_PLACE']
    );


    //5、recommend
    List recommendMapList = map['recommend'];
    List<RecommendInfo> recommendList = [];

    for (int i = 0; i < recommendMapList.length; i++) {
      Map m = recommendMapList[i];
      recommendList.add(RecommendInfo(
          image: m['image'],
          mallPrice: m['mallPrice'],
          goodsName: m['goodsName'],
          goodsId:   m['goodsId']
      ));
    }
    this.recommend = recommendList;

  }
}

/*滚动*/
class Slide {
  String image;
  String goodsId;

  Slide({
    this.image,
    this.goodsId
  });
}

/*店面详情*/
class ShopInfo {
  String leaderImage;
  String leaderPhone;

  ShopInfo({
    this.leaderImage,
    this.leaderPhone
  });
}


/*积分*/
class IntegralMallPic {
  String PICTURE_ADDRESS;
  String TO_PLACE;

  IntegralMallPic({
    this.PICTURE_ADDRESS,
    this.TO_PLACE
});
}


/*分享*/
class ShareCode {
  String PICTURE_ADDRESS;
  String TO_PLACE;

  ShareCode({
    this.PICTURE_ADDRESS,
    this.TO_PLACE
  });
}


/*分享*/
class RecommendInfo {
  String image;
  double mallPrice;
  String goodsName;
  String goodsId;

  RecommendInfo({
    this.image,
    this.mallPrice,
    this.goodsName,
    this.goodsId
  });
}