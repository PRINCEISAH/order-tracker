import 'package:flutter/material.dart';
import 'package:trackorder/models/order_model.dart';
import 'package:trackorder/screen/home_screen/widget/order_item.dart';
import 'package:trackorder/screen/order_flow/text_views.dart';

class ItemSection extends StatelessWidget {
  const ItemSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: Align(
            alignment: Alignment.bottomLeft,
            child: TextView(
              text: "ITEM",
              fontSize: 15,
              textAlign: TextAlign.start,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        OrderItemWidget(order: mockOrder)
      ],
    );
  }
}
