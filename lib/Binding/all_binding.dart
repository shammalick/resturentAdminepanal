import 'package:get/get.dart';
import 'package:resturantadminpanel/controller/category_controller.dart';
import 'package:resturantadminpanel/controller/customerOrder_controller.dart';
import 'package:resturantadminpanel/controller/order_controller.dart';
import 'package:resturantadminpanel/controller/product_Controller.dart';

class ProductsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProductController>(() => ProductController());
  }
}
class CategoryBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CategoryController>(() => CategoryController());
     Get.lazyPut<OrderController>(() => OrderController());
  }
}
class CustomerOrderBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CustomerOrderController>(() => CustomerOrderController());
    
  }
}