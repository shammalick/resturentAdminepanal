import 'dart:html';
import 'package:firebase/firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:resturantadminpanel/Screen/home_page.dart';
import 'package:resturantadminpanel/Screen/signup_page.dart';
import 'package:resturantadminpanel/controller/auth_controller.dart';
import 'package:resturantadminpanel/controller/user_controller.dart';
import 'package:resturantadminpanel/responsive.dart';
import 'package:resturantadminpanel/service/database.dart';
import 'package:resturantadminpanel/widget/navbar.dart';

class Login extends StatelessWidget {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
//   login()async{
//     try{
//       await FirebaseAuth.instance.signInWithEmailAndPassword(email: emailController.text, password: passwordController.text);
// Get.offAll(Home());
//     }
//     catch(e){
//  Get.snackbar('Error Signing In', e.toString(),
//           snackPosition: SnackPosition.BOTTOM);
//     }

  // }
  void login(String email, String password) async {
    FirebaseAuth _auth = FirebaseAuth.instance;
    try {
      print("login tryaaaaaaaaaaaaaaaa");
      UserCredential _authResult = await _auth.signInWithEmailAndPassword(
          email: email, password: password);
      print("login ---------------------============");
      Get.offAll(Home());
      Get.find<UserController>().user =
          await Database().getUser(_authResult.user!.uid);
    } catch (e) {
      Get.snackbar('Error Signing In', e.toString(),
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  // TextEditingController price = TextEditingController();
  // TextEditingController sqt = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Column(
        children: [
          SizedBox(height: 100,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Login Resturent admin",
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Colors.black),
              ),
            ],
          ),
          Container(
            padding:
                const EdgeInsets.symmetric(vertical: 70.0, horizontal: 150.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: TextFormField(
                        controller: emailController,
                        decoration: const InputDecoration(
                          hintText: "Email",
                          hintStyle:
                              TextStyle(color: Colors.grey, fontSize: 20.0),
                        ),
                      ),
                    ),
                    SizedBox(width: 50),
                    Expanded(
                      child: TextFormField(
                        controller: passwordController,
                        decoration: InputDecoration(
                          hintText: "Password",
                          hintStyle:
                              TextStyle(color: Colors.grey, fontSize: 20.0),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 50),
                MaterialButton(
                  color: Colors.red,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20.0))),
                  onPressed: () {
                    login(emailController.text, passwordController.text);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        vertical: 20.0, horizontal: 40.0),
                    child: Text(
                      "Sign up",
                      style: TextStyle(
                          color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(height: 50),
                TextButton(
                    onPressed: () {
                      Get.to(SignupMain());
                    },
                    child: Text("If you have not register creat account")),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}

class LoginMobile extends StatelessWidget {
  TextEditingController title = TextEditingController();
  TextEditingController dec = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController sqt = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(30.0),
        child: Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: Text(
                      "Add New Product",
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 30),
              TextFormField(
                controller: title,
                decoration: InputDecoration(
                  hintText: "Title",
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 15.0),
                ),
              ),
              SizedBox(height: 30),
              TextFormField(
                controller: dec,
                decoration: InputDecoration(
                  hintText: "Description",
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 15.0),
                ),
              ),
              SizedBox(height: 30),
              TextFormField(
                controller: price,
                decoration: InputDecoration(
                  hintText: "Price",
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 15),
                ),
              ),
              SizedBox(height: 30),
              TextFormField(
                controller: sqt,
                decoration: InputDecoration(
                  hintText: "SQT",
                  hintStyle: TextStyle(color: Colors.grey, fontSize: 15),
                ),
              ),
              SizedBox(height: 30),
              MaterialButton(
                color: Colors.red,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(20.0))),
                onPressed: () async {},
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 20.0, horizontal: 40.0),
                  child: Text(
                    "Sign Up",
                    style: TextStyle(
                        color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}

class LoginMain extends GetWidget<AuthController> {
  @override
  Widget build(BuildContext context) {
    return (!isMobile(context)) ? Login() : LoginMobile();
  }
}
