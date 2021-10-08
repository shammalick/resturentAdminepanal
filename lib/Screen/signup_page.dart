import 'dart:html';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:resturantadminpanel/Binding/all_binding.dart';
import 'package:resturantadminpanel/Model/user_model.dart';
import 'package:resturantadminpanel/Screen/login_page.dart';
import 'package:resturantadminpanel/controller/auth_controller.dart';
import 'package:resturantadminpanel/controller/user_controller.dart';
import 'package:resturantadminpanel/responsive.dart';
import 'package:resturantadminpanel/service/database.dart';
import 'package:resturantadminpanel/widget/navbar.dart';

import 'home_page.dart';

Rxn<String> imagUrl=Rxn<String>();

uploadToStorage() {
  FileUploadInputElement input = FileUploadInputElement()..accept = 'image/*';
  FirebaseStorage fs = FirebaseStorage.instance;
  input.click();
  input.onChange.listen((event) {
    final file = input.files!.first;
    final reader = FileReader();
    reader.readAsDataUrl(file);
    reader.onLoadEnd.listen((event) async {
      var snapshot =
          await fs.ref().child("Recipes/${(file.name)}").putBlob(file);
      String downloadUrl = await snapshot.ref.getDownloadURL();

      imagUrl.value = downloadUrl;
    });
  });
}
 void createUser(
    String name,
    String contact,
    String branch,
    String email,
    String password,
    String image,
  ) async {
    
  FirebaseAuth _auth = FirebaseAuth.instance;
    try {
      
      UserCredential _authResult = await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      // create user in database.dart
      UserModel _user = UserModel(
        id: _authResult.user!.uid,
        name: name,
        contact: contact,
        branch: branch,
        imagUrl: image,
        email: _authResult.user!.email!,
      );
      if (await Database().createNewUser(_user)) {
        Get.offAll(()=>Home(),binding: CategoryBinding());
        Get.find<UserController>().user = _user;
        
      }
    } catch (e) {
      Get.snackbar(
        'Error Creating Account',
        e.toString(),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

// signup(
//      String name,
//     String contact,
//     String branch,
//     String email,
//     String password,
//     String image,
//   ){
//     try{
//       FirebaseAuth.instance.createUserWithEmailAndPassword(email: email ,password: password);
//       Database().
//     }
//     catch(e){

//     }
//   }
class Signup extends GetWidget<AuthController> {
  TextEditingController name = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController contact = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController branch = TextEditingController();
  TextEditingController password = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:
            //  CustomScrollView(
            //   slivers: <Widget>[
            //     SliverAppBar(
            //       automaticallyImplyLeading: false,
            //       expandedHeight: 50,
            //       title: Navbar(),
            //       pinned: true,
            //       backgroundColor: Colors.white,
            //       shadowColor: Colors.blue,
            //     ),
            //     SliverList(
            //       delegate: SliverChildListDelegate(
            //         [
            SingleChildScrollView(
      child: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Sign up Resturent admin",
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
                          controller: name,
                          decoration: const InputDecoration(
                            hintText: "Resturent name",
                            hintStyle:
                                TextStyle(color: Colors.grey, fontSize: 20.0),
                          ),
                        ),
                      ),
                      SizedBox(width: 50),
                      Expanded(
                        child: TextFormField(
                          controller: email,
                          decoration: InputDecoration(
                            hintText: "Email",
                            hintStyle:
                                TextStyle(color: Colors.grey, fontSize: 20.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 50),
                  Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: address,
                          decoration: const InputDecoration(
                            hintText: "Address",
                            hintStyle:
                                TextStyle(color: Colors.grey, fontSize: 20),
                          ),
                        ),
                      ),
                      SizedBox(width: 50),
                      Expanded(
                        child: TextFormField(
                          controller: contact,
                          decoration: InputDecoration(
                            hintText: "Contact",
                            hintStyle:
                                TextStyle(color: Colors.grey, fontSize: 20.0),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 50),
                  TextFormField(
                    controller: branch,
                    decoration: InputDecoration(
                      hintText: "Add Branch",
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 20.0),
                    ),
                  ),
                  SizedBox(height: 50),
                  TextFormField(
                    // controller: branch,
                    decoration: InputDecoration(
                      hintText: "Password",
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 20.0),
                    ),
                  ),
                  SizedBox(height: 50),
                  TextFormField(
                    controller: password,
                    decoration: InputDecoration(
                      hintText: "Confirm Password",
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 20.0),
                    ),
                  ),
                  SizedBox(height: 50),
                  MaterialButton(
                    color: Colors.red,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0))),
                    onPressed: () => uploadToStorage(),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 20.0, horizontal: 40.0),
                      child: Text(
                        "Select Resturent Image",
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  SizedBox(height: 50),
                  MaterialButton(
                    color: Colors.red,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20.0))),
                    onPressed: () async {
                   createUser(name.text, contact.text, branch.text, email.text, password.text, imagUrl.value!);
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
                        Get.to(LoginMain());
                      },
                      child: Text("If you have account Login!")),
                ],
              ),
            ),
          ],
        ),
      ),
    ));
  }
}

class SignupMainMobile extends StatelessWidget {
  TextEditingController title = TextEditingController();
  TextEditingController dec = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController sqt = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
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
              onPressed: () => uploadToStorage(),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 20.0, horizontal: 40.0),
                child: Text(
                  "Upload Resturent Image",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(height: 30),
            MaterialButton(
              color: Colors.red,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              onPressed: () async {
                await Database().addProduct(
                  title.text,
                  dec.text,
                  price.text,
                  sqt.text,
                  imagUrl.value!,
                );
                Get.back();
              },
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
    );
  }
}

class SignupMain extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return (!isMobile(context)) ? Signup() : SignupMainMobile();
  }
}
