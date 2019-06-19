import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _SplashPage();
  }
}

class _SplashPage extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey,
      child: Center(
        child: Text(
          'SplashPage',
          style: TextStyle(
            color: Colors.white,
            fontSize: 40.0
          ),
        ),
      ),
    );
  }
}