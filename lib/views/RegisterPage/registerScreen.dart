import 'package:ebooksapp/services/FireBaseS/fbasefn.dart';
import 'package:ebooksapp/widgets/formfields.dart';
import 'package:ebooksapp/widgets/leadicons.dart';
import 'package:ebooksapp/widgets/loginbtn.dart';
import 'package:ebooksapp/widgets/maintitles.dart';
import 'package:ebooksapp/widgets/regtextbtn.dart';
import 'package:ebooksapp/views/LoginPage/loginScreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {

  final email = TextEditingController();
  final pass = TextEditingController();

  bool pwd1 = true;
  bool pwd2 = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xFF1E319D),
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Color(0xFF1E319D),
              leading: LeadIcons(),
              expandedHeight: 200,
              flexibleSpace: MainTitles(
                text1: "Let's Start",
                text2: 'Create an account',),
            ),
            SliverToBoxAdapter(
              child: Container(
                height: 600,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(40),
                      topRight: Radius.circular(40),
                    )
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 30,),
                      Text("Sign In", style: GoogleFonts.poppins(
                          fontSize: 25, fontWeight: FontWeight.bold),),
                      SizedBox(height: 30,),
                      FormFields(
                        cntrl: email,
                        text: 'Username',
                        icons: Icons.person,
                      ),
                      SizedBox(height: 30,),
                      FormFields(
                        cntrl: pass,
                        text: 'Password',
                        icons: Icons.lock,
                        onpressed: (){
                          setState(() {
                            if(pwd1){
                              pwd1 = false;
                            }
                            else{
                              pwd1 = true;
                            }
                          });
                        },
                        icons2: pwd1 == true ? Icons.visibility : Icons.visibility_off,
                        otext: pwd1,
                        ochar: '*',
                      ),
                      //SizedBox(height: 30,),
                      // FormFields(
                      //   text: 'Confirm Password',
                      //   icons: Icons.lock,
                      //   onpressed: (){
                      //     setState(() {
                      //       if(pwd2){
                      //         pwd2 = false;
                      //       }
                      //       else{
                      //         pwd2 = true;
                      //       }
                      //     });
                      //   },
                      //   icons2: pwd2 == true ? Icons.visibility : Icons.visibility_off,
                      //   otext: pwd2,
                      //   ochar: '*',
                      // ),
                      SizedBox(height: 30,),
                      LoginButton(
                        text: 'REGISTER',
                        onpressed: () {
                          String emaill = email.text.trim();
                          String password = pass.text.trim();
                          FireBaseFunction().registerUser(email:emaill,pwd:password)
                              .then((response) {
                            if(response == null){
                              Navigator.of(context).push(
                                  MaterialPageRoute(builder: (context) => Login())
                              );
                            }
                            else{
                              ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text(response))
                              );
                            }
                          });
                          // Navigator.of(context).push(
                          //     MaterialPageRoute(builder: (context) => Login())
                          // );
                        },
                      ),
                      SizedBox(height: 20,),
                      RegTextButton(
                        text: "Already have an account. Sign In",
                        onpressed: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(builder: (context) => Login())
                          );
                        },),
                    ],
                  ),
                ),
              ),
            ),
          ],
        )
    );
  }
}