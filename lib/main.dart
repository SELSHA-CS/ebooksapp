import 'package:ebooksapp/controller/bookController.dart';
import 'package:ebooksapp/views/BookDetailsPage/bookdetpage.dart';
import 'package:ebooksapp/views/BottomNavBar/Pages/FavScreen/favscreen.dart';
import 'package:ebooksapp/views/SplashScreen/splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
    return ChangeNotifierProvider(
      create: (context) => BookController(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (context) => SplashScreen(),
          'bookdetails': (context) => BookDetailsPage(),
          'favpage': (context) => FavScreen(),
          //'readbook': (context) => ReadScreen(),
        },
      ),
    );
  }
}
