import 'package:flutter/material.dart';
import 'package:trackorder/models/config.dart';
import 'package:trackorder/models/order_list.dart';
import 'package:trackorder/screen/order_flow/tracker_widget/track_data.dart';
import 'package:ably_flutter/ably_flutter.dart' as ably;
import 'package:uuid/uuid.dart';

class OrderProvider extends ChangeNotifier {
  int stepsTaken = 0;

  static ably.Realtime? realtimeInstance;

  static ably.RealtimeChannel? channel;

  List<StepperData> newStatusData = [];

  Stream<ably.ConnectionStateChange> get connection =>
      realtimeInstance!.connection.on();

  configureAblyService() async {
    var myRandomClientId = '';

    var uuid = Uuid();
    myRandomClientId = uuid.v4();
    final clientOptions = ably.ClientOptions(
      key: APIKey,
    );
    clientOptions.clientId = myRandomClientId;

    realtimeInstance = ably.Realtime(options: clientOptions);
    realtimeInstance?.connection
        .on()
        .listen((ably.ConnectionStateChange stateChange) {});
    channel = realtimeInstance?.channels.get('order');

    if (newStatusData.isEmpty) {
      await channel!.publish(name: '1');
    }
    subscribeToChannel();
  }

  subscribeToChannel() {
    channel!.subscribe().listen((message) async {
      stepsTaken++;
      newStatusData.add(
          orderStatusData[stepsTaken].copyWith(dateTime: message.timestamp));
      notifyListeners();
    });
  }
}
