import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:resturantadminpanel/Screen/home_page.dart';
import 'package:resturantadminpanel/Screen/login_page.dart';
import 'package:resturantadminpanel/controller/user_controller.dart';
import '../responsive.dart';
class Navbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return (!isMobile(context)) ? DesktopNavbar() : MobileNavbar();
  }
}
class DesktopNavbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
       gradient: LinearGradient(
     tileMode: TileMode.mirror,
     begin: Alignment.topLeft,
     end: Alignment.bottomRight,
     colors: [
       Color(0xffe79102),
       Color(0xfffbe263),
     ],
     stops: [
       0,
       1,
     ],
     ),
      ),
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40),
      child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
      TextButton(onPressed: (){
        Get.back();
      }, child: Text("Back",style: TextStyle(
        color: Colors.white,
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),)),
          Spacer(),
          TextButton(
            onPressed: () {
              signOut();
            },
            child: Row(
              children: [
                Text(
              "Logout",
              style: TextStyle(color: Colors.white),
            ),
                Icon(Icons.logout,color: Colors.white,),
              ],
            )
          )
        ],
      ),
    );
  }
}

class MobileNavbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Row(children: <Widget>[
        Spacer(),
        InkWell(
          onTap: () {},
          child: Icon(Icons.menu, color: Colors.black),
        ),
      ]),
    );
  }
}

class MobileDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          leading: TextButton(
              onPressed: () {},
              child: Icon(
                Icons.arrow_back,
                color: Colors.black,
              ))),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              MaterialButton(
                color: Colors.black54,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0))),
                onPressed: () {},
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 20.0, horizontal: 40.0),
                  child: Text(
                    "Home",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: 20),
              MaterialButton(
                color: Colors.black54,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0))),
                onPressed: () {},
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 20.0, horizontal: 40.0),
                  child: Text(
                    "Portfolio",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}

  FirebaseAuth _auth = FirebaseAuth.instance;
void signOut() async {
    try {
      await _auth.signOut();
      Get.to(() => LoginMain());
      Get.find<UserController>().clear();
    } catch (e) {
      Get.snackbar('Error Signing Out', e.toString(),
          snackPosition: SnackPosition.BOTTOM);
    }
  }