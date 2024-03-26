import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ContainerAppBar extends StatelessWidget {
  const ContainerAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 300.0,
      floating: true,
      pinned: false,
      flexibleSpace: Container(
        height: 300,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/back.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: 10,),
              Text("Eplore the books!", style: GoogleFonts.poppins(fontSize: 15),),
            ],
          ),
        ),
      ),
    );
  }
}