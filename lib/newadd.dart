
// import 'dart:html';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:firebase_storage/firebase_storage.dart';
// import 'package:flutter/material.dart';
// import 'package:image_picker_web/image_picker_web.dart';
// import 'package:path/path.dart';

// class UploadNew extends StatefulWidget {
//   @override
//   _UploadNewState createState() => _UploadNewState();
// }

// class _UploadNewState extends State<UploadNew> {
//   late String title, dec, protine, carb, calories, ingr, method,cat;
//   // ignore: unused_field
//   late File _image;
//   late String pic;
//   late String view;
//   late String imagUrl;
  
 
//     uploadToStorage() {
//     FileUploadInputElement input = FileUploadInputElement()..accept = 'image/*';
//     FirebaseStorage fs = FirebaseStorage.instance;
//     input.click();
//     input.onChange.listen((event) {
//       final file = input.files!.first;
//       final reader = FileReader();
//       reader.readAsDataUrl(file);
//       reader.onLoadEnd.listen((event) async {
//         var snapshot = await fs.ref().child("Recipes/${(file.name)}").putBlob(file);
//         String downloadUrl = await snapshot.ref.getDownloadURL();
//         setState(() {
//           imagUrl = downloadUrl;
//         });
//       });
//     });
//   }
  
//   Future<bool> uploadRecipe() async {
//     final FirebaseFirestore _firestore = FirebaseFirestore.instance;
//     String docId=_firestore.collection("recipies").doc().id;
//     Map<String, dynamic> recipe = {
//       "title": title,
//       "dec": dec,
//       "protein": protine,
//       "carb": carb,
//       "kcal": calories,
//       "ingr": ingr,
//       "method": method,
//       "views": view,
//       "imgUrl": imagUrl,
//       "fav": {},
//       // "cat": cat,
//       "id":docId,
//     };

//     try {

//   await _firestore.collection('recipies').doc(docId).set(recipe);
//       return true;
//     } catch (e) {
//       // ignore: avoid_print
//       print(e);
//       return false;
//     }
//   }

//   gettitle(_title) {
//     title = _title;
//   }

//   getdec(_dec) {
//     dec = _dec;
//   }

//   getprotine(_protine) {
//     protine = _protine;
//   }

//   getcarb(_carb) {
//     carb = _carb;
//   }

//   getcalories(_calorise) {
//     calories = _calorise;
//   }

//   getingr(_ingr) {
//     ingr = _ingr;
//   }

//   getmethod(_method) {
//     method = _method;
//   }

//   getview(_view) {
//     view = _view;
//   }

