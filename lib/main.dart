import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:resturantadminpanel/Screen/home_page.dart';
import 'package:resturantadminpanel/Screen/login_page.dart';
import 'package:resturantadminpanel/new.dart';
import 'package:resturantadminpanel/newadd.dart';

import 'controller/category_controller.dart';
import 'controller/order_controller.dart';
import 'controller/product_Controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // Get.put(ProductController());
    Get.put(CategoryController());
      Get.put(OrderController());
  runApp(const MyApp());
}


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
         textTheme: GoogleFonts.juraTextTheme(
          Theme.of(context).textTheme,
        ),
           primarySwatch: Colors.blue,
      ),
      home: Home(),
      // const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

