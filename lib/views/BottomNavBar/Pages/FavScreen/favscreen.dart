import 'package:ebooksapp/services/DummyData/dummydata.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FavScreen extends StatefulWidget {
  const FavScreen({super.key});

  @override
  State<FavScreen> createState() => _FavScreenState();
}

class _FavScreenState extends State<FavScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Color.fromARGB(255, 8, 20, 88),
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              //backgroundColor: Color.fromARGB(255, 8, 20, 88),
              title: Text("My Favorites", style: GoogleFonts.poppins(color: Color.fromARGB(255, 8, 20, 88),),),
            ),
            SliverToBoxAdapter(
              child: Container(
                height: 700,
                width: 150,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: GridView.count(
                    scrollDirection: Axis.vertical,
                    crossAxisCount: 2,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 10,
                    //childAspectRatio: 0.8,
                    children: books.map((book) => InkWell(
                      onTap: (){
                        Navigator.pushNamed(context, "bookdetails", arguments: book["id"]);
                      },
                      child: Stack(
                        children: [
                          Card(
                            elevation: 8,
                            child: Container(
                              height: 500,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(15),
                                // border: Border.all(
                                //   color: Colors.grey,
                                //   width: 2.0,
                                // )
                              ),
                            ),
                          ),
                          Center(
                            //top: 5,
                            child: Container(
                              height: 150,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(book["image"]),
                                  //fit: BoxFit.fill,
                                ),
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 2,
                            left: 15,
                            child: Icon(Icons.favorite, color: Color.fromARGB(255, 8, 20, 88),),
                          ),
                        ],
                      ),
                    )).toList(),
                  ),
                ),
              ),
            )
          ],
        )
    );
  }
}