//   getcat(_cat) {
//     this.cat = _cat;
//   }
// final _uploadkey= GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: SingleChildScrollView(
//       child: Column(
//           children: [
//             Row(
//       crossAxisAlignment: CrossAxisAlignment.center,
//       mainAxisAlignment: MainAxisAlignment.center,
//       children: [
//         Text(
//           "Upload ",
//           style: TextStyle(
//               fontSize: 30,
//               fontWeight: FontWeight.bold,
//               color: Colors.black),
//         ),
//         Text(
//           "Recipe",
//           style: TextStyle(
//               fontSize: 30,
//               fontWeight: FontWeight.bold,
//               color: Colors.red),
//         ),
//       ],
//             ),
//             Container(
//       padding:
//           const EdgeInsets.symmetric(vertical: 70.0, horizontal: 150.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           Row(
//             children: [
//               Expanded(
//                 child: TextFormField(
//                   decoration: InputDecoration(
//                     hintText: "Title",
//                     hintStyle:
//                         TextStyle(color: Colors.grey, fontSize: 20.0),
//                   ),
//                   onChanged: (String _title) {
//                     gettitle(_title);
//                   },
//                 ),
//               ),
//               SizedBox(width: 50),
//               Expanded(
//                 child: TextFormField(
//                   decoration: InputDecoration(
//                     hintText: "Description",
//                     hintStyle:
//                         TextStyle(color: Colors.grey, fontSize: 20.0),
//                   ),
//                   onChanged: (String _dec) {
//                     getdec(_dec);
//                   },
//                 ),
//               ),
//             ],
//           ),
//           SizedBox(height: 50),
//           Row(
//             children: [
//               Expanded(
//                 child: TextFormField(
//                   decoration: InputDecoration(
//                     hintText: "Protein",
//                     hintStyle:
//                         TextStyle(color: Colors.grey, fontSize: 20),
//                   ),
//                   onChanged: (String _protine) {
//                     getprotine(_protine);
//                   },
//                 ),
//               ),
//               SizedBox(width: 50),
//               Expanded(
//                 child: TextFormField(
//                   decoration: InputDecoration(
//                     hintText: "Carb",
//                     hintStyle:
//                         TextStyle(color: Colors.grey, fontSize: 20.0),
//                   ),
//                   onChanged: (String _carb) {
//                     getcarb(_carb);
//                   },
//                 ),
//               ),
//             ],
//           ),
//           SizedBox(height: 50),
//           Row(
//             children: [
//               Expanded(
//                 child: TextFormField(
//                   decoration: InputDecoration(
//                     hintText: "Calories",
//                     hintStyle:
//                         TextStyle(color: Colors.grey, fontSize: 20),
//                   ),
//                   onChanged: (String _calorise) {
//                     getcalories(_calorise);
//                   },
//                 ),
//               ),
//               SizedBox(width: 50),
//               Expanded(
//                 child:  TextFormField(
//             decoration: InputDecoration(
//               hintText: "views",
//               hintStyle: TextStyle(color: Colors.grey, fontSize: 20),
//             ),
//             onChanged: (_view) {
//               getview(_view);
//             },
//           ),

                
               
//               ),
//             ],
//           ),
//           SizedBox(height: 50),
//            TextFormField(
//                minLines: 1,
//                     maxLines: 200,
//                     keyboardType: TextInputType.multiline,
//                   decoration: InputDecoration(
//                     hintText: "Ingradiant",
//                     hintStyle:
//                         TextStyle(color: Colors.grey, fontSize: 20),
//                   ),
//                   onChanged: (String _ingr) {
//                     getingr(_ingr);
//                   },
//                 ),
//           SizedBox(height: 50),
//           TextFormField(
//               minLines: 1,
//                     maxLines: 200,
//                     keyboardType: TextInputType.multiline,
//             decoration: InputDecoration(
//               hintText: "Method",
//               hintStyle: TextStyle(color: Colors.grey, fontSize: 20),
//             ),
//             onChanged: (String _method) {
//               getmethod(_method);
//             },
//           ),
          

 
// const SizedBox(height: 50),
//           SizedBox(height: 50),
//            MaterialButton(
//             color: Colors.red,
//             shape: RoundedRectangleBorder(
//                 borderRadius: BorderRadius.all(Radius.circular(20.0))),
//             onPressed: () {
//               uploadToStorage();
//               // getImageFromGallery();
//             },
//             child: const Padding(
//               padding: EdgeInsets.symmetric(
//                   vertical: 20.0, horizontal: 40.0),
//               child: Text(
//                 "Pick Image",
//                 style: TextStyle(
//                     color: Colors.white, fontWeight: FontWeight.bold),
//               ),
//             ),
//           ),
//           const SizedBox(height: 50),
       
//           MaterialButton(
//             color: Colors.red,
//             shape: const RoundedRectangleBorder(
//                 borderRadius: BorderRadius.all(Radius.circular(20.0))),
//             onPressed: () async{
//             await  uploadRecipe();
//             Navigator.pop(context);

//             },
//             child: const Padding(
//               padding: EdgeInsets.symmetric(
//                   vertical: 20.0, horizontal: 40.0),
//               child: Text(
//                 "Publish",
//                 style: TextStyle(
//                     color: Colors.white, fontWeight: FontWeight.bold),
//               ),
//             ),
//           ),
//           SizedBox(height: 50),
//         ],
//       ),
//             ),
//           ],
//         ),
//     ));
//   }
// }
