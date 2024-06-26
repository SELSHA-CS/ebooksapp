import 'package:ebooksapp/views/BottomNavBar/Pages/CategoryScreen/categoryscreen.dart';
import 'package:ebooksapp/views/SplashScreen/splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'firebase_options.dart';

void main() async{
  await WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        //home: SplashScreen(),
        initialRoute: '/',
        getPages: [
          GetPage(name: '/', page: () => SplashScreen()),
          GetPage(name: '/category', page: () => CategoryPage(categoryname: '',)),
        ],
        // routes: {
        //   '/': (context) => SplashScreen(),
        //   'bookdetails': (context) => BookDetailsPage(),
        //   'favpage': (context) => FavScreen(),
        //   //'readbook': (context) => ReadScreen(),
        // }
    );
  }
}
