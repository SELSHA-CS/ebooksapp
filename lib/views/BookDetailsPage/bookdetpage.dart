import 'package:ebooksapp/utils/colors.dart';
import 'package:ebooksapp/views/ReadScreen/readscreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BookDet extends StatelessWidget {

  final String thumbnail;
  final String title;
  final String desc;
  final String authname;
  final DateTime year;
  final int pg;

  const BookDet({super.key, required this.thumbnail, required this.title, required this.desc, required this.authname, required this.year, required this.pg});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: dBlue,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: dBlue,
            expandedHeight: 350,
            flexibleSpace: Container(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    height: 300,
                    decoration: BoxDecoration(
                        image: DecorationImage(image: NetworkImage(thumbnail))
                    ),
                  ),
                  Text(title, style: GoogleFonts.poppins(fontSize: 15, color: Colors.white),),
                  Text(authname, style: GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white)),
                  Text("${year.year}", style: GoogleFonts.poppins(fontSize: 15, color: Colors.white)),
                ],
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: 700,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
              ),
              child: Column(
                children: [
                  SizedBox(
                    width: 50,
                    child: Divider(
                      thickness: 5,
                      color: Color.fromARGB(255, 8, 20, 88),
                    ),
                  ),
                  Text("Description", style: GoogleFonts.poppins(fontSize: 20, fontWeight: FontWeight.bold),),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(desc),
                  ),
                  SizedBox(height: 100,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        child: MaterialButton(
                          onPressed: (){
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text("successfully added to favorites"))
                            );
                          },
                          color: Color.fromARGB(255, 8, 20, 88),
                          height: 65,
                          elevation: 10,
                          shape: const RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(15),
                                bottomLeft: Radius.circular(15),
                              )
                          ),
                          child: Row(
                            children: [
                              Icon(Icons.favorite, color: Colors.white,),
                              Column(
                                children: [
                                  Text("Add to", style: GoogleFonts.poppins(color: Colors.white),),
                                  Text("Favorites", style: GoogleFonts.poppins(color: Colors.white),),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                      InkWell(
                          onTap: (){
                          },
                          child: MaterialButton(
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => ReadScreen(),
                                ),
                              );
                            },
                            color: Colors.grey,
                            minWidth: 100,
                            height: 65,
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(15),
                                  bottomRight: Radius.circular(15),
                                )
                            ),
                            child: Row(
                              children: [
                                Icon(Icons.book_rounded),
                                Column(
                                  children: [
                                    Text("Read"),
                                    Text("${pg} pages"),
                                  ],
                                )
                              ],
                            ),
                          )
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}