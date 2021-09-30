import 'dart:html';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/get_rx.dart';
import 'package:resturantadminpanel/responsive.dart';
import 'package:resturantadminpanel/service/database.dart';
import 'package:resturantadminpanel/utils/global_variable.dart';
import 'package:resturantadminpanel/widget/navbar.dart';

Rxn<String> imag = Rxn<String>();
late String imagUrl;

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

      imagUrl = downloadUrl;
      imag.value = imagUrl;
    });
  });
}

class UpdateNewItems extends StatelessWidget {
  String? dtitle;
  String? ddec;
  String? dimage;
  String? id;
  int? dprice;
  UpdateNewItems({this.id, this.ddec, this.dimage, this.dprice, this.dtitle});

  @override
  Widget build(BuildContext context) {
    TextEditingController title = TextEditingController(text: dtitle);
    TextEditingController dec = TextEditingController(text: ddec);
    TextEditingController price = TextEditingController(text: '$dprice');
    //TextEditingController sqt = TextEditingController(text:);
    return Scaffold(
      // appBar: AppBar(),
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            automaticallyImplyLeading: false,
            expandedHeight: 50,
            title: Navbar(),
            pinned: true,
            backgroundColor: Colors.white,
            shadowColor: Colors.blue,
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Add New Product",
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.black),
                        ),
                      ],
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 70.0, horizontal: 150.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Expanded(
                                child: TextFormField(
                                  controller: title,
                                  decoration: const InputDecoration(
                                    hintText: "Title",
                                    hintStyle: TextStyle(
                                        color: Colors.grey, fontSize: 20.0),
                                  ),
                                ),
                              ),
                              SizedBox(width: 50),
                              Expanded(
                                child: TextFormField(
                                  controller: dec,
                                  decoration: InputDecoration(
                                    hintText: "Discreption",
                                    hintStyle: TextStyle(
                                        color: Colors.grey, fontSize: 20.0),
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
                                  controller: price,
                                  decoration: const InputDecoration(
                                    hintText: "Price",
                                    hintStyle: TextStyle(
                                        color: Colors.grey, fontSize: 20),
                                  ),
                                ),
                              ),
                              SizedBox(width: 50),
                              // Expanded(
                              //   child: TextFormField(
                              //     controller: sqt,
                              //     decoration: InputDecoration(
                              //       hintText: "sqt",
                              //       hintStyle: TextStyle(
                              //           color: Colors.grey, fontSize: 20.0),
                              //     ),
                              //   ),
                              // ),
                            ],
                          ),
                          SizedBox(height: 50),
                          MaterialButton(
                            color: Colors.red,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0))),
                            onPressed: () {
                              uploadToStorage();
                              dimage = imagUrl;
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 20.0, horizontal: 40.0),
                              child: Text(
                                "Select Image",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          SizedBox(height: 50),
                          MaterialButton(
                            color: Colors.red,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20.0))),
                            onPressed: () async {
                              await Database().updateProduct(title.text,
                                  dec.text, price.text, dimage!, id!);
                              Get.back();
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 20.0, horizontal: 40.0),
                              child: Text(
                                "Upload",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                          SizedBox(height: 50),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class UpdateNewItemsMobile extends StatelessWidget {
  String? mtitle;
  String? mdec;
  String? mimage;
  int? mprice;
  String? id;
  UpdateNewItemsMobile(
      {this.id, this.mdec, this.mimage, this.mprice, this.mtitle});
  TextEditingController title = TextEditingController();
  TextEditingController dec = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController sqt = TextEditingController();

  @override
  Widget build(BuildContext context) {
    TextEditingController title = TextEditingController(text: mtitle);
    TextEditingController dec = TextEditingController(text: mdec);
    TextEditingController price = TextEditingController(text: '$mprice');
    // TextEditingController sqt = TextEditingController();
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
            // TextFormField(
            //   controller: sqt,
            //   decoration: InputDecoration(
            //     hintText: "SQT",
            //     hintStyle: TextStyle(color: Colors.grey, fontSize: 15),
            //   ),
            // ),
            SizedBox(height: 30),
            MaterialButton(
              color: Colors.red,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20.0))),
              onPressed: () {
                uploadToStorage();
                mimage = imagUrl;
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 20.0, horizontal: 40.0),
                child: Text(
                  "Upload Image",
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
                await Database().updateProduct(
                    title.text, dec.text, price.text, imag.value!, id!);
                Get.back();
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 20.0, horizontal: 40.0),
                child: Text(
                  "Send",
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

class UpdateNewItemsMain extends StatelessWidget {
  String? title;
  String? dec;
  String? image;
  int? price;
  String? id;
  @override
  void onInit() {
    // super.onInit();
    imag.value = image;
  }

  UpdateNewItemsMain({this.id, this.dec, this.image, this.price, this.title});
  @override
  Widget build(BuildContext context) {
    return (!isMobile(context))
        ? UpdateNewItems(
            id: id,
            ddec: dec,
            dimage: image,
            dprice: price,
            dtitle: title,
          )
        : UpdateNewItemsMobile(
            id: id,
            mdec: dec,
            mimage: image,
            mprice: price,
            mtitle: title,
          );
  }
}
