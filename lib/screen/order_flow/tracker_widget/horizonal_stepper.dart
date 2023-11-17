import 'package:flutter/material.dart';
import 'package:trackorder/screen/order_flow/tracker_widget/dot_provider.dart';
import 'package:trackorder/screen/order_flow/tracker_widget/track_data.dart';

class HorizontalStepperItem extends StatelessWidget {
  const HorizontalStepperItem(
      {Key? key,
      required this.item,
      required this.index,
      required this.totalLength,
      required this.activeIndex,
      required this.isInverted,
      required this.activeBarColor,
      required this.inActiveBarColor,
      required this.barHeight,
      required this.iconHeight,
      required this.iconWidth})
      : super(key: key);

  final StepperData item;

  final int index;

  final int totalLength;

  final int activeIndex;

  final bool isInverted;

  final Color activeBarColor;

  final Color inActiveBarColor;

  final double barHeight;

  final double iconHeight;

  final double iconWidth;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment:
            isInverted ? MainAxisAlignment.start : MainAxisAlignment.end,
        children: isInverted ? getInvertedChildren() : getChildren(),
      ),
    );
  }

  List<Widget> getChildren() {
    return [
      if (item.title != null) ...[
        const SizedBox(height: 4),
      ],
      if (item.subtitle != null) ...[
        const SizedBox(height: 8),
      ],
      Row(
        children: [
          Flexible(
            child: Container(
              color: index == 0
                  ? Colors.transparent
                  : (index <= activeIndex ? activeBarColor : inActiveBarColor),
              height: barHeight,
            ),
          ),
          DotProvider(
            activeIndex: activeIndex,
            index: index,
            item: item,
            totalLength: totalLength,
            iconHeight: iconHeight,
            iconWidth: iconWidth,
          ),
          Flexible(
            child: Container(
              color: index == totalLength - 1
                  ? Colors.transparent
                  : (index < activeIndex ? activeBarColor : inActiveBarColor),
              height: barHeight,
            ),
          ),
        ],
      ),
    ];
  }

  List<Widget> getInvertedChildren() {
    return getChildren().reversed.toList();
  }
}
