import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resturantadminpanel/Screen/add_new.dart';
import 'package:resturantadminpanel/widget/all_products.dart';
import 'package:resturantadminpanel/widget/categories_section.dart';
import 'package:resturantadminpanel/widget/navbar.dart';
import 'package:resturantadminpanel/widget/product_card.dart';

class CategoryProduct extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            automaticallyImplyLeading: false,
            expandedHeight: 50,
            title: Navbar(),
            pinned: true,
            backgroundColor: Colors.white,
            shadowColor: Colors.blue,
          ),
          SliverList(
            delegate: SliverChildListDelegate(
              [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                   
                    Spacer(),
                    TextButton(
                      onPressed: (){
                            Get.to(AddNewItemsMain());
                 
                      },
                      child: Container(
                        margin: EdgeInsets.all(20),
                        height: 50,
                        width: 200,
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
                       child:Center(
                         child: Text(
                      "Add New",textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 25,color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                       ),
                      ),
                    ),
                  ],
                ),
                ProductsCard(),
// ProductSection(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
