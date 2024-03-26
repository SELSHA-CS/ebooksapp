import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Color(0xFF1E319D),
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            accountName: Text("Selsha", style: GoogleFonts.poppins(color: Color(0xFF1E319D), fontSize: 20, fontWeight: FontWeight.bold)), 
            accountEmail: Text("Selsha@gmail.com", style: GoogleFonts.poppins(color: Color(0xFF1E319D), fontWeight: FontWeight.bold)),
            currentAccountPicture: Image.asset("assets/images/book.png"),
          ),
          ListTile(
            leading: Icon(Icons.home, color: Colors.white,),
            title: Text("Home", style: GoogleFonts.poppins(color: Colors.white),),
            onTap: (){
              //Navigator.of(context).push(MaterialPageRoute(builder: (context) => ))
            },
          ),
          ListTile(
            leading: Icon(Icons.person, color: Colors.white,),
            title: Text("Account", style: GoogleFonts.poppins(color: Colors.white),),
          ),
          ListTile(
            leading: Icon(Icons.settings, color: Colors.white,),
            title: Text("Settings", style: GoogleFonts.poppins(color: Colors.white),),
          ),
        ],
      ),
    );
  }
}

