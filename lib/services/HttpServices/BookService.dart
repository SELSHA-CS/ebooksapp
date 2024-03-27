import 'dart:convert';
import 'package:http/http.dart' as http;

class BookService{

  static Future<Map<String, dynamic>> fetchBooks() async{
    final url = "https://www.googleapis.com/books/v1/volumes?q=all";
    final uri = Uri.parse(url);
    var response = await http.get(uri);
    if(response.statusCode == 200){
      var jsonData = jsonDecode(response.body);
      return jsonData;
      //return jsonDecode(data);
    }
    else{
      throw Exception();
    }
  }

  static Future<String> fetchCatBooks(String category) async{
    final url = "https://www.googleapis.com/books/v1/volumes?q=$category";
    final uri = Uri.parse(url);
    var response = await http.get(uri);
    if(response.statusCode == 200){
      var jsonData = jsonEncode(response.body);
      return jsonData;
    }
    else{
      throw Exception();
    }
  }
}