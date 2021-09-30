import 'package:cloud_firestore/cloud_firestore.dart';

class ProductModel{
  String? id;
  String? ftitle;
  String?sqt;
  String? fdec;
 String? fimage;
 int? fprice;
 bool? show;
ProductModel({this.show, this.sqt,this.id,this.ftitle,this.fdec,this.fimage,this.fprice});
ProductModel.fromDocumentSnapshot(DocumentSnapshot myData) {
   id=myData.id;
   sqt=myData.get("sqt");
   show=myData.get("Show");
    ftitle = myData.get('title');
    fdec = myData.get('dec');
    fimage = myData.get('image');
    fprice = myData.get('price');
    }
}