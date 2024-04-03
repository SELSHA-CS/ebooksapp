import 'package:ebooksapp/controller/bookController.dart';
import 'package:ebooksapp/views/BookDetailsPage/bookdetpage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends StatelessWidget {

  final BookController bookCntrlr = Get.put(BookController());

  @override
  Widget build(BuildContext context) {
    
    double screenHeight = MediaQuery.of(context).size.height;
    double appBarHeight = kToolbarHeight + MediaQuery.of(context).padding.top;
    double bottomNavBarHeight = kBottomNavigationBarHeight;

    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: 300.0,
            floating: true,
            pinned: false,
            flexibleSpace: Container(
              height: 300,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/back.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: 10,),
                    Text("Eplore the books!", style: TextStyle(fontSize: 15),),
                  ],
                ),
              ),
            ),
          ),
          SliverToBoxAdapter(child: Center(child: Text("Popular Books", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),))),
          SliverToBoxAdapter(
            child: bookCntrlr.isLoading.value
              ? Center(child: CircularProgressIndicator(),)
              : bookCntrlr.bookList.isEmpty
                ? Center(child: Text("No books available"),)
                : Container(
                    height: screenHeight - appBarHeight - bottomNavBarHeight,
                    child: Obx(() {
                      return GridView.builder(
                        //physics: NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 15,
                          mainAxisSpacing: 15,
                          childAspectRatio: 0.7,
                        ),
                        itemCount: bookCntrlr.bookList.length,
                        itemBuilder: (context, index) {
                          final book = bookCntrlr.bookList[index];
                          String? thumbnail = book.thumbnailUrl;
                          String? title = book.title;
                          String? desc = book.description;
                          String? authname = book.author;
                          String? year = book.publishedDate;
                          int? pg = book.pageCount;
                          return InkWell(
                          onTap: (){
                            Get.to(BookDet(thumbnail: thumbnail, title: title, desc: desc, authname: authname, year: year, pg: pg,));
                          },
                          child: Card(
                            color: Colors.blue,
                            child: Stack(
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Expanded(
                                      child: Container(
                                        height: 150,
                                        width: 150,
                                        decoration: BoxDecoration(
                                          image: DecorationImage(
                                              image: NetworkImage(
                                                thumbnail ?? "no image",
                                              ),fit: BoxFit.fill
                                          ),
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(15)
                                          )
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        title ?? 'No Title',
                                        maxLines: 2,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                      child: Text(
                                        authname ?? 'No Author',
                                        style: TextStyle(
                                          fontSize: 14,
                                          fontStyle: FontStyle.italic,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Positioned(
                                  top: -2,
                                  right: -5,
                                  child: Obx(() {
                                    return IconButton(
                                      icon: Icon(Icons.favorite, color: bookCntrlr.wishList.contains(book) ? Color.fromARGB(255, 8, 20, 88) : Colors.white,),
                                      onPressed: (){
                                        if(!bookCntrlr.wishList.contains(book)){
                                          bookCntrlr.addToWishList(book);
                                        }
                                        else{
                                          bookCntrlr.remFromWishList(book);
                                        }
                                      },
                                    );
                                  }),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }
                ),
              )
          ),
        ],
      ),
    );
  }
}
