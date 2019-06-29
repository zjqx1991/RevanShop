import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_page_indicator/flutter_page_indicator.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../model/slides_model.dart';

/// 首页轮播
class HomeBannerWidget extends StatelessWidget {

  SlidesModel model;

  HomeBannerWidget({@required this.model});

  @override
  Widget build(BuildContext context) {
    print('首页轮播数据：${this.model}');

    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);
    return Container(
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
            );
  }
}