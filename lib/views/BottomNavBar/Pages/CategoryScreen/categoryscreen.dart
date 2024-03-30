// import 'package:ebooksapp/controller/catcontroller.dart';
// import 'package:ebooksapp/views/BookDetailsPage/bookdetpage.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:google_fonts/google_fonts.dart';

// class CategoryPage extends StatelessWidget {

//   final String categoryname;

//   CategoryPage({required this.categoryname});

//   final CategoryController catCntrl = Get.put(CategoryController());

//   @override
//   Widget build(BuildContext context) {

//     catCntrl.fetchData(categoryname);

//     return Scaffold(
//       backgroundColor: Color.fromARGB(255, 8, 20, 88),
//       appBar: AppBar(
//         backgroundColor: Color.fromARGB(255, 8, 20, 88),
//         title: Text(categoryname, style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.bold),),
//       ),
//       body: Obx(() {
//         if (catCntrl.books.isNotEmpty) {
//           return ListView.builder(
//             itemCount: catCntrl.books.length,
//             itemBuilder: (context, index) {
//               final bookCat = catCntrl.books[index];
//               String? thumbnail = bookCat.items?[index].volumeInfo?.imageLinks?.thumbnail ?? "";
//               String? title = bookCat.items?[index].volumeInfo?.title ?? "";
//               String? desc = bookCat.items?[index].volumeInfo?.description ?? "";
//               String? authname = bookCat.items?[index].volumeInfo?.authors?.join(', ') ?? "";
//               DateTime? year = bookCat.items?[index].volumeInfo?.publishedDate ?? DateTime.now();
//               int? pg = bookCat.items?[index].volumeInfo?.pageCount ?? 0;
//               return InkWell(
//                 onTap: () {
//                   Get.to(BookDet(
//                     thumbnail: thumbnail,
//                     title: title,
//                     desc: desc,
//                     authname: authname,
//                     year: year,
//                     pg: pg,
//                   ));
//                 },
//                 child: Card(
//                   elevation: 5,
//                   child: Row(
//                     children: [
//                       Container(
//                         height: 150,
//                         width: 150,
//                         decoration: BoxDecoration(
//                           image: DecorationImage(
//                             image: NetworkImage(thumbnail ?? ""),
//                             fit: BoxFit.fill,
//                           ),
//                           borderRadius: BorderRadius.only(
//                             topLeft: Radius.circular(10),
//                             bottomLeft: Radius.circular(10),
//                           ),
//                         ),
//                       ),
//                       SizedBox(width: 10),
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Container(
//                             constraints: BoxConstraints(maxWidth: 200), // Adjust the maximum width as needed
//                             child: Text(
//                               title ?? "",
//                               style: GoogleFonts.poppins(fontSize: 25),
//                               overflow: TextOverflow.ellipsis,
//                               maxLines: 2, // Adjust the max number of lines
//                             ),
//                           ),
//                           Text(authname ?? "", style: GoogleFonts.poppins(fontSize: 20)),
//                           Text("${year}", style: GoogleFonts.poppins(fontSize: 15)),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               );
//             },
//           );
//         } else {
//           return Center(
//             child: Text("No books available"),
//           );
//         }
//       }),
//     );
//   }
// }
import 'package:ebooksapp/controller/catcontroller.dart';
import 'package:ebooksapp/views/BookDetailsPage/bookdetpage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CategoryPage extends StatelessWidget {
  final String categoryname;

  CategoryPage({required this.categoryname});

  final CategoryController catCntrl = Get.put(CategoryController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryname),
      ),
      body: 
      // Obx(() {
      //   return 
        FutureBuilder(
  future: catCntrl.fetchData(categoryname), 
  builder: (context, snapshot){
    if (snapshot.connectionState == ConnectionState.waiting) {
      return Center(child: CircularProgressIndicator());
    } else if (snapshot.hasError) {
      return Center(child: Text('Error fetching data'));
    } else {
      if (catCntrl.books.isEmpty) {
        return Center(child: Text('No books found'));
      } else {
        return ListView.builder(
          itemCount: catCntrl.books.length,
          itemBuilder: (context, index){
            if (index >= catCntrl.books.length) {
              return SizedBox.shrink(); // Index out of bounds, return an empty widget
            }
            final bookCat = catCntrl.books[index];
            String? thumbnail = bookCat.items?[index].volumeInfo?.imageLinks?.thumbnail ?? "";
            String? title = bookCat.items?[index].volumeInfo?.title ?? "";
            String? desc = bookCat.items?[index].volumeInfo?.description ?? "";
            String? authname = bookCat.items?[index].volumeInfo?.authors?.join(', ') ?? "";
            DateTime? year = bookCat.items?[index].volumeInfo?.publishedDate ?? DateTime.now();
            int? pg = bookCat.items?[index].volumeInfo?.pageCount ?? 0;
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
              child: ListTile(
                leading: Image.network(thumbnail ?? ""),
                title: Text(title ?? ""),
              ),
            );
          },
        );
      }
    }
  }
)

      //})
    );
  }
}
