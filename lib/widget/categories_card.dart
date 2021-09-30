import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resturantadminpanel/Binding/all_binding.dart';
import 'package:resturantadminpanel/Screen/catergory_products.dart';
import 'package:resturantadminpanel/controller/category_controller.dart';
import 'package:resturantadminpanel/controller/product_Controller.dart';
import 'package:resturantadminpanel/utils/global_variable.dart';

const defaultPadding = 16.0;

class CategoriesCard extends StatelessWidget {
  
  final int? crossAxisCount;
  final double? childAspectRatio;

  
  CategoriesCard({
    this.crossAxisCount = 4,
    this.childAspectRatio = 1,
  });

  Color buttonDefualtColor = Colors.white;

  final categoryController = Get.find<CategoryController>();
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Obx(() {
      if (categoryController.categorydata == null) {
        return CircularProgressIndicator();
      } else {
        return GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: categoryController.categorydata!.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              crossAxisSpacing: 6,
              mainAxisSpacing: 6,
              childAspectRatio: 1,
            ),
            itemBuilder: (context, index) {
              return GestureDetector(
                  onTap: () {
                   categoryName.value=  categoryController.categorydata![index].name!;
                   debugPrint(  categoryName.value);
                          Get.to(() => CategoryProduct(),
                            binding: ProductsBinding());
                  },
                  child: Container(
                    height: 250,
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
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(18.0)),
                              image: DecorationImage(
                                  image: NetworkImage(categoryController
                                      .categorydata![index].image!),
                                  fit: BoxFit.fill),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        Text(
                          categoryController.categorydata![index].name!,
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        // Text(
                        //   "Rs:" +
                        //       "${categoryController.dataGetter![index].fprice!}",
                        //   style: TextStyle(
                        //       fontWeight: FontWeight.bold, color: Colors.red),
                        // ),
                      ],
                    ),
                  ));
            });
      }
    });
  }
}
