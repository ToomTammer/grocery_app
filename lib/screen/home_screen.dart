import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';
import 'package:provider/provider.dart';
import 'package:shop_app2/inner_screens/feeds_screen.dart';
import 'package:shop_app2/inner_screens/on_sale_screen.dart';
import 'package:shop_app2/inner_screens/product_detail_screen.dart';
import 'package:shop_app2/provider/dark_theme_provider.dart';
import 'package:shop_app2/services/global_methods.dart';
import 'package:shop_app2/services/utils.dart';
import 'package:shop_app2/widgets/feed_items.dart';
import 'package:shop_app2/widgets/on_sale_widget.dart';
import 'package:shop_app2/widgets/text_widget.dart';

import '../consts/constss.dart';
import '../models/products_moldel.dart';
import '../providers/products_provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> _offerImages = [
    'assets/images/Ad1.jpg',
    'assets/images/Ad2.jpg',
    'assets/images/Ad3.jpg'
  ];
  @override
  Widget build(BuildContext context) {
    final Utils utils = Utils(context);
    final themeState = Utils(context)
        .getTheme; //เริ่มต้นผู้ให้บริการ จะสามารถเข้าถึงอาร์กิวเมนต์ทั้งหมดที่อยู่ใน Provider
    final color = Utils(context).color;
    Size size = Utils(context).getScreenSize; //เข้าถึง size
    final productsProviders = Provider.of<ProductsProvider>(context);
    List<ProductModel> allProduct = productsProviders.getProducts;
    List<ProductModel> productsOnSale = productsProviders.getOnSaleProducts;

    //
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 40,
            ),

            /// Swiper
            SizedBox(
              height: size.height * 0.33,
              child: Swiper(
                itemBuilder: (BuildContext context, int index) {
                  return ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      _offerImages[index],
                      fit: BoxFit.cover,
                    ),
                  );
                },
                autoplay: true,
                itemCount: _offerImages.length,
                viewportFraction: 0.8,
                scale: 0.9,
                pagination: const SwiperPagination(
                    alignment: Alignment.bottomCenter,
                    builder: DotSwiperPaginationBuilder(
                        color: Colors.white, activeColor: Colors.red)),
              ),
            ),

            /// section View All
            const SizedBox(
              height: 6,
            ),
            TextButton(
              onPressed: () {
                GlobalMethods.navigateTo(
                    ctx: context, routeName: OnsaleScreen.routeName);
              },
              child: TextWidget(
                text: 'View all',
                maxLines: 1,
                color: Colors.blue,
                textSize: 20,
              ),
            ),

            /// section 1 On Sale
            const SizedBox(
              height: 6,
            ),
            Row(
              children: [
                RotatedBox(
                  quarterTurns: -1,
                  child: Row(
                    children: [
                      TextWidget(
                        text: "On sale".toLowerCase(),
                        color: Colors.red,
                        textSize: 22,
                        isTitle: true,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const Icon(
                        IconlyLight.discount,
                        color: Colors.red,
                      )
                    ],
                  ),
                ),

                /// section 1 On Sale : Product
                const SizedBox(
                  width: 8,
                ),
                Flexible(
                  child: SizedBox(
                    height: size.height * 0.28,
                    child: ListView.builder(
                      itemCount: productsOnSale.length < 10
                          ? productsOnSale.length
                          : 10,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (ctx, index) {
                        //ปกติจะใช้ context แต่เราต้องการคืนบางอย่าง
                        return ChangeNotifierProvider.value(
                            value: productsOnSale[index],
                            child: const OnSaleWidget());
                      },
                    ),
                  ),
                ),
              ],
            ),

            /// section 2 Our product
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TextWidget(
                    text: 'Our product',
                    color: color,
                    textSize: 22,
                  ),
                  //Spacer();
                  TextButton(
                    onPressed: () {
                      GlobalMethods.navigateTo(
                          ctx: context, routeName: FeedsScreen.routeName);
                    },
                    child: TextWidget(
                      text: 'All products',
                      maxLines: 1,
                      color: Colors.blue,
                      textSize: 20,
                    ),
                  ),
                ],
              ),
            ),

            /// section 2 Our product (2)
            GridView.count(
              shrinkWrap:
                  true, //ขอบเขตของมุมมองการเลื่อนในscrollDirectionควรกำหนดโดยเนื้อหาที่กำลังดู
              physics:
                  const NeverScrollableScrollPhysics(), //การจำลองทางฟิสิกส์แบบหนึ่งมิติอย่างง่าย เช่น springs, friction, and gravity สำหรับใช้ในแอนิเมชั่นอินเทอร์เฟซผู้ใช้
              crossAxisCount: 2,
              padding: EdgeInsets
                  .zero, //EdgeInsets ชุดออฟเซ็ตที่ไม่เปลี่ยนรูปในแต่ละทิศทางที่สำคัญทั้งสี่
              //crossAxisSpacing: 10,
              childAspectRatio: size.width /
                  (size.height *
                      0.7), //อัตราส่วนของแกนตัดกับขอบเขตแกนหลักของเด็กแต่ละคน // ขนาด card Pd

              ////Products
              children: List.generate(
                  allProduct.length < 4
                      ? allProduct.length // length 3
                      : 4, (index) {
                return ChangeNotifierProvider.value(
                  value: allProduct[index],
                  child: const FeedsWidget(),
                );
              }),
            ),
          ],
        ),
      ),
    );
  }
}
