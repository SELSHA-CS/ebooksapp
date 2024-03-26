import 'package:ebooksapp/controller/bookController.dart';
import 'package:ebooksapp/views/BookDetailsPage/bookdetpage.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class BookDet extends StatelessWidget {
  const BookDet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {

    var bookCntrl = Provider.of<BookController>(context);
    bookCntrl.fetchBook();

    return
      // Container(
      // height: MediaQuery.of(context).size.height,
      //   child: bookCntrl.isLoading == true
      //       ? Center(child: CircularProgressIndicator(),)
      //       :InkWell(
      //      onTap: (){
      //     //   Navigator.pushNamed(context, 'bookdetpage', arguments: ['id']);
      //     },
      //     child: ListView.builder(
      //       itemCount: bookCntrl.books.length,
      //       itemBuilder: (context, index) {
      //         final book = bookCntrl.books[index];
      //         final imageUrl = book.volumeInfo!.imageLinks!.thumbnail ?? "";
      //
      //         return ListTile(
      //           title: Text(book.volumeInfo!.title ?? ""),
      //           subtitle: Text(book.volumeInfo!.authors!.join(', ') ?? ""),
      //           leading: imageUrl.isNotEmpty
      //               ? Image.network(
      //             imageUrl,
      //             width: 50,
      //             height: 50,
      //             fit: BoxFit.cover,
      //           )
      //               : Container(
      //             width: 50,
      //             height: 50,
      //             color: Colors.grey,
      //           ),
      //         );
      //       },
      //     ),
      //   ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
              height: 500,
              width: MediaQuery.of(context).size.width,
              child: bookCntrl.isLoading == true
                  ? Center(child: CircularProgressIndicator(),)
                  : InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) => BookDetailsPage()));
                },
                    child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 5,
                        crossAxisSpacing: 5,
                        childAspectRatio: 1,
                        mainAxisExtent: 120),
                    itemCount: bookCntrl.books.length,
                    itemBuilder: (context, index){
                      final book = bookCntrl.books[index];
                      final imageUrl = book.volumeInfo!.imageLinks!.thumbnail ?? "";
                    
                      return Container(
                        child: Column(
                          children: [
                            Expanded(
                                child: imageUrl.isNotEmpty
                                    ? Container(
                    
                                  decoration: BoxDecoration(
                                    image: DecorationImage(
                                      image: NetworkImage(imageUrl),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                )
                                    : Container(
                    
                                )
                            ),
                          ],
                        ),
                      );
                    }),
                  )
          ),
        );
    //);
  }
}

