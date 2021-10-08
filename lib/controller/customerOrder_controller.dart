import 'package:get/get.dart';
import 'package:resturantadminpanel/Model/categroy_model.dart';
import 'package:resturantadminpanel/Model/cutomerOrder_model.dart';
import 'package:resturantadminpanel/Model/order_model.dart';
import 'package:resturantadminpanel/service/database.dart';

class CustomerOrderController extends GetxController {
  Rxn<List<CutomerOrderModel>> customerOrderList = Rxn<List<CutomerOrderModel>>();

  List<CutomerOrderModel>? get customerOrderdata => customerOrderList.value;

  @override
  void onInit() {
    super.onInit();

    customerOrderList.bindStream(Database().cutomerOrderList());
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }
}
