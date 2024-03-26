import 'dart:math';
import 'package:ebooksapp/views/BottomNavBar/Pages/CategoryScreen/categoryscreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryBook extends StatelessWidget {
  //const CategoryBook({super.key});

  var ccount = [2,2,2,2,2,2,4];
  var mcount = [3,2,3,1,3,2,1];
  var ctg = [
    "Personal Development",
    "Mystery",
    "Fantasy",
    "Romance",
    "Thriller",
    "Adventure",
    "Short Stories",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text("Category", style: GoogleFonts.poppins(fontSize: 20),),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 250,
                //width:,
                decoration: BoxDecoration(
                    image: DecorationImage(image: AssetImage("assets/images/c1.jpg")),
                    borderRadius: BorderRadius.circular(20)
                ),
              ),
            ),
          ),
          SliverPadding(
            padding: const EdgeInsets.all(8.0),
            sliver: SliverToBoxAdapter(
              child: StaggeredGrid.count(
                crossAxisCount: 4,
                children: List.generate(ctg.length, (index) => StaggeredGridTile.count(
                    crossAxisCellCount: ccount[index],
                    mainAxisCellCount: mcount[index],
                    child: InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => CategoryPage(category: ctg[index])));
                      },
                      child: Card(
                        color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
                        child: Center(child: Text(ctg[index], style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.bold),)),
                      ),
                    )),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}