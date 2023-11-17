import 'package:flutter/material.dart';
import 'package:ably_flutter/ably_flutter.dart' as ably;
import 'package:provider/provider.dart';
import 'package:trackorder/provider/order_change_notifiers.dart';
import 'package:trackorder/screen/order_flow/tracker_widget/track_flow_widget.dart';

class TrackOrderPage extends StatefulWidget {
  const TrackOrderPage({super.key});

  @override
  State<TrackOrderPage> createState() => _TrackOrderPageState();
}

class _TrackOrderPageState extends State<TrackOrderPage> {
  late ably.Realtime realtimeInstance;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Consumer<OrderProvider>(
          builder: (context, data, child) => ListView(
            children: [
              const SizedBox(
                height: 50,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(Icons.arrow_back)),
              ),
              OrderFlow(
                activeBarColor: Colors.redAccent,
                inActiveBarColor: Colors.grey,
                stepperList: data.newStatusData,
                stepperDirection: Axis.vertical,
                activeIndex: data.newStatusData.length,
                iconWidth: 40,
                iconHeight: 40,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
