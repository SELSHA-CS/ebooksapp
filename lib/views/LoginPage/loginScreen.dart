import 'package:ebooksapp/services/FireBaseS/fbasefn.dart';
import 'package:ebooksapp/views/BottomNavBar/bottomNavBars.dart';
import 'package:ebooksapp/views/RegisterPage/registerScreen.dart';
import 'package:ebooksapp/widgets/formfields.dart';
import 'package:ebooksapp/widgets/leadicons.dart';
import 'package:ebooksapp/widgets/loginbtn.dart';
import 'package:ebooksapp/widgets/maintitles.dart';
import 'package:ebooksapp/widgets/regtextbtn.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  final email = TextEditingController();
  final pass = TextEditingController();
  bool pwd1 = true;

  @override Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF1E319D),
        body: CustomScrollView(
          slivers: [
            const SliverAppBar(
              backgroundColor: Color(0xFF1E319D),
              leading: LeadIcons(),
              expandedHeight: 200,
              flexibleSpace: MainTitles(
                text1: 'Welcome Back',
                text2: 'Sign in to your account',),
            ),
            SliverToBoxAdapter(
              child: Container(
                height: 600,
                decoration: const BoxDecoration(
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
                      const SizedBox(height: 30,),
                      Text("Sign In", style: GoogleFonts.poppins(
                          fontSize: 25, fontWeight: FontWeight.bold),),
                      const SizedBox(height: 30,),
                      FormFields(
                        cntrl: email,
                        text: 'Username',
                        icons: Icons.person,
                      ),
                      const SizedBox(height: 30,),
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
                      const SizedBox(height: 30,),
                      LoginButton(
                        text: 'LOGIN',
                        onpressed: () {
                          FireBaseFunction().loginUser(emaill:email.text.trim(), pwd:pass.text.trim())
                              .then((response){
                            if(response == null){
                              Navigator.of(context).push(MaterialPageRoute(builder: (context)=> BottomNavBar()));
                            }
                          });
                          // Navigator.of(context).push(
                          //     MaterialPageRoute(builder: (context) => const BottomNavBar())
                          // );
                        },),
                      const SizedBox(height: 20,),
                      RegTextButton(
                        text: "I'm a new user. Sign Up",
                        onpressed: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(builder: (context) => const Register())
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