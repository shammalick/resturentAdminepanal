import 'package:flutter/material.dart';
import 'package:resturantadminpanel/widget/categories_card.dart';
import 'package:resturantadminpanel/widget/product_card.dart';
import '../responsive.dart';
const defaultPadding = 16.0;
class CategoriesSection extends StatelessWidget {
  @override
  // TODO: implement key
  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return Container(
      padding: EdgeInsets.all(defaultPadding),
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                // flex: 5,
                child: Column(
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          height: defaultPadding,
                        ),
                        Responsive(
                          mobile: CategoriesCard(
                            crossAxisCount: _size.width < 650 ? 1 : 4,
                            childAspectRatio: _size.width < 650 ? 1.3 : 1,
                          ),
                          tablet: CategoriesCard(),
                          desktop: CategoriesCard(
                            childAspectRatio: _size.width < 1400 ? 1.1 : 1.4,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
