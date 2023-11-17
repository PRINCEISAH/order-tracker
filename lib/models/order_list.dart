import 'package:trackorder/screen/order_flow/tracker_widget/track_data.dart';

List<StepperData> stepperData = [
  StepperData(),
  StepperData(),
  StepperData(),
  StepperData(),
  StepperData(),
  StepperData(),
];

List<StepperData> orderStatusData = [
  StepperData(
      title: 'Order Placed',
      index: 0,
      subtitle: "waiting for the vendor to accept your order"),
  StepperData(
      title: "Order accepted",
      index: 1,
      subtitle:
          "The vendor is preparing your order and a rider will pick up soon"),
  StepperData(
      title: "Order pickup in progres",
      index: 2,
      subtitle: "A rider is on the way to the vendor to pick up your order"),
  StepperData(
      title: "Order on the way", index: 3, subtitle: "A rider has picked"),
  StepperData(
      title: "Order arrived",
      index: 4,
      subtitle: "Dont keep the rider waiting"),
  StepperData(title: "Order delivered", index: 3, subtitle: "Enjoy"),
];
