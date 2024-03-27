import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:ebooksapp/controller/bottomcontroller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class BottomNavBar extends StatelessWidget {
  //const BottomNavBar({super.key});

  NavBarController navbarCntrl = Get.put(NavBarController());

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
      bottomNavigationBar: Obx(() {
          return AnimatedBottomNavigationBar(
            icons: [
              Icons.home,
              Icons.favorite,
              Icons.category,
              Icons.person,
            ],
            backgroundColor: Color(0xFF042CC3),
            activeColor: Colors.white,
            inactiveColor: Colors.white,
            activeIndex: navbarCntrl.index.value,
            gapLocation: GapLocation.center,
            notchSmoothness: NotchSmoothness.defaultEdge,
            onTap: (tapIndex) {
              navbarCntrl.changePage(tapIndex);
            },
          );
        }
      ),
      body: Obx(() {
          return navbarCntrl.pages[navbarCntrl.index.value];
        }
      ),
    );
  }
}
