import 'package:cloud_firestore/cloud_firestore.dart';

class CutomerOrderModel{
  String? title;
  String? dec;
 String? image;
 int? quantity;
CutomerOrderModel({this.quantity,this.title,this.dec,this.image,});
CutomerOrderModel.fromDocumentSnapshot(DocumentSnapshot myData) {
    title = myData.get('title');
    dec = myData.get('dec');
    image = myData.get('image');
    quantity = myData.get('quantity');
    }
}