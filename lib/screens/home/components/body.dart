import 'package:flutter/material.dart';
import 'package:flutter_furniture_app/components/title_text.dart';
import 'package:flutter_furniture_app/models/Categories.dart';
import 'package:flutter_furniture_app/models/Product.dart';
import 'package:flutter_furniture_app/screens/home/components/categories.dart';
import 'package:flutter_furniture_app/screens/home/components/product_card.dart';
import 'package:flutter_furniture_app/screens/home/components/recommands_products.dart';
import 'package:flutter_furniture_app/services/fetchCategories.dart';
import 'package:flutter_furniture_app/services/fetchProducts.dart';
import 'package:flutter_furniture_app/size_config.dart';

class Body extends StatelessWidget {
  const Body({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double? defaultSize = SizeConfig.defaultSize;
    return SingleChildScrollView(
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(defaultSize! * 2),
              child: const TitleText(
                title: "Browse by Categories",
              ),
            ),
            FutureBuilder<List<Category>>(
              future: fetchCategories(),
              builder: (context, snapshot) => snapshot.hasData
                  ? Categories(
                      categories: snapshot.data,
                    )
                  : Center(
                      child: Image.asset("assets/ripple.gif"),
                    ),
            ),
            Divider(
              height: defaultSize / 4,
            ),
            Padding(
              padding: EdgeInsets.all(defaultSize * 2),
              child: const TitleText(
                title: "Recommands For You",
              ),
            ),
            FutureBuilder<List<Product>>(
              future: fetchProducts(),
              builder: (context, snapshot) {
                return snapshot.hasData
                    ? RecommandProducts(
                        products: snapshot.data,
                      )
                    : Center(child: Image.asset("assets/ripple.gif"));
              },
            ),
          ],
        ),
      ),
    );
  }
}
