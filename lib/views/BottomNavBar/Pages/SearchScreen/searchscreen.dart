import 'package:ebooksapp/services/DummyData/dummydata.dart';
import 'package:ebooksapp/widgets/booksdet.dart';
import 'package:ebooksapp/widgets/home_book_cat.dart';
import 'package:flutter/material.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({super.key});

  String greetings(){
    var hour = DateTime.now().hour;
    if(hour >= 5 && hour < 12){
      return "Good Morning!";
    }
    else if(hour >= 12 && hour < 18){
      return "Good Afternoon!";
    }
    else if(hour >= 18){
      return "Good Evening!";
    }
    else{
      return "Good Night!";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            title: Text(greetings()),
            bottom: AppBar(
              automaticallyImplyLeading: false,
              title: Container(
                child: TextField(
                  decoration: InputDecoration(
                    hintText: "Search...",
                    suffixIcon: Icon(Icons.search),
                  ),
                ),
              ),
            ),
          ),
          HomeBookCat(text1: "Trending"),
          //BookDet(),
          SliverPadding(
            padding: EdgeInsets.all(10),
            sliver: SliverToBoxAdapter(
              child: Container(
                height: MediaQuery.of(context).size.height,
                child: GridView.count(
                  scrollDirection: Axis.vertical,
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  childAspectRatio: 1.2,
                  children: books.map((book) => InkWell(
                    onTap: (){
                      Navigator.pushNamed(context, "bookdetails", arguments: book["id"]);
                    },
                    child: Container(
                      child: Column(
                        children: [
                          Expanded(
                            child: Container(
                              height: 100,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(book["image"]),
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )).toList(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}