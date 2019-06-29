import 'package:flutter/material.dart';
import '../http/shop_service.dart';
import '../http/revan_response.dart';
import 'model/slides_model.dart';
import 'views/home_banner.dart';

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

    // getHomePageData().then((response){
    //   RevanResponse res = response;
    //   this.model = SlidesModel(res.data);
    //   setState(() {});
    // });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Home'
        ),
      ),
      body: FutureBuilder(
        future: homeBannerData(),
        builder:(BuildContext context, AsyncSnapshot snapshot) {
          switch (snapshot.connectionState) {
            case ConnectionState.none:
              return Container(
              child: Text(
                'none'
                ),
              );
            case ConnectionState.waiting:
              return Container(
              child: Text(
                'waiting'
                ),
              );
            case ConnectionState.done:
              if (snapshot.hasError) {
                return Container(
                  child: Text(
                    'waiting'
                  ),
                );
              }
              RevanResponse response = snapshot.data as RevanResponse;
              return Container(
                  child: SingleChildScrollView(
                    child: HomeBannerWidget(model: SlidesModel(response.data),),
                  ),
                );
            case ConnectionState.active:
              // TODO: Handle this case.
              break;
          }
          return Container(
            color: Colors.red,
          );
        },
        
      )
    );
  }
}