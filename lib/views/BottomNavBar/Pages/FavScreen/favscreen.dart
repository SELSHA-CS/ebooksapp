import 'package:ebooksapp/controller/bookController.dart';
import 'package:ebooksapp/services/DummyData/dummydata.dart';
import 'package:ebooksapp/views/BookDetailsPage/bookdetpage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class FavScreen extends StatelessWidget {
  //const FavScreen({super.key});

  final BookController bookCntrlr = Get.put(BookController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: Color.fromARGB(255, 8, 20, 88),
        body: Obx(() {
            return CustomScrollView(
              slivers: [
                SliverAppBar(
                  //backgroundColor: Color.fromARGB(255, 8, 20, 88),
                  title: Text("My Favorites", style: GoogleFonts.poppins(color: Color.fromARGB(255, 8, 20, 88),),),
                ),
                SliverToBoxAdapter(
                  child: Container(
                    height: 700,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: GridView.builder(
                        scrollDirection: Axis.vertical,
                        //childAspectRatio: 0.8,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                        ),
                        itemCount: bookCntrlr.wishList.length,
                        itemBuilder: (BuildContext context, int index) {
                          var favBook = bookCntrlr.wishList[index];
                          String? thumbnail = favBook.thumbnailUrl ?? "";
                          String? title = favBook.title ?? "";
                          String? desc = favBook.description ?? "";
                          String? authname = favBook.author ?? "";
                          String? year = favBook.publishedDate ?? "";
                          int? pg = favBook.pageCount ?? 0;
                          return InkWell(
                            onTap: (){
                              Get.to(BookDet(
                                thumbnail: thumbnail!, 
                                title: title!, 
                                desc: desc!, 
                                authname: authname!, 
                                year: year!, 
                                pg: pg!
                              ));
                            },
                            child: Card(
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
                                    width: 150,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: NetworkImage(
                                          thumbnail ?? "No image available"
                                        ),
                                        fit: BoxFit.fill,
                                      ),
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(30),
                                      ),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 2,
                                  left: 0,
                                  child: IconButton(
                                    onPressed: (){
                                      if(!bookCntrlr.wishList.contains(favBook)){
                                        bookCntrlr.addToWishList(favBook);
                                      }
                                      else{
                                        bookCntrlr.remFromWishList(favBook);
                                      }
                                    },
                                    icon: CircleAvatar(
                                      radius: 20,
                                      child: Icon(Icons.favorite, color: bookCntrlr.wishList.contains(favBook) ? Color.fromARGB(255, 8, 20, 88) : Colors.white,))
                                  ),
                                  //child: Icon(Icons.favorite, color: Color.fromARGB(255, 8, 20, 88),),
                                ),
                              ],
                            ),
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                )
              ],
            );
          }
        )
    );
  }
}