import 'package:flutter/material.dart';
import 'package:resturantadminpanel/widget/navbar.dart';
import 'package:resturantadminpanel/widget/order_list.dart';

class OrderLists extends StatelessWidget {
  // const OrderList({Key? key}) : super(key: key);

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
Column(children: [
  OrderList(),
],)

              ],
            ),
          ),
        ],
      ),
    );
  }
}
