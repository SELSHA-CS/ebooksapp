import 'package:ebooksapp/views/LoginPage/loginScreen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color(0xFF1E319D),
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
                backgroundColor: const Color(0xFF1E319D),
                expandedHeight: 200,
                flexibleSpace: Stack(
                  children: [
                    const Positioned(
                      top: 15,
                      left: 130,
                      child: CircleAvatar(
                        radius: 60,
                        backgroundImage: AssetImage("assets/images/profile_pic.jpg"),
                      ),
                    ),
                    Positioned(
                      top: 85,
                      right: 130,
                      child: CircleAvatar(
                        radius: 20,
                        backgroundColor: Colors.white,
                        child: IconButton(onPressed: (){}, icon: const Icon(Icons.edit, color: Colors.blue,)),
                      ),
                    ),
                    Positioned(
                      top: 150,
                      left: 110,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text("User name", style: GoogleFonts.poppins(color: Colors.white, fontSize: 20),),
                          Text("Username@gmail.com", style: GoogleFonts.poppins(color: Colors.white, fontSize: 17),),
                        ],
                      ),
                    )
                  ],
                )
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
                      ListTile(
                        leading: Icon(Icons.person),
                        title: Text("Profile"),
                        trailing: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward_ios)),
                      ),
                      ListTile(
                        leading: Icon(Icons.email),
                        title: Text("About Us"),
                        trailing: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward_ios)),
                      ),
                      ListTile(
                        leading: Icon(Icons.lock),
                        title: Text("Feedback"),
                        trailing: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward_ios)),
                      ),
                      ListTile(
                        leading: Icon(Icons.phone),
                        title: Text("Contact Us"),
                        trailing: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_forward_ios)),
                      ),
                      ListTile(
                        leading: Icon(Icons.logout),
                        title: Text("LogOut"),
                        trailing: IconButton(onPressed: (){
                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => Login())
                          );
                        }, icon: Icon(Icons.arrow_forward_ios)),
                      ),
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