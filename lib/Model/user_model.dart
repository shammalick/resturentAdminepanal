import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? id;
  String? name;
  String? email;
  String? imagUrl;
  String? contact;
  String? branch;
  UserModel({this.id, this.name, this.email, this.imagUrl,this.branch,this.contact});

  UserModel.fromDocumentSnapshot({required DocumentSnapshot doc}) {
    id = doc.id;
    name = doc["name"];
    email = doc['email'];
    imagUrl = doc['imagUrl'];
    contact = doc['contact'];
    branch = doc['branch'];
  }

}
