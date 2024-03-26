import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeBookCat extends StatefulWidget {
  final String text1;
  HomeBookCat({
    super.key, required this.text1,
  });

  @override
  State<HomeBookCat> createState() => _HomeBookCatState();
}

class _HomeBookCatState extends State<HomeBookCat> {
  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.all(10),
      sliver: SliverToBoxAdapter(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(widget.text1, style: GoogleFonts.poppins(fontSize: 15, fontWeight: FontWeight.bold),),
            //IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward, size: 25, weight: 30,))
          ],
        ),
      ),
    );
  }
}

