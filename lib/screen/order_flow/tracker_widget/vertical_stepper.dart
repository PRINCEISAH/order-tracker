import 'package:flutter/material.dart';
import 'package:trackorder/screen/order_flow/text_views.dart';
import 'package:trackorder/screen/order_flow/tracker_widget/dot_provider.dart';
import 'package:trackorder/screen/order_flow/tracker_widget/track_data.dart';
import 'package:trackorder/utils/utils.dart';

class VerticalStepperItem extends StatelessWidget {
  const VerticalStepperItem(
      {Key? key,
      required this.item,
      required this.index,
      required this.totalLength,
      required this.gap,
      required this.activeIndex,
      required this.isInverted,
      required this.activeBarColor,
      required this.inActiveBarColor,
      required this.barWidth,
      required this.iconHeight,
      required this.iconWidth})
      : super(key: key);

  final StepperData item;

  final int index;

  final int totalLength;

  final int activeIndex;

  final double gap;

  final bool isInverted;

  final Color activeBarColor;

  final Color inActiveBarColor;

  final double barWidth;

  final double iconHeight;

  final double iconWidth;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: isInverted ? getInvertedChildren() : getChildren(),
    );
  }

  List<Widget> getChildren() {
    return [
      Column(
        children: [
          Container(
            color: index == 0
                ? Colors.transparent
                : (index <= activeIndex ? activeBarColor : inActiveBarColor),
            width: barWidth,
            height: gap,
          ),
          DotProvider(
            activeIndex: activeIndex,
            index: index,
            item: item,
            totalLength: totalLength,
            iconHeight: iconHeight,
            iconWidth: iconWidth,
          ),
          Container(
            color: index == totalLength - 1
                ? Colors.transparent
                : (index < activeIndex ? activeBarColor : inActiveBarColor),
            width: barWidth,
            height: gap,
          ),
        ],
      ),
      const SizedBox(width: 8),
      Expanded(
        child: Column(
          crossAxisAlignment:
              isInverted ? CrossAxisAlignment.end : CrossAxisAlignment.start,
          children: [
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        TextView(
                          text: item.title ?? '',
                          fontWeight: FontWeight.bold,
                        ),
                        TextView(
                          text: formatTime(item.dateTime!),
                          fontWeight: FontWeight.bold,
                          fontSize: 12,
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    TextView(
                      text: item.subtitle ?? "",
                      fontSize: 12,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    ];
  }

  List<Widget> getInvertedChildren() {
    return getChildren().reversed.toList();
  }
}
