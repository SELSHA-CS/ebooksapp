import 'package:ebooksapp/controller/catcontroller.dart';
import 'package:ebooksapp/views/BookDetailsPage/bookdetpage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryPage extends StatelessWidget {

  final String categoryname;

  CategoryPage({required this.categoryname});

  final CategoryController catCntrl = Get.put(CategoryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 8, 20, 88),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 8, 20, 88),
        title: Text(categoryname, style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.bold),),
      ),
      body: Obx(() {
        if (catCntrl.books.isNotEmpty) {
          return ListView.builder(
            itemCount: catCntrl.books.length,
            itemBuilder: (context, index) {
              final bookCat = catCntrl.books[index];
              return InkWell(
                onTap: () {
                  Get.to(BookDet(
                    thumbnail: bookCat.items?[index].volumeInfo?.imageLinks?.thumbnail ?? "",
                    title: bookCat.items?[index].volumeInfo?.title ?? "",
                    desc: bookCat.items?[index].volumeInfo?.description ?? "",
                    authname: bookCat.items?[index].volumeInfo?.authors?.join(', ') ?? "",
                    year: bookCat.items?[index].volumeInfo?.publishedDate ?? DateTime.now(),
                    pg: bookCat.items?[index].volumeInfo?.pageCount ?? 0,
                  ));
                },
                child: Card(
                  elevation: 5,
                  child: Row(
                    children: [
                      Container(
                        height: 150,
                        width: 150,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(bookCat.items![index].volumeInfo?.imageLinks?.thumbnail ?? ""),
                            fit: BoxFit.fill,
                          ),
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomLeft: Radius.circular(10),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            constraints: BoxConstraints(maxWidth: 200), // Adjust the maximum width as needed
                            child: Text(
                              bookCat.items?[index].volumeInfo?.title ?? "",
                              style: GoogleFonts.poppins(fontSize: 25),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2, // Adjust the max number of lines
                            ),
                          ),
                          Text(bookCat.items?[index].volumeInfo?.authors?.join(', ') ?? "", style: GoogleFonts.poppins(fontSize: 20)),
                          Text("${bookCat.items?[index].volumeInfo?.publishedDate ?? DateTime.now()}", style: GoogleFonts.poppins(fontSize: 15)),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            },
          );
        } else {
          return Center(
            child: Text("No books available"),
          );
        }
      }),
      // body: Obx(() {
      //     return ListView.builder(
      //       itemCount: catCntrl.books.length,
      //       itemBuilder: (context, index) {
      //         final bookCat = catCntrl.books[index];
      //         return InkWell(
      //           onTap: () {
      //             Get.to(BookDet(
      //               thumbnail: bookCat.items?[index].volumeInfo?.imageLinks!.thumbnail ?? "", 
      //               title: bookCat.items?[index].volumeInfo?.title ?? "", 
      //               desc: bookCat.items?[index].volumeInfo?.description ?? "", 
      //               authname: bookCat.items?[index].volumeInfo?.authors?.join(', ') ?? "", 
      //               year: bookCat.items?[index].volumeInfo?.publishedDate ?? DateTime.now(), 
      //               pg: bookCat.items?[index].volumeInfo?.pageCount ?? 0
      //             ));
      //           },
      //           child: Card(
      //             elevation: 5,
      //             child: Row(
      //               children: [
      //                 Container(
      //                   height: 150,
      //                   width: 150,
      //                   decoration: BoxDecoration(
      //                       image: DecorationImage(image: NetworkImage(bookCat.items![index].volumeInfo?.imageLinks!.thumbnail ?? ""), fit: BoxFit.fill),
      //                       borderRadius: BorderRadius.only(
      //                           topLeft: Radius.circular(10),
      //                           bottomLeft: Radius.circular(10)
      //                       )
      //                   ),
      //                 ),
      //                 SizedBox(width: 10,),
      //                 Column(
      //                   crossAxisAlignment: CrossAxisAlignment.start,
      //                   children: [
      //                     Container(
      //                       constraints: BoxConstraints(maxWidth: 200), // Adjust the maximum width as needed
      //                       child: Text(
      //                         bookCat.items?[index].volumeInfo?.title ?? "",
      //                         style: GoogleFonts.poppins(fontSize: 25),
      //                         overflow: TextOverflow.ellipsis,
      //                         maxLines: 2, // Adjust the max number of lines
      //                       ),
      //                     ),
      //                     //Flexible(child: Text(book["book_name"], style: GoogleFonts.poppins(color: Colors.white, fontSize: 25))),
      //                     Text(bookCat.items?[index].volumeInfo?.authors?.join(', ') ?? "", style: GoogleFonts.poppins(fontSize: 20)),
      //                     Text("${bookCat.items?[index].volumeInfo?.publishedDate ?? DateTime.now()}", style: GoogleFonts.poppins(fontSize: 15)),
      //                   ],
      //                 ),
      //               ],
      //             ),
      //           ),
      //         );
      //       },
      //     );
      //   }
      // ),
    );
  }
}
