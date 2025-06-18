
import 'dart:ui';

import 'package:flutter/material.dart' show StatefulWidget, State, ScaffoldState, BuildContext, Widget, Scaffold, Drawer, AppBar, IconButton, Icon, EdgeInsets, Text, Icons, CrossAxisAlignment, Theme, Column, Colors, TextStyle, Padding, BottomNavigationBarType, BottomNavigationBarItem, BottomNavigationBar;
import 'package:flutter/widgets.dart' show GlobalKey;
import 'package:badges/badges.dart' as badges;


class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  //final pages = [const ExplorePage(), const ServicesPage(), const CartPage(), const ProfilePage()];
  int currentPageIndex = 0;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context,) {
    
    //var pages;
    return Scaffold(
      key: _scaffoldKey,
      drawer: const Drawer(),
      appBar: AppBar(
        centerTitle: false,
        leading: IconButton.filledTonal(
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
          icon: const Icon(Icons.menu),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Dashboard",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            //Text("Dashboard", style: Theme.of(context).textTheme.bodySmall)
          ],
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton.filledTonal(
              onPressed: () {},
              icon: badges.Badge(
                badgeContent: const Text(
                  '3',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
                position: badges.BadgePosition.topEnd(top: -15, end: -12),
                badgeStyle: badges.BadgeStyle(
                  badgeColor: const Color(0xFF4CAF50),
                ),
                child: const Icon(Icons.notifications),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
  type: BottomNavigationBarType.fixed,
  currentIndex: currentPageIndex,
  onTap: (index) {
    setState(() {
      currentPageIndex = index;
    });
  },
  items: [
    BottomNavigationBarItem(
     icon: const Icon(Icons.home),
      label: "Home",
      activeIcon: const Icon(Icons.home),
    ),
    BottomNavigationBarItem(
      icon: const Icon(Icons.person),
      label: "PROFILE",
      activeIcon: const Icon(Icons.person),
    ),
    BottomNavigationBarItem(
      icon: const Icon(Icons.info),
      label: "ABOUT",
      activeIcon: const Icon(Icons.info),
    ),
    BottomNavigationBarItem(
      icon: const Icon(Icons.logout),
      label: "LOGOUT",
      activeIcon: const Icon(Icons.logout),
    ),
  ],
),
    );
  }
}
