import 'package:ebooksapp/utils/images.dart';
import 'package:ebooksapp/views/LoginPage/loginScreen.dart';
import 'package:ebooksapp/views/RegisterPage/registerScreen.dart';
import 'package:ebooksapp/widgets/buttons.dart';
import 'package:ebooksapp/widgets/regtextbtn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:google_fonts/google_fonts.dart';

class IntroScreen extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 0,
            child: Container(
              height: 400,
              width: 400,
              child: Image.asset(introI),
            ),
          ),
          Positioned(
            top: 331,
            child: ClipPath(
              clipper: WaveClipperTwo(reverse: true, ),
              child: Container(
                height: 450,
                width: MediaQuery.of(context).size.width,
                color: Color(0xFF1E319D),
              ),
            ),
          ),
          Positioned(
            left: 70,
            top: 450,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Get Started!", style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                  ),
                )),
                Text("Join us now and Start your Journey.", style: GoogleFonts.poppins(
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                )),
              ],
            ),
          ),
          Positioned(
            bottom: 160,
            left: 50,
            child: MyButton(
              text: 'Create New Account',
              onPressed: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => Register())
                );
              },
            ),
          ),
          Positioned(
            bottom: 80,
            left: 50,
            child: MaterialButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                  side: BorderSide(
                    color: Colors.white,
                    width: 5,
                  )
              ),
              elevation: 10,
              minWidth: 300,
              height: 50,
              onPressed: (){
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => Login())
                );
              },
              child: Text(
                "Login To Account",
                style: GoogleFonts.poppins(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
            ),
            // MyButton(
            //   text: 'Login To Account',
            //   onPressed: (){
            //     Navigator.pushReplacement(context,
            //       MaterialPageRoute(builder: (context) => Login())
            //     );
            //   }
            // ),
          ),
        ],
      ),
    );
  }

}

