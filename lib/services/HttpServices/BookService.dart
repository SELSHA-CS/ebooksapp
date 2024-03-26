import 'dart:convert';
import 'package:http/http.dart' as http;

class BookService{
  static Future<Map<String, dynamic>> fetchData() async{
    final response = await http.get(Uri.parse('https://www.googleapis.com/books/v1/volumes?q=all'));
    if(response.statusCode == 200){
      return jsonDecode(response.body);
    }
    else{
      throw Exception('Failed API');
    }
  }

}