import 'package:flutter/material.dart';

class FormFields extends StatelessWidget {
  final TextEditingController cntrl;
  final String text;
  final IconData icons;
  final IconData? icons2;
  VoidCallback? onpressed;
  bool? otext;
  String? ochar;
  FormFields({
    required this.text, required this.icons, this.icons2, this.onpressed, this.otext, this.ochar, required this.cntrl
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: cntrl,
      obscureText: otext ?? false,
      obscuringCharacter: ochar ?? '#',
      decoration: InputDecoration(
        filled: true,
        fillColor: Color(0xFFE8E9F1),
        hintText: text,
        prefixIcon: Icon(icons),
        suffixIcon: IconButton(onPressed: onpressed, icon: Icon(icons2)),
        border: InputBorder.none,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(20),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.transparent),
          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }
}