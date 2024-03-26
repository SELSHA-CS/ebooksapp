import 'package:ebooksapp/model/bookModel.dart';
import 'package:ebooksapp/services/DummyData/dummydata.dart';
import 'package:ebooksapp/utils/colors.dart';
import 'package:ebooksapp/views/ReadScreen/readscreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BookDetailsPage extends StatelessWidget {
  const BookDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {

    final bookId = ModalRoute.of(context)?.settings.arguments;
    final book = books.firstWhere((element) => element["id"] == bookId);

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
                        image: DecorationImage(image: AssetImage(book["image"]))
                    ),
                  ),
                  Text(book["book_name"], style: GoogleFonts.poppins(fontSize: 15, color: Colors.white),),
                  Text(book["author_name"], style: GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white)),
                  Text("${book["year"]}", style: GoogleFonts.poppins(fontSize: 15, color: Colors.white)),
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
                    child: Text(book["content"]),
                  ),
                  SizedBox(height: 100,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      InkWell(
                        // onTap: (){
                        //   Navigator.pushNamed(context, "favpage", arguments: book["id"]);
                        // },
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
                            //Navigator.pushNamed(context, "readbook", arguments: book["content"]);
                          },
                          child: MaterialButton(
                            onPressed: () {
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context) => ReadScreen(),
                                ),
                              );
                            },
                            // onPressed: (){
                            //   Navigator.of(context).push(
                            //     MaterialPageRoute(builder: (context) => ReadScreen(bookId: book["id"]))
                            //   );
                            //   //Navigator.pushNamed(context, "readbook", arguments: book["content"]);
                            // },
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
                                    Text("${book["pages"]} pages"),
                                  ],
                                )
                              ],
                            ),
                          )
                        //}
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