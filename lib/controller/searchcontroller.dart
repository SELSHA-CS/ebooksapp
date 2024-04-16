import 'package:ebooksapp/model/bookModel.dart';
import 'package:ebooksapp/services/HttpServices/BookService.dart';
import 'package:get/get.dart';

class SearchbController extends GetxController{

  RxList<BookModel> sBook = <BookModel>[].obs;

  Future<void> serBooks(String query) async{
    try{
      List<BookModel> books = await BookService.searchBooks(query);
      sBook.assignAll(books);
    }
    catch(e){
      print("Error : $e");
    }
  }
}