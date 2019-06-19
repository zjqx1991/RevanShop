import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import '../http/shop_service.dart';
import '../http/revan_response.dart';
import 'model/slides_model.dart';
import 'package:flutter_page_indicator/flutter_page_indicator.dart';


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
        color: Colors.red,
        child: Swiper(
          itemCount: this.model.slides.length,
          itemBuilder: (BuildContext context, int index) {
              return Image.network(
                this.model.slides[index].image
              );
          },
          autoplay: true,
          indicatorLayout: PageIndicatorLayout.NONE,
        ),
      )
    );
  }
}