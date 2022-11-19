import 'package:razor_payment/payment.dart';
import 'package:razor_payment/screens/cart.dart';
import 'package:razor_payment/screens/home_page.dart';
import 'package:razor_payment/screens/notification.dart';
import 'package:sliding_clipped_nav_bar/sliding_clipped_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_phosphor_icons/flutter_phosphor_icons.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late PageController _pageController;
  int selectedIndex = 0;
  bool _colorful = false;
  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: selectedIndex);
  }

  void onButtonPressed(int index) {
    setState(() {
      selectedIndex = index;
    });
    _pageController.animateToPage(selectedIndex,
        duration: Duration(milliseconds: 400), curve: Curves.easeOutQuad);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: <Widget>[
          Expanded(
            child: PageView(
              physics: NeverScrollableScrollPhysics(),
              controller: _pageController,
              children: _listOfWidget,
            ),
          ),
        ],
      ),
      bottomNavigationBar: SlidingClippedNavBar(
        backgroundColor: Colors.white,
        onButtonPressed: onButtonPressed,
        iconSize: 30,
        activeColor: Color(0xff0D4C92),
        selectedIndex: selectedIndex,
        barItems: <BarItem>[
          BarItem(
            icon: PhosphorIcons.house_light,
            title: 'Home',
          ),
          BarItem(
            icon: PhosphorIcons.shopping_cart_light,
            title: 'Cart',
          ),
          BarItem(
            icon: PhosphorIcons.paper_plane_tilt_light,
            title: 'Payment',
          ),
          BarItem(
            icon: PhosphorIcons.bell_light,
            title: 'Notification',
          ),
        ],
      ),
    );
  }
}

List<Widget> _listOfWidget = <Widget>[
  home(),
  notification(),
  card(),
  payment()
];
