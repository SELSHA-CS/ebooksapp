import 'package:flutter/material.dart';

class BookDet extends StatelessWidget {

  final String thumbnail;
  final String title;
  final String desc;

  const BookDet({super.key, required this.thumbnail, required this.title, required this.desc});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("BOOK DETAILS"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(thumbnail),
              Text(
                'Title: $title',
                style: TextStyle(fontSize: 24),
              ),
              SizedBox(height: 20),
              Text(
                'Description: $desc',
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
      )
    );
  }
}