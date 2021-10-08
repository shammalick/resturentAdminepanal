import 'package:cloud_firestore/cloud_firestore.dart';

class OrderModel{
  int? tokenId;
  Timestamp?time;
  OrderModel({this.tokenId,this.time});
  OrderModel.fromDocumentSnapshot(DocumentSnapshot order){
    tokenId = order.get("tokenId");
    time = order.get("time");

  }

}