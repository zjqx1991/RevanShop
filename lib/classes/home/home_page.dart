import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import '../http/shop_service.dart';
import '../http/revan_response.dart';
import 'model/slides_model.dart';
import 'package:flutter_page_indicator/flutter_page_indicator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';


class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}


class _HomePageState extends State<HomePage> {

  SlidesModel model;

  @override
  void initState() {
    super.initState();

    getHomePageData().then((response){
      RevanResponse res = response;
      this.model = SlidesModel(res.data);
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {

    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);


    if (this.model == null) {
      return Scaffold(
          appBar: AppBar(
            centerTitle: true,
            title: Text(
                'Home'
            ),
          ),
          body: Container(
            child: Center(
              child: Text('正在加载中。。。。'),
            )
          )
      );
    }
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Home'
        ),
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Container(
              height: ScreenUtil.getInstance().setHeight(333.0),
              child: Swiper(
                itemCount: this.model.slides.length,
                itemBuilder: (BuildContext context, int index) {
                  return Image.network(
                      this.model.slides[index].image,
                    fit: BoxFit.fill,
                  );
                },
                autoplay: true,
                indicatorLayout: PageIndicatorLayout.NONE,
                pagination: SwiperPagination(),

              ),
            )
          ],
        ),
      )
    );
  }
}