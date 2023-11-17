import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trackorder/screen/home_screen/widget/head_widget.dart';
import 'package:trackorder/screen/home_screen/widget/item_section.dart';
import 'package:trackorder/screen/home_screen/widget/vendor_section.dart';
import 'package:trackorder/provider/order_change_notifiers.dart';
import 'package:provider/provider.dart';

import '../../models/order_model.dart';

class HomeScreen extends StatelessWidget {
  final String? name;
  const HomeScreen({Key? key, this.name}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Provider.of<OrderProvider>(context).configureAblyService();

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Consumer<OrderProvider>(
            builder: (context, data, child) => Padding(
              padding: const EdgeInsets.all(18.0),
              child: Column(
                children: [
                  const SizedBox(height: 20),
                  HeaderCard(
                      name: name!, activeStep: data.newStatusData.length),
                  const SizedBox(height: 10),
                  const ItemSection(),
                  VendorDetailSection(
                    order: mockOrder,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
