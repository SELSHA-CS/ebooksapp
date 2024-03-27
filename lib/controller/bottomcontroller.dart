import 'package:ebooksapp/views/BottomNavBar/Pages/CategoryScreen/categories.dart';
import 'package:ebooksapp/views/BottomNavBar/Pages/FavScreen/favscreen.dart';
import 'package:ebooksapp/views/BottomNavBar/Pages/HomeScreen/homescreen.dart';
import 'package:ebooksapp/views/BottomNavBar/Pages/ProfileScreen/profilescreen.dart';
import 'package:get/get.dart';

class NavBarController extends GetxController{

  var pages = [
    HomeScreen(),
    FavScreen(),
    CategoryBook(),
    ProfileScreen(),
  ];

  RxInt index = 0.obs;

  void changePage(int tapIndex){
    index.value = tapIndex;
  }
}