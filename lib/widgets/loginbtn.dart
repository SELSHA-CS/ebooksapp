import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class LoginButton extends StatelessWidget {
  final String text;
  VoidCallback onpressed;
  
  LoginButton({
    super.key, required this.text, required this.onpressed
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onpressed,
      color: Color(0xFF1E319D),
      minWidth: 400,
      height: 50,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: Text(text, style: GoogleFonts.poppins(
        color: Colors.white,
        fontSize: 20),),
    );
  }
}