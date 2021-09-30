import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resturantadminpanel/Model/categroy_model.dart';
import 'package:resturantadminpanel/Model/order_model.dart';
import 'package:resturantadminpanel/Model/product_model.dart';
import 'package:resturantadminpanel/Model/user_model.dart';
import 'package:resturantadminpanel/utils/global_variable.dart';

class Database {
  FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseAuth auth = FirebaseAuth.instance;

//  final  user = FriebaseAuth.instance;
  Future<bool> createNewUser(UserModel user) async {
    try {
      await _firestore.collection('Resturent').doc(user.id).set({
        'name': user.name,
        'email': user.email,
        'imageUrl': null,
        'id': user.id,
        'contact': user.contact,
        'branch':user.branch,
      });
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Future<UserModel> getUser(String uid) async {
    try {
      DocumentSnapshot _doc =
          await _firestore.collection('users').doc(uid).get();
      return UserModel.fromDocumentSnapshot(doc: _doc);
    } catch (e) {
      print(e);
      rethrow;
    }
  }

  Future<void> addProduct(
    String title,
    String dec,
    String price,
    String sqt,
    String image,
  ) async {
    String docId = _firestore.collection("Resturent").doc(auth.currentUser!.uid).collection("items").doc().id;
    try {
      await _firestore.collection("Resturent").doc(auth.currentUser!.uid).collection("items").doc(docId).set({
        "title": title,
        "dec": dec,
        "price": int.parse(price),
        "sqt": sqt,
        "image": image,
        "id": docId,
        "category": categoryName.value,
        "Show": true,
      });
    } catch (e) {
      Get.snackbar("Not upload", e.toString(),
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  Future<void> updateProduct(
      String title, String dec, String price, String image, String id) async {
    try {
      await _firestore.collection("Resturent").doc(auth.currentUser!.uid).collection("items").doc(id).update({
        "title": title,
        "dec": dec,
        "price": int.parse(price),
        "image": image,
        // "cat":cat,
        "Show": true,
      });
    } catch (e) {
      Get.snackbar("Not upload", e.toString(),
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  Future<void> disable(String id, bool show) async {
    try {
      await _firestore.collection("Resturent").doc(auth.currentUser!.uid).collection("items").doc(id).update({
        "Show": show,
      });
    } catch (e) {
      Get.snackbar("Not upload", e.toString(),
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  Future<void> addCategory(String name, String image) async {
    try {
      await _firestore.collection("Resturent").doc(auth.currentUser!.uid).collection("categories").add({
        "name": name,
        "image": image,
      });
    } catch (e) {
      Get.snackbar("Not upload", e.toString(),
          snackPosition: SnackPosition.BOTTOM);
    }
  }

  //  Stream<List<ProductModel>> dataFirestore() {
  //   return _firestore
  //       .collection('items')
  //       .snapshots()
  //       .map((QuerySnapshot queryData) {
  //     List<ProductModel> dataList = [];
  //     queryData.docs.forEach((id) {
  //       dataList.add(ProductModel.fromDocumentSnapshot(id));
  //     });
  //     return dataList;
  //   });
  // }
  Stream<List<CategoryModel>> categoryFirestore() {
    return _firestore
        .collection('Resturent')
        .doc(auth.currentUser!.uid).collection("categories")
        .snapshots()
        .map((QuerySnapshot queryData) {
      List<CategoryModel> dataList = [];
      queryData.docs.forEach((id) {
        dataList.add(CategoryModel.fromDocumentSnapshot(id));
      });
      return dataList;
    });
  }
//  Stream<List<OrderModel>> orderList() {
//     return _firestore
//         .collection('Resturent')
//         .doc(auth.currentUser!.uid).collection("order")
//         .snapshots()
//         .map((QuerySnapshot queryData) {
//       List<OrderModel> dataList = [];
//       queryData.docs.forEach((id) {
//         dataList.add(OrderModel.fromDocumentSnapshot(id));
//       });
//       return dataList;
//     });
//   }
  Stream<List<ProductModel>> allProducts() {
    return _firestore
        .collection('Resturent')
        .doc(auth.currentUser!.uid).collection("items")
        .where('category', isEqualTo: categoryName.value)
        .snapshots()
        .map((QuerySnapshot querySnapshot) {
      List<ProductModel> productsList = [];
      for (var element in querySnapshot.docs) {
        productsList.add(ProductModel.fromDocumentSnapshot(element));
      }
      return productsList;
    });
  }
}
