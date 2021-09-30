import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resturantadminpanel/Binding/all_binding.dart';
import 'package:resturantadminpanel/Screen/catergory_products.dart';
import 'package:resturantadminpanel/Screen/update_products.dart';
import 'package:resturantadminpanel/controller/category_controller.dart';
import 'package:resturantadminpanel/controller/product_Controller.dart';
import 'package:resturantadminpanel/service/database.dart';
import 'package:resturantadminpanel/utils/global_variable.dart';

const defaultPadding = 16.0;

class ProductsCard extends StatelessWidget {
  final int? crossAxisCount;
  // Rxn<bool> cheak = Rxn<bool>();
  bool? show;
  bool? cheak;
  final double? childAspectRatio;
  ProductsCard({
    this.crossAxisCount = 4,
    this.childAspectRatio = 1,
  });

  Color buttonDefualtColor = Colors.white;

  final productController = Get.find<ProductController>();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Obx(() {
      if (productController.dataGetter == null) {
        return CircularProgressIndicator();
      } else {
        return GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: productController.dataGetter!.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 6,
              mainAxisSpacing: 6,
              childAspectRatio: 1,
            ),
            itemBuilder: (context, index) {
              try {
                if (productController.dataGetter![index].show == true) {
                  cheak = true;
                }
                if (productController.dataGetter![index].show == false) {
                  cheak = false;
                }
              } catch (e) {
                cheak = false;
              }
              return GestureDetector(
                  onTap: () {
                    //  categoryName.value=  productController.dataGetter![index].name!;
                    //         Get.to(() => CategoryProduct(productController.dataGetter![index].name!),
                    //           binding: ProductsBinding());
                  },
                  child: Container(
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
                              borderRadius:
                                  BorderRadius.all(Radius.circular(18.0)),
                              image: DecorationImage(
                                  image: NetworkImage(productController
                                      .dataGetter![index].fimage!),
                                  fit: BoxFit.fill),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),Text(
                                     productController.dataGetter![index].ftitle!,
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                        // Text(
                        //   productController.dataGetter![index].ftitle!,
                        //   style: TextStyle(fontWeight: FontWeight.bold),
                        // ),
                        SizedBox(
                          height: 10,
                        ),
                        // Text(
                        //   "Rs:" +
                        //       "${categoryController.dataGetter![index].fprice!}",
                        //   style: TextStyle(
                        //       fontWeight: FontWeight.bold, color: Colors.red),
                        // ),
                        Row(
                          children: [
                            Expanded(
                              child: TextButton(
                                onPressed: () {
                                  if (productController
                                          .dataGetter![index].show ==
                                      true) {
                                    Database().disable(
                                        productController
                                            .dataGetter![index].id!,
                                        false);
                                    cheak = true;
                                    // show=false;
                                  } else {
                                    cheak = false;
                                    Database().disable(
                                        productController
                                            .dataGetter![index].id!,
                                        true);
                                    // show=true;
                                  }
                                  // Database().disable(
                                  //     productController.dataGetter![index].id!,
                                  //     show!);

                                  // Get.to(AddNewItemsMain());
                                },
                                child: Container(
                                  margin: EdgeInsets.all(0),
                                  height: 30,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    gradient: LinearGradient(
                                      tileMode: TileMode.mirror,
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: [
                                        if (cheak == true)
                                          Colors.blue
                                        else
                                          Colors.red,
                                        if (cheak == true)
                                          Colors.blueAccent
                                        else
                                          Colors.redAccent
                                      ],
                                      stops: [
                                        0,
                                        1,
                                      ],
                                    ),
                                  ),
                                  child: Center(
                                    child:cheak! ? Text(
                                      "Enable",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ):Text(
                                      "Disable",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Expanded(
                              child: TextButton(
                                onPressed: () {
                                  Get.to(UpdateNewItemsMain(
                                    title: productController
                                        .dataGetter![index].ftitle!,
                                    price: productController
                                        .dataGetter![index].fprice!,
                                    image: productController
                                        .dataGetter![index].fimage!,
                                    dec: productController
                                        .dataGetter![index].fdec!,
                                    id: productController
                                        .dataGetter![index].id!,
                                  ));
                                },
                                child: Container(
                                  margin: EdgeInsets.all(0),
                                  height: 30,
                                  width: 100,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    gradient: LinearGradient(
                                      tileMode: TileMode.mirror,
                                      begin: Alignment.topLeft,
                                      end: Alignment.bottomRight,
                                      colors: [
                                        Color(0xffe79102),
                                        Color(0xfffbe263),
                                      ],
                                      stops: [
                                        0,
                                        1,
                                      ],
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Change",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontSize: 20,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ));
            });
      }
    });
  }
}
