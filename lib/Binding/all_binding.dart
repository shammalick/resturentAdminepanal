import 'package:get/get.dart';
import 'package:resturantadminpanel/controller/product_Controller.dart';

class ProductsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductController>(() => ProductController());
  }
}