import 'package:ebooksapp/views/IntroScreen/introScreen.dart';
import 'package:flutter/material.dart';

class LeadIcons extends StatelessWidget {
  const LeadIcons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding( 
      padding: const EdgeInsets.all(8.0), 
      child: CircleAvatar( 
        radius: 20, 
        backgroundColor: Colors.white, 
        child: IconButton(onPressed: (){ 
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => IntroScreen())); 
        }, 
        icon: Padding( 
          padding: const EdgeInsets.all(2.0), 
          child: Icon(Icons.arrow_back_ios), 
        )) 
      ), 
    );
  }
}

