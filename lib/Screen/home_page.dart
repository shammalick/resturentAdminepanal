import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:resturantadminpanel/Screen/add_new.dart';
import 'package:resturantadminpanel/widget/add_category.dart';
import 'package:resturantadminpanel/widget/all_products.dart';
import 'package:resturantadminpanel/widget/cart_icon.dart';
import 'package:resturantadminpanel/widget/categories_section.dart';
import 'package:resturantadminpanel/widget/navbar.dart';


class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

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
                children: [
                  // Container(
                  //   padding: const  EdgeInsets.all(20),
                  //   child: const Text(
                  //     "Categoryes",
                  //     style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  //   ),
                  // ),
                   const Spacer(),
                  
                   Container(
                       padding: const  EdgeInsets.all(20),
                                   
                        height: 100,
                        width: 100,
                        child: FloatingActionButton(
                          backgroundColor: Colors.white,
                          onPressed: (){
                           //  Get.to(AddCart());
                          },
                        child: CartIcon()),
                      ),
                ],
              ),
              TextButton(
                      onPressed: ()=>addCaterory(context),
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
              // HomeView(),
              //  CategoryCard(),
                      Container(
                padding: const  EdgeInsets.all(20),
                child:  const Text(
                  "All Categories",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
     
            CategoriesSection(),
              // AddNewItemsMain(),
            ],
          ),
        ),
      ],
    ));
  }
}
