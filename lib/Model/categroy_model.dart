import 'package:cloud_firestore/cloud_firestore.dart';

class CategoryModel{
  String? name;
  String? image;
  CategoryModel({this.image,this.name});
  CategoryModel.fromDocumentSnapshot(DocumentSnapshot category){
    name = category.get("name");
    image = category.get("image");

  }

}