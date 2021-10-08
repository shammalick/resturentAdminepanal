import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resturantadminpanel/Binding/all_binding.dart';
import 'package:resturantadminpanel/Screen/catergory_products.dart';
import 'package:resturantadminpanel/Screen/update_products.dart';
import 'package:resturantadminpanel/controller/category_controller.dart';
import 'package:resturantadminpanel/controller/customerOrder_controller.dart';
import 'package:resturantadminpanel/controller/product_Controller.dart';
import 'package:resturantadminpanel/service/database.dart';
import 'package:resturantadminpanel/utils/global_variable.dart';

const defaultPadding = 16.0;

class OrderCard extends StatelessWidget {
  final int? crossAxisCount;
  // Rxn<bool> cheak = Rxn<bool>();
  bool? show;
  bool? cheak;
  final double? childAspectRatio;
  OrderCard({
    this.crossAxisCount = 4,
    this.childAspectRatio = 1,
  });

  Color buttonDefualtColor = Colors.white;

  final customerorderController = Get.find<CustomerOrderController>();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Obx(() {
      if (customerorderController.customerOrderdata == null) {
        return CircularProgressIndicator();
      } else {
        return GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: customerorderController.customerOrderdata!.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 6,
              mainAxisSpacing: 6,
              childAspectRatio: 1,
            ),
            itemBuilder: (context, index) {
              return Container(
                height: 250,
                width: 250,
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
                margin: EdgeInsets.all(10),
                padding: EdgeInsets.all(5),
                // width: MediaQuery.of(context).size.width / 2,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(18.0)),
                          image: DecorationImage(
                              image: NetworkImage(customerorderController
                                  .customerOrderdata![index].image!),
                              fit: BoxFit.fill),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      customerorderController.customerOrderdata![index].title!,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                      customerorderController.customerOrderdata![index].dec!,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          "Quantity :",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.black,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '${customerorderController.customerOrderdata![index].quantity!}',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 20,
                              color: Colors.red,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    // Text(
                    //   "Rs:" +
                    //       "${categoryController.dataGetter![index].fprice!}",
                    //   style: TextStyle(
                    //       fontWeight: FontWeight.bold, color: Colors.red),
                    // ),
                  ],
                ),
              );
            });
      }
    });
  }
}
