import 'package:flutter/material.dart';
import 'package:trackorder/models/order_list.dart';
import 'package:trackorder/screen/track_order_screen/order_track_page.dart';
import 'package:trackorder/screen/order_flow/text_views.dart';
import 'package:trackorder/screen/order_flow/tracker_widget/track_flow_widget.dart';
import 'package:trackorder/utils/colors.dart';

class HeaderCard extends StatelessWidget {
  final int activeStep;

  final String name;

  const HeaderCard({
    super.key,
    required this.activeStep,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: SizedBox(
        height: 250,
        width: 350,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  TextView(
                    text: "Hello",
                    fontSize: 12,
                    fontWeight: FontWeight.w800,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  TextView(
                    text: name,
                    fontSize: 12,
                    fontWeight: FontWeight.w800,
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 10,
              ),
              TextView(
                text: 'Your Order has been succesfuly placed',
                fontSize: 12,
              ),
              SizedBox(
                height: 20,
              ),
              TextView(
                text: "Waiting for the vendor to accept your order",
                fontSize: 12,
              ),
              SizedBox(
                height: 20,
              ),
              OrderFlow(
                stepperList: stepperData,
                stepperDirection: Axis.horizontal,
                activeBarColor: Colors.redAccent,
                inActiveBarColor: Colors.grey,
                activeIndex: activeStep,
                iconWidth: 40,
                iconHeight: 40,
              ),
              SizedBox(
                height: 20,
              ),
              Center(
                child: GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return TrackOrderPage();
                        },
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(10)),
                    height: 40,
                    width: 120,
                    child: Center(
                        child: TextView(
                      text: "Track Order",
                      fontWeight: FontWeight.w800,
                    )),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
