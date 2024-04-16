// // // // screens/search_screen.dart
// // // import 'package:flutter/material.dart';
// // // import 'package:ebooksapp/controllers/search_controller.dart';
// // // import 'package:get/get.dart';

// // // class SearchScreen extends StatelessWidget {
// // //   final SearchController searchController = Get.put(SearchController());
// // //   final TextEditingController _searchController = TextEditingController();

// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       appBar: AppBar(
// // //         title: Text('Search Books'),
// // //       ),
// // //       body: Column(
// // //         children: [
// // //           Padding(
// // //             padding: const EdgeInsets.all(8.0),
// // //             child: TextField(
// // //               controller: _searchController,
// // //               decoration: InputDecoration(
// // //                 labelText: 'Search',
// // //                 suffixIcon: IconButton(
// // //                   icon: Icon(Icons.search),
// // //                   onPressed: () {
// // //                     String query = _searchController.text.trim();
// // //                     if (query.isNotEmpty) {
// // //                       searchController.searchBooks(query);
// // //                     }
// // //                   },
// // //                 ),
// // //               ),
// // //             ),
// // //           ),
// // //           Expanded(
// // //             child: Obx(
// // //               () => ListView.builder(
// // //                 itemCount: searchController.searchResults.length,
// // //                 itemBuilder: (context, index) {
// // //                   BookModel book = searchController.searchResults[index];
// // //                   return ListTile(
// // //                     title: Text(book.volumeInfo?.title ?? ''),
// // //                     subtitle: Text(book.volumeInfo?.authors?.join(', ') ?? ''),
// // //                     // You can add more details to display here
// // //                   );
// // //                 },
// // //               ),
// // //             ),
// // //           ),
// // //         ],
// // //       ),
// // //     );
// // //   }
// // // }
// Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: TextField(
//               controller: _search,
//               decoration: InputDecoration(
//                 labelText: 'Search',
//                 suffixIcon: IconButton(
//                   icon: Icon(Icons.search),
//                   onPressed: () {
//                     String query = _search.text.trim();
//                     if (query.isNotEmpty) {
//                       sCntrlr.serBooks(query);
//                     }
//                   },
//                 ),
//               ),
//             ),
//           ),
//           Expanded(
//             child: Obx(
//               () => ListView.builder(
//                 itemCount: sCntrlr.sBook.length,
//                 itemBuilder: (context, index) {
//                   BookModel book = sCntrlr.sBook[index];
//                   return ListTile(
//                     title: Text(book.title),
//                     subtitle: Text(book.author),
//                     // You can add more details to display here
//                   );
//                 },
//               ),
//             ),
//           ),
//         ],
//       ),