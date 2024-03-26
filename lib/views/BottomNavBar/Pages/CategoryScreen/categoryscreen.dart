
import 'package:ebooksapp/services/DummyData/dummydata.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryPage extends StatelessWidget {
  final String category;

  CategoryPage({Key? key, required this.category}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final cat = books.where((book) => book["category"].toLowerCase() == category.toLowerCase()).toList();

    return Scaffold(
      backgroundColor: Color.fromARGB(255, 8, 20, 88),
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 8, 20, 88),
        title: Text(category, style: GoogleFonts.poppins(color: Colors.white, fontWeight: FontWeight.bold),),
      ),
      body: ListView.builder(
        itemCount: cat.length,
        itemBuilder: (context, index) {
          final book = cat[index];
          return InkWell(
            onTap: (){
              Navigator.pushNamed(context, "bookdetails", arguments: book["id"]);
            },
            child: Card(
              elevation: 5,
              child: Row(
                children: [
                  Container(
                    height: 150,
                    width: 150,
                    decoration: BoxDecoration(
                        image: DecorationImage(image: AssetImage(book["image"]), fit: BoxFit.fill),
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(10),
                            bottomLeft: Radius.circular(10)
                        )
                    ),
                  ),
                  SizedBox(width: 10,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        constraints: BoxConstraints(maxWidth: 200), // Adjust the maximum width as needed
                        child: Text(
                          book["book_name"],
                          style: GoogleFonts.poppins(fontSize: 25),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2, // Adjust the max number of lines
                        ),
                      ),
                      //Flexible(child: Text(book["book_name"], style: GoogleFonts.poppins(color: Colors.white, fontSize: 25))),
                      Text(book["author_name"], style: GoogleFonts.poppins(fontSize: 20)),
                      Text("${book["year"]}", style: GoogleFonts.poppins(fontSize: 15)),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
