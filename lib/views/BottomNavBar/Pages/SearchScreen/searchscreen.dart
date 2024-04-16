import 'package:ebooksapp/controller/searchcontroller.dart';
import 'package:ebooksapp/model/bookModel.dart';
import 'package:ebooksapp/services/DummyData/dummydata.dart';
import 'package:ebooksapp/views/BookDetailsPage/bookdetpage.dart';
import 'package:ebooksapp/widgets/home_book_cat.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchPage extends StatelessWidget {
  //const SearchPage({super.key});

  String greetings(){
    var hour = DateTime.now().hour;
    if(hour >= 5 && hour < 12){
      return "Good Morning!";
    }
    else if(hour >= 12 && hour < 18){
      return "Good Afternoon!";
    }
    else if(hour >= 18){
      return "Good Evening!";
    }
    else{
      return "Good Night!";
    }
  }

  final _search = TextEditingController();
  final SearchbController sCntrlr = Get.put(SearchbController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(greetings()),
      ),
      body: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                      controller: _search,
                      decoration: InputDecoration(
                        hintText: "Search...",
                        suffixIcon: IconButton(
                          onPressed: (){
                            String query = _search.text.trim();
                            if(query.isNotEmpty){
                              sCntrlr.serBooks(query);
                            }
                          }, 
                          icon: Icon(Icons.search)
                        ),
                      ),
                    ),
                ),
                  Flexible(
                  child: Obx(
                    () => ListView.builder(
                      itemCount: sCntrlr.sBook.length,
                      itemBuilder: (context, index) {
                        BookModel book = sCntrlr.sBook[index];
                        return InkWell(
                          onTap: (){
                            Get.to(() => BookDet(
                              thumbnail: book.thumbnailUrl, 
                              title: book.title, 
                              desc: book.description, 
                              authname: book.author, 
                              year: book.publishedDate, 
                              pg: book.pageCount));
                          },
                          child: ListTile(
                            leading: Image.network(book.thumbnailUrl),
                            title: Text(book.title),
                            subtitle: Text(book.author),
                            // You can add more details to display here
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ],
            ),
      // CustomScrollView(
      //   slivers: [
          // SliverAppBar(
          //   title: Text(greetings()),
            // bottom: AppBar(
            //   automaticallyImplyLeading: false,
            //   title: Column(
            //     children: [
            //       TextField(
            //         controller: _search,
            //         decoration: InputDecoration(
            //           hintText: "Search...",
            //           suffixIcon: IconButton(
            //             onPressed: (){
            //               String query = _search.text.trim();
            //               if(query.isNotEmpty){
            //                 sCntrlr.serBooks(query);
            //               }
            //             }, 
            //             icon: Icon(Icons.search)
            //           ),
            //         ),
            //       ),
            //       Expanded(
            //       child: Obx(
            //         () => ListView.builder(
            //           itemCount: sCntrlr.sBook.length,
            //           itemBuilder: (context, index) {
            //             BookModel book = sCntrlr.sBook[index];
            //             return ListTile(
            //               title: Text(book.title),
            //               subtitle: Text(book.author),
            //               // You can add more details to display here
            //             );
            //           },
            //         ),
            //       ),
            //     ),
            //     ],
            //   ),
            // ),
          //),
          // SliverToBoxAdapter(
          //   child: Column(
          //     children: [
          //       TextField(
          //           controller: _search,
          //           decoration: InputDecoration(
          //             hintText: "Search...",
          //             suffixIcon: IconButton(
          //               onPressed: (){
          //                 String query = _search.text.trim();
          //                 if(query.isNotEmpty){
          //                   sCntrlr.serBooks(query);
          //                 }
          //               }, 
          //               icon: Icon(Icons.search)
          //             ),
          //           ),
          //         ),
          //         Flexible(
          //         child: Obx(
          //           () => ListView.builder(
          //             itemCount: sCntrlr.sBook.length,
          //             itemBuilder: (context, index) {
          //               BookModel book = sCntrlr.sBook[index];
          //               return ListTile(
          //                 title: Text(book.title),
          //                 subtitle: Text(book.author),
          //                 // You can add more details to display here
          //               );
          //             },
          //           ),
          //         ),
          //       ),
          //     ],
          //   ),
          // )
          // HomeBookCat(text1: "Trending"),
          // //BookDet(),
          // SliverPadding(
          //   padding: EdgeInsets.all(10),
          //   sliver: SliverToBoxAdapter(
          //     child: Container(
          //       height: MediaQuery.of(context).size.height,
          //       child: GridView.count(
          //         scrollDirection: Axis.vertical,
          //         crossAxisCount: 2,
          //         mainAxisSpacing: 10,
          //         childAspectRatio: 1.2,
          //         children: books.map((book) => InkWell(
          //           onTap: (){
          //             Navigator.pushNamed(context, "bookdetails", arguments: book["id"]);
          //           },
          //           child: Container(
          //             child: Column(
          //               children: [
          //                 Expanded(
          //                   child: Container(
          //                     height: 100,
          //                     decoration: BoxDecoration(
          //                       image: DecorationImage(
          //                         image: AssetImage(book["image"]),
          //                         fit: BoxFit.fill,
          //                       ),
          //                     ),
          //                   ),
          //                 ),
          //               ],
          //             ),
          //           ),
          //         )).toList(),
          //       ),
          //     ),
          //   ),
          // ),
      //   ],
      // ),
    );
  }
}