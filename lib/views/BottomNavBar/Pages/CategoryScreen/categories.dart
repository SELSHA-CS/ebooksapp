import 'dart:math';
import 'package:ebooksapp/controller/catcontroller.dart';
import 'package:ebooksapp/views/BottomNavBar/Pages/CategoryScreen/categoryscreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryBook extends StatelessWidget {

  final CategoryController catCntrl = Get.put(CategoryController());

  List categoriesName = [
    "Fiction",
    "Classic",
    "Romance",
    "Mystery",
    "Fantasy",
    "History",
    "Comic",
    "Crime",
  ];

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double appBarHeight = kToolbarHeight + MediaQuery.of(context).padding.top;
    double bottomNavBarHeight = kBottomNavigationBarHeight;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text("Category", style: GoogleFonts.poppins(fontSize: 20),),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 150,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                  image: DecorationImage(image: AssetImage("assets/images/c1.jpg")),
                  borderRadius: BorderRadius.circular(20)
              ),
            ),
          ),
          // SliverPadding(
          //   padding: const EdgeInsets.all(8.0),
          //   sliver: 
          SliverToBoxAdapter(
              child: Container(
                height: MediaQuery.of(context).size.height,
                child: GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                  itemCount: categoriesName.length,
                  itemBuilder: (BuildContext context, int index) { 
                    return InkWell(
                      onTap: () async{
                        await catCntrl.fetchData(categoriesName[index]);
                        Get.to(CategoryPage(categoryname: categoriesName[index]));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Card(
                          color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
                          child: Center(child: Text(categoriesName[index], style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.bold),)),
                        ),
                      ),
                    );
                   },
                ),
              ),
            ),
          //),
        ],
      ),
    );
  }
}