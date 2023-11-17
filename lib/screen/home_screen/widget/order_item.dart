import 'package:flutter/material.dart';
import 'package:trackorder/models/order_model.dart';
import 'package:trackorder/screen/order_flow/text_views.dart';
import 'package:trackorder/utils/colors.dart';

class OrderItemWidget extends StatelessWidget {
  final Order order;

  const OrderItemWidget({
    super.key,
    required this.order,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: 100,
              height: 100,
              padding: EdgeInsets.all(10),
              margin: EdgeInsets.only(bottom: 13),
              decoration: BoxDecoration(
                color: AppColors.primaryColor,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Center(child: Image.asset(order.image)),
            ),
            SizedBox(
              width: 15,
            ),
            Container(
              height: 100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      TextView(
                        text: order.item,
                        fontWeight: FontWeight.w600,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      TextView(
                        text: "X ${order.quantity}",
                        fontWeight: FontWeight.w600,
                      ),
                    ],
                  ),
                  TextView(
                    text: "N " + order.price.toString(),
                    fontWeight: FontWeight.w600,
                  ),

                  // ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
