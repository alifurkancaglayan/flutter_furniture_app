import 'package:flutter/material.dart';
import 'package:flutter_furniture_app/constants.dart';
import 'package:flutter_furniture_app/models/Product.dart';
import 'package:flutter_furniture_app/screens/details/components/product_info.dart';
import 'package:flutter_furniture_app/screens/details/components/products_description.dart';
import 'package:flutter_furniture_app/size_config.dart';

class Body extends StatelessWidget {
  const Body({Key? key, required this.product}) : super(key: key);
  final Product product;
  @override
  Widget build(BuildContext context) {
    double? defaultSize = SizeConfig.defaultSize;
    TextStyle lightTextStyle = TextStyle(color: kTextColor.withOpacity(0.6));
    return SingleChildScrollView(
      child: SizedBox(
        width: double.infinity,
        height: SizeConfig.orientation == Orientation.landscape
            ? SizeConfig.screenWidth
            : SizeConfig.screenHeight,
        child: Stack(
          // crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ProductInfo(
              product: product,
            ),
            Positioned(
              top: defaultSize! * 37.5,
              left: 0,
              right: 0,
              child: ProductDescription(
                product: product,
                press: () {},
              ),
            ),
            Positioned(
              top: defaultSize * 9.5,
              right: -defaultSize * 5.5,
              child: Hero(
                tag: product.id,
                child: Image.network(
                  product.image,
                  fit: BoxFit.cover,
                  height: defaultSize * 37.8,
                  width: defaultSize * 36.4,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
