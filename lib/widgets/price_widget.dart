import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:shop_app2/services/utils.dart';
import 'package:shop_app2/widgets/text_widget.dart';

class PriceWidget extends StatelessWidget {
  const PriceWidget(
      {Key? key,
      required this.salePrice,
      required this.price,
      required this.textPrice,
      required this.isOnSale})
      : super(key: key);
  final double salePrice, price;
  final String textPrice;
  final bool isOnSale; //To check if th item is on sale or not

  @override
  Widget build(BuildContext context) {
    final color = Utils(context).color;
    double userPrice = isOnSale ? salePrice : price;

    return FittedBox(
      child: Row(
        children: [
          TextWidget(
            text: '฿${(userPrice * int.parse(textPrice)).toStringAsFixed(2)}',
            //toStringAsFixed method  แปลงตัวเลขนี้เป็นdouble ก่อนคำนวณการแสดงสตริง เช่นเดียวกับtoDouble
            color: Colors.green,
            textSize: 20,
          ),
          const SizedBox(
            width: 5,
          ),
          Visibility(
            visible: isOnSale ? true : false,
            child: Text(
              '฿${(price * int.parse(textPrice)).toStringAsFixed(2)}',
              style: TextStyle(
                  fontSize: 15,
                  color: color,
                  decoration: TextDecoration.lineThrough),
            ),
          ),
        ],
      ),
    );
  }
}
