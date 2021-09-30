  import 'dart:html';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resturantadminpanel/service/database.dart';
 late String image;
  
    uploadToStorage(
) {
    FileUploadInputElement input = FileUploadInputElement()..accept = 'image/*';
    FirebaseStorage fs = FirebaseStorage.instance;
    input.click();
    input.onChange.listen((event) {
      final file = input.files!.first;
      final reader = FileReader();
      reader.readAsDataUrl(file);
      reader.onLoadEnd.listen((event) async {
        var snapshot = await fs.ref().child("Recipes/${(file.name)}").putBlob(file);
        String downloadUrl = await snapshot.ref.getDownloadURL();
        
          image = downloadUrl;
        
      });
    });
  }
addCaterory(context) {
  TextEditingController catName= TextEditingController();
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return Center(
                      child: AlertDialog(
              
                shape: RoundedRectangleBorder(
                  
                    borderRadius: BorderRadius.all(Radius.circular(32.0))),
                contentPadding: EdgeInsets.all(15.0),
                content: Container(
                  width: 400,
                  height:400,
                  child: Column(children: [
                    Text("If you want to add Category",textAlign: TextAlign.center,style: TextStyle(
                      fontWeight:FontWeight.bold,
                      fontSize:25,
                    )),
                      SizedBox(height: 50),
                       TextFormField(
              controller: catName,
              decoration: InputDecoration(
                hintText: "Category Name",
                hintStyle: TextStyle(color: Colors.grey, fontSize: 15.0),
              ),
            ),
             SizedBox(height: 50),
                    MaterialButton(
                      color: Colors.red,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(20.0))),
                      onPressed: () =>uploadToStorage(),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20.0, horizontal: 40.0),
                        child: Text(
                          "Pick Image",
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
                     await Database().addCategory(catName.text, image);
                     Get.back();
                      },
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 20.0, horizontal: 40.0),
                        child: Text(
                          "Upload Category",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ]),
                )),
          );
        });
  }
