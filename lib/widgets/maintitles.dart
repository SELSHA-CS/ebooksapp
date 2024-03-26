import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MainTitles extends StatelessWidget {
  final String text1;
  final String text2;
  
  const MainTitles({
    super.key, required this.text1, required this.text2,
  });

  @override
  Widget build(BuildContext context) {
    return Container( 
      height: 250, 
      color: Color(0xFF1E319D), 
      child: Column( 
        mainAxisAlignment: MainAxisAlignment.center, 
        children: [ 
          Text(text1, style: GoogleFonts.poppins( 
            color: Colors.white, 
            fontSize: 25, 
            fontWeight: FontWeight.bold, 
          ),), 
          Text(text2, style: GoogleFonts.poppins( 
            color: Colors.white, 
            fontSize: 15, 
            fontWeight: FontWeight.bold, 
          ),), 
        ], 
      ), 
    );
  }
}
