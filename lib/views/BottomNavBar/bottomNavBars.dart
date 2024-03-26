import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:ebooksapp/views/BottomNavBar/Pages/CategoryScreen/categories.dart';
import 'package:ebooksapp/views/BottomNavBar/Pages/FavScreen/favscreen.dart';
import 'package:ebooksapp/views/BottomNavBar/Pages/HomeScreen/homescreen.dart';
import 'package:ebooksapp/views/BottomNavBar/Pages/ProfileScreen/profilescreen.dart';
import 'package:ebooksapp/views/BottomNavBar/Pages/SearchScreen/searchscreen.dart';

import 'package:flutter/material.dart';

class BottomNavBar extends StatefulWidget {
  const BottomNavBar({super.key});

  @override
  State<BottomNavBar> createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {

  var _bottomNavIndex = 0;
  var screens = [
    HomeScreen(),
    FavScreen(),
    CategoryBook(),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      floatingActionButton: FloatingActionButton(onPressed: () {
        //Navigator.of(context).push(MaterialPageRoute(builder: (context) => SearchPage()));
      },
        child: Icon(Icons.book, color: Colors.white,),
        shape: CircleBorder(),
        backgroundColor: Color(0xFF042CC3),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: AnimatedBottomNavigationBar(
        icons: [
          Icons.home,
          Icons.favorite,
          Icons.category,
          Icons.person,
        ],
        backgroundColor: Color(0xFF042CC3),
        activeColor: Colors.white,
        inactiveColor: Colors.white,
        activeIndex: _bottomNavIndex,
        gapLocation: GapLocation.center,
        notchSmoothness: NotchSmoothness.defaultEdge,
        onTap: (index) {
          setState(() {
            _bottomNavIndex = index;
          });
        },
      ),
      body: screens[_bottomNavIndex],
    );
  }
}
