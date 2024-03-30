import 'dart:convert';
import 'package:ebooksapp/model/bookModel.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class CategoryController extends GetxController {
  List<String> categoryList = [
    'Fiction', 'Action', 'Adventure', 'Novel', 'Horror', 'romantic', 'Anime',
    'classic', 'Fantasy', 'History', 'Crime', 'comic'
  ];

  var category = ''.obs;
  RxList books = <BookModel>[].obs;
  var isLoading = false.obs;

  void onTap(int index) {
    category.value = categoryList[index].toLowerCase();
    fetchData(category.value);
  }

  Future<void> fetchData(String category) async {
    isLoading.value = true;
    final url = Uri.parse("https://www.googleapis.com/books/v1/volumes?q=$category");

    try {
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final Map<String, dynamic> decodeddata = jsonDecode(response.body);
        if (decodeddata['items'] != null) {
          final List<BookModel> newBooks = decodeddata['items']
              .map<BookModel>((bookData) => BookModel.fromJson(bookData))
              .toList();
          books.addAll(newBooks);
        }
      } else {
        print("Api failed");
      }
    } catch (e) {
      print("Exception occurred: $e");
    } finally {
      isLoading.value = false;
    }
  }
}
