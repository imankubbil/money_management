import 'package:flutter/material.dart';
import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:money_management/colors.dart';
import 'package:money_management/screen/pages/CreateCategoryScreen.dart';
import 'package:money_management/screen/pages/BankScreen.dart';
import 'package:money_management/screen/pages/LogoutScreen.dart';
import 'package:money_management/screen/pages/ProfileScreen.dart';
// import 'package:money_management/screen/pages/StatsScreen.dart';
import 'package:money_management/screen/pages/TransactionScreen.dart';

class HomeScreen extends StatefulWidget {
  // const HomeScreen({ Key? key }) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int pageIndex = 0;
  List<Widget> pages = [
    BankScreen(),
    CreateCategoryScreen(),
    ProfileScreen(),
    LogoutScreen(),
    TransactionScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: getBody(),
      bottomNavigationBar: getFooter(),
      //other params,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          selectedTab(4);
        },
        child: Icon(
          Icons.add,
          size: 25,
        ),
        backgroundColor: primary,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget getBody() {
    return IndexedStack(
      index: pageIndex,
      children: pages,
    );
  }

  Widget getFooter() {
    List<IconData> iconItems = [
      Icons.account_balance_wallet,
      Icons.category,
      Icons.person,
      Icons.logout
    ];

    return AnimatedBottomNavigationBar(
      activeColor: primary,
      splashColor: secondary,
      inactiveColor: Colors.black.withOpacity(0.5),
      icons: iconItems,
      activeIndex: pageIndex,
      gapLocation: GapLocation.center,
      notchSmoothness: NotchSmoothness.softEdge,
      leftCornerRadius: 10,
      iconSize: 25,
      rightCornerRadius: 10,
      onTap: (index) {
        selectedTab(index);
      },
      //other params
    );
  }

  selectedTab(index) {
    setState(() {
      pageIndex = index;
    });
  }
}