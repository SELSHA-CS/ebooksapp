import 'package:ebooksapp/model/bookModel.dart';
import 'package:ebooksapp/services/HttpServices/BookService.dart';
import 'package:get/get.dart';

class BookController extends GetxController {
  var isLoading = true.obs;
  RxList<BookModel> bookList = RxList<BookModel>();

  final RxList<BookModel> _wishList = <BookModel>[].obs;
  RxList<BookModel> get wishList => _wishList;

  void addToWishList(BookModel favBook){
    _wishList.add(favBook);
    print(_wishList);
  }

  void remFromWishList(BookModel favBook){
    _wishList.remove(favBook);
    print(_wishList);
  }

  @override
  void onInit() {
    super.onInit();
    fetchBooks();
  }

  Future<void> fetchBooks() async {
    try {
      isLoading(true);
      var books = await BookService.fetchBooks();
      final List<dynamic> items = books['items'];
      bookList.assignAll(items.map((item) => BookModel.fromJson(item)).toList());
    } catch (e) {
      print(e);
      bookList.clear(); // Clear bookList if there's an error
    } finally {
      isLoading(false);
    }
  }
}
