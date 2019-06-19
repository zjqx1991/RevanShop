import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomePageState();
  }
}


class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Home'
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Colors.red,
          child: Column(
            children: <Widget>[
              Container(
                color: Colors.blue,
                height: 500.0,
              ),
              Container(
                color: Colors.yellow,
                height: 500.0,
              ),
              Container(
                color: Colors.blue,
                height: 500.0,
              ),
              Container(
                color: Colors.blueGrey,
                height: 500.0,
              )
            ],
          ),
        ),
      ),
    );
  }
}