import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';
import 'package:shop_app2/widgets/on_sale_widget.dart';
import 'package:shop_app2/widgets/text_widget.dart';

import '../models/products_moldel.dart';
import '../providers/products_provider.dart';
import '../services/utils.dart';

class OnsaleScreen extends StatelessWidget {
  static const routeName = "/OnSaleScreen";
  const OnsaleScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final color = Utils(context).color;
    Size size = Utils(context).getScreenSize;
    final productsProviders = Provider.of<ProductsProvider>(context);
    List<ProductModel> productsOnSale = productsProviders.getOnSaleProducts;

    //
    return Scaffold(
      ///arrow Back
      appBar: AppBar(
        leading: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            IconlyLight.arrowLeft2,
            color: color,
          ),
        ),
        elevation: 0,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: TextWidget(
          text: 'Product on sale',
          color: color,
          textSize: 24,
          isTitle: true,
        ),
      ),

      //
      body: productsOnSale.isEmpty
          ? Center(
              //There aren't any sale products.
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    ///Image
                    Padding(
                      padding: const EdgeInsets.all(18.0),
                      child: Image.asset('assets/images/im6.png'),
                    ),

                    //Text
                    Text(
                      'No products on sale yet! \n Stay turned',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: color,
                          fontSize: 30,
                          fontWeight: FontWeight.w700),
                    ),
                  ],
                ),
              ),
            )
          : GridView.count(
              //There are sale products.
              crossAxisCount: 2,
              padding: EdgeInsets
                  .zero, //EdgeInsets ชุดออฟเซ็ตที่ไม่เปลี่ยนรูปในแต่ละทิศทางที่สำคัญทั้งสี่
              //crossAxisSpacing: 10,
              childAspectRatio: size.width /
                  (size.height *
                      0.5), //อัตราส่วนของแกนตัดกับขอบเขตแกนหลักของเด็กแต่ละคน // ขนาด card Pd
              children: List.generate(productsOnSale.length, (index) {
                return ChangeNotifierProvider.value(
                  value: productsOnSale[index],
                  child: const OnSaleWidget(),
                );
              }),
            ),
    );
  }
}
