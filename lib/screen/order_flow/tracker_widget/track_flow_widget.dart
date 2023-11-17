import 'package:flutter/material.dart';
import 'package:trackorder/screen/order_flow/tracker_widget/horizonal_stepper.dart';
import 'package:trackorder/screen/order_flow/tracker_widget/track_data.dart';
import 'package:trackorder/screen/order_flow/tracker_widget/vertical_stepper.dart';

class OrderFlow extends StatelessWidget {
  const OrderFlow({
    Key? key,
    required this.stepperList,
    this.verticalGap = 40,
    this.activeIndex = 0,
    required this.stepperDirection,
    this.inverted = false,
    this.activeBarColor = Colors.blue,
    this.inActiveBarColor = Colors.grey,
    this.barThickness = 2,
    this.scrollPhysics,
    this.iconHeight = 20,
    this.iconWidth = 20,
  })  : assert(verticalGap >= 0),
        super(key: key);

  final List<StepperData> stepperList;

  final double verticalGap;

  final int activeIndex;

  final Axis stepperDirection;

  final bool inverted;

  final Color activeBarColor;

  final Color inActiveBarColor;

  final double barThickness;

  final double iconHeight;

  final double iconWidth;

  final ScrollPhysics? scrollPhysics;

  @override
  Widget build(BuildContext context) {
    var crossAxisAlign = stepperDirection == Axis.horizontal
        ? CrossAxisAlignment.end
        : CrossAxisAlignment.start;
    if (inverted) {
      // invert Alignment in case of [Axis.vertical]
      crossAxisAlign = crossAxisAlign == CrossAxisAlignment.end
          ? CrossAxisAlignment.start
          : CrossAxisAlignment.end;
    }
    final Iterable<int> iterable = Iterable<int>.generate(stepperList.length);
    return Flex(
      crossAxisAlignment: crossAxisAlign,
      direction: stepperDirection,
      children: iterable
          .map((index) => _getPreferredStepper(context, index: index))
          .toList(),
    );
  }

  Widget _getPreferredStepper(BuildContext context, {required int index}) {
    if (stepperDirection == Axis.horizontal) {
      return HorizontalStepperItem(
        index: index,
        item: stepperList[index],
        totalLength: stepperList.length,
        activeIndex: activeIndex,
        isInverted: inverted,
        inActiveBarColor: inActiveBarColor,
        activeBarColor: activeBarColor,
        barHeight: barThickness,
        iconHeight: iconHeight,
        iconWidth: iconWidth,
      );
    } else {
      return VerticalStepperItem(
        index: index,
        item: stepperList[index],
        totalLength: stepperList.length,
        gap: verticalGap,
        activeIndex: activeIndex,
        isInverted: inverted,
        inActiveBarColor: inActiveBarColor,
        activeBarColor: activeBarColor,
        barWidth: barThickness,
        iconHeight: iconHeight,
        iconWidth: iconWidth,
      );
    }
  }
}
