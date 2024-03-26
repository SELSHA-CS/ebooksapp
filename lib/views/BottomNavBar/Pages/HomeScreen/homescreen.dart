import 'package:ebooksapp/widgets/booksdet.dart';
import 'package:ebooksapp/widgets/con_silver_appbar.dart';
import 'package:ebooksapp/widgets/home_book_cat.dart';
import 'package:ebooksapp/widgets/mydrawers.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: MyDrawer(),
        body: CustomScrollView(
            slivers: [
              ContainerAppBar(),
              HomeBookCat(text1: "Top Picks"),
              SliverToBoxAdapter(child: BookDet()),
              // HomeBookCat(text1: "Recently Added"),
              // BookDet(),
              // HomeBookCat(text1: "Recommended"),
              // BookDet(),
            ]
        )
    );
  }
}

