import 'package:flutter/material.dart';
import 'home/home_page.dart';
import 'category/category_page.dart';
import 'cart/cart_page.dart';
import 'my/my_page.dart';


class RootPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _RootPageState();
  }
}

class _RootPageState extends State<RootPage> {

  int _currentIndex = 0;

  _itemBar(IconData icon, String title) {
    return BottomNavigationBarItem(
        icon: Icon(icon),
      title: Text(
          title,
        style: TextStyle(
          fontWeight: FontWeight.bold
        ),
      )
    );
  }

  List<BottomNavigationBarItem> _items() {
    return [
      _itemBar(Icons.home, '首页'),
      _itemBar(Icons.search, '分类'),
      _itemBar(Icons.card_travel, '购物车'),
      _itemBar(Icons.person_outline, '我的'),
    ];
  }

  List<Widget> _bodyList() {
    return [
      HomePage(),
      CategoryPage(),
      CartPage(),
      MyPage()
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _bodyList()[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        items: _items(),
        onTap: (index){
          _currentIndex = index;
          setState(() {});
        },
      ),
    );
  }
}