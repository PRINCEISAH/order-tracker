import 'package:flutter/material.dart';
import 'package:trackorder/models/order_model.dart';
import 'package:trackorder/screen/order_flow/text_views.dart';
import 'package:trackorder/utils/utils.dart';

class VendorDetailSection extends StatelessWidget {
  final Order order;
  const VendorDetailSection({
    super.key,
    required this.order,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      child: SizedBox(
        height: 260,
        width: 350,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              TextView(
                text: "CREAMY LAND",
                fontSize: 15,
                fontWeight: FontWeight.w800,
              ),
              SizedBox(height: 20),
              Column(
                children: [
                  ItemListCard(name: "Order Id", value: order.orderId),
                  ItemListCard(name: "Order Type", value: order.orderType),
                  ItemListCard(
                      name: "Order Date", value: formatTime(DateTime.now())),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ItemListCard extends StatelessWidget {
  final String name;
  final String value;

  const ItemListCard({
    super.key,
    required this.name,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextView(
              text: name,
              fontWeight: FontWeight.w600,
              fontSize: 12,
            ),
            TextView(
              text: value,
              fontSize: 10,
            )
          ],
        ),
      ),
    );
  }
}
