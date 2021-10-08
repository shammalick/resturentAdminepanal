import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resturantadminpanel/Binding/all_binding.dart';
import 'package:resturantadminpanel/Screen/catergory_products.dart';
import 'package:resturantadminpanel/Screen/order_page.dart';
import 'package:resturantadminpanel/controller/category_controller.dart';
import 'package:resturantadminpanel/controller/order_controller.dart';
import 'package:resturantadminpanel/controller/product_Controller.dart';
import 'package:resturantadminpanel/utils/global_variable.dart';

const defaultPadding = 16.0;

class OrderList extends StatelessWidget {
  
  // final int? crossAxisCount;
  // final double? childAspectRatio;

  
  // CategoriesCard({
  //   this.crossAxisCount = 4,
  //   this.childAspectRatio = 1,
  // });

  Color buttonDefualtColor = Colors.white;

  final orderController = Get.find<OrderController>();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Obx(() {
      if (orderController.orderdata == null) {
        return CircularProgressIndicator();
      } else {
        return GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: orderController.orderdata!.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: 4,
              mainAxisSpacing: 4,
              childAspectRatio: MediaQuery.of(context).size.width /
              (MediaQuery.of(context).size.height / 4),
            ),
            itemBuilder: (context, index) {
              return GestureDetector(
                  onTap: () {
                   orderId.value=  orderController.orderdata![index].tokenId!;
                   debugPrint(  categoryName.value);
                          Get.to(() => CustomerOrder(),
                            binding: CustomerOrderBinding());
                  },
                  child: Container(
                    height: 50,
                    width: 200,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                      boxShadow: [
                        BoxShadow(
                          blurRadius: 5.0,
                          offset: Offset(0, 3),
                          color: Colors.grey.withOpacity(0.6),
                        ),
                      ],
                    ),
                    margin: EdgeInsets.all(5),
                    padding: EdgeInsets.all(10),
                    // width: MediaQuery.of(context).size.width / 2,
                    child: Text("Order Token: "+"${orderController.orderdata![index].tokenId}",style: TextStyle(
                      fontSize:25,
                      fontWeight: FontWeight.bold,
                    ),)
                  ));
            });
      }
    });
  }
}
