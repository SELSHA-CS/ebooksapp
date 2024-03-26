import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RegTextButton extends StatelessWidget {
  VoidCallback onpressed;
  final String text;
  RegTextButton({
    super.key, required this.text, required this.onpressed
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onpressed,
      child:  Center(
        child: Text(
          text,
          style: GoogleFonts.poppins(
            fontSize: 15, 
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
