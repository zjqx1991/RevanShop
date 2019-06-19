import 'package:flutter/material.dart';
import 'root_page.dart';
import 'splash_page.dart';


class AppRoot extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _AppRootState();
  }
}

class _AppRootState extends State<AppRoot> {

  bool _isShowSplash = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        children: <Widget>[
          //1、rootPage
          RootPage(),
          //2、Splash、广告
          Offstage(
            offstage: !_isShowSplash,
            child: SplashPage(),
          )
        ],
      ),
    );
  }


}