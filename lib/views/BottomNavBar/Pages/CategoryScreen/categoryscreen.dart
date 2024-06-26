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

    catCntrl.fetchData(categoryname);

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 8, 20, 88),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 8, 20, 88),
        title: Text(categoryname, style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.bold),),
      ),
      body: Obx(() 
      {
        if (catCntrl.books.isNotEmpty) {
          return ListView.builder(
            itemCount: catCntrl.books.length,
            itemBuilder: (context, index) {
              final bookCat = catCntrl.books[index];
              String? thumbnail = bookCat.thumbnailUrl;
              String? title = bookCat.title;
              String? desc = bookCat.description;
              String? authname = bookCat.author;
              String? year = bookCat.publishedDate;
              int? pg = bookCat.pageCount;
              return InkWell(
                onTap: () {
                  Get.to(BookDet(
                    thumbnail: thumbnail,
                    title: title,
                    desc: desc,
                    authname: authname,
                    year: year,
                    pg: pg,
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
                            image: NetworkImage(thumbnail),
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
                            constraints: BoxConstraints(maxWidth: 200),
                            child: Text(
                              title ,
                              style: GoogleFonts.poppins(fontSize: 25),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 2, 
                            ),
                          ),
                          Text(authname, style: GoogleFonts.poppins(fontSize: 20)),
                          Text("${year}", style: GoogleFonts.poppins(fontSize: 15)),
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
      }
      ),
    );
  }
}
