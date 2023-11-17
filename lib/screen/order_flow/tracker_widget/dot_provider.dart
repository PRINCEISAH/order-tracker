import 'package:flutter/material.dart';
import 'package:trackorder/screen/order_flow/tracker_widget/stepper_dot_widget.dart';
import 'package:trackorder/screen/order_flow/tracker_widget/track_data.dart';
import 'package:trackorder/screen/order_flow/tracker_widget/utills.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DotProvider extends StatelessWidget {
  const DotProvider(
      {Key? key,
      required this.index,
      required this.activeIndex,
      required this.item,
      required this.totalLength,
      this.iconHeight,
      this.iconWidth})
      : super(key: key);

  final StepperData item;

  final int index;

  final int totalLength;

  final int activeIndex;

  final double? iconHeight;

  final double? iconWidth;

  @override
  Widget build(BuildContext context) {
    return index >= activeIndex
        ? SizedBox(
            height: iconHeight,
            width: iconWidth,
            child: item.iconWidget ??
                StepperDot(
                  index: index,
                  totalLength: totalLength,
                  activeIndex: activeIndex,
                ),
          )
        : SizedBox(
            height: iconHeight,
            width: iconWidth,
            child: SvgPicture.asset(
              "assets/images/icecream.svg",
            ));
  }
}
