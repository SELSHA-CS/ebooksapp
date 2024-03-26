import 'package:ebooksapp/model/bookModel.dart';
import 'package:ebooksapp/services/HttpServices/BookService.dart';
import 'package:flutter/material.dart';

class BookController extends ChangeNotifier{

  List<Item> _books = [];
  List<Item> get books => _books;
  bool isLoading = true;

  Future<void> fetchBook() async{
    try{
      isLoading = false;
      final data = await BookService.fetchData();
      final List<dynamic> items = data['items'];

      _books = items.map((item) => Item.fromJson(item)).toList();
      notifyListeners();
    }
    catch(e){
      throw Exception('failed to load data');
    }
  }

}