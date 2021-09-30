import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resturantadminpanel/controller/order_controller.dart';
class CartIcon extends StatelessWidget {
  // final db = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    return new Stack(
      children: <Widget>[
    new IconButton(
      icon: new Icon(
        Icons.shopping_cart,
        size: 35,
        color: Colors.black,
      ),
      onPressed: () {
        //  Get.to(AddCart());
    
      },
    ),
    new Positioned(
      left: 15,
        child: new Stack(
      children: <Widget>[
        new Icon(Icons.brightness_1, size: 25.0, color: Colors.red),
        new Positioned(
            top: 6,
            right: 4,
            child: new Center(
              child: new Text(
                "20",
                style: new TextStyle(
                    color: Colors.white,
                    fontSize: 11.0,
                    fontWeight: FontWeight.bold),
              ),
            )),
      ],
    )),
      ],
    );
  }
}


// class CartIcon extends StatelessWidget {
//  final orderController = Get.find<OrderController>();
//   @override
//   Widget build(BuildContext context) {
//     return Obx(() {

//        if (orderController.orderdata == null) {
//         return CircularProgressIndicator();
//       } else {
//         return    Container(
//       child: 

//               Padding(
//                   padding: const EdgeInsets.all(10.0),
//                   child: new Container(
//                       height: 150.0,
//                       width: 30.0,
//                       child: new GestureDetector(
//                         onTap: () {
//                           // Get.to(AddCart());
//                         },
//                         child: new Stack(
//                           children: <Widget>[
//                             new IconButton(
//                               icon: new Icon(
//                                 Icons.shopping_cart,
//                                 size: 30,
//                                 color: Colors.white,
//                               ),
//                               onPressed: null,
//                             ),
//                             orderController.orderdata!.length == 0
//                                 ? new Container()
//                                 : new Positioned(
//                                     child: new Stack(
//                                     children: <Widget>[
//                                       new Icon(Icons.brightness_1,
//                                           size: 25.0, color: Colors.red),
//                                       new Positioned(
//                                           top: 5.0,
//                                           right: 8.0,
//                                           child: new Center(
//                                             child: new Text(
//                                               orderController.orderdata!.length.toString(),
//                                               style: new TextStyle(
//                                                   color: Colors.white,
//                                                   fontSize: 11.0,
//                                                   fontWeight: FontWeight.bold),
//                                             ),
//                                           )),
//                                     ],
//                                   )),
//                           ],
//                         ),
//                       ),
//                       ),
//         ),
//         );
//       }
//     }
//     );
//           }
//     }
  
 
    
    
  