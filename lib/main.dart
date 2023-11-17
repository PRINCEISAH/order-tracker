import 'package:flutter/material.dart';
import 'package:trackorder/firebase_options.dart';
import 'package:trackorder/screen/auth_screen/auth.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:trackorder/provider/order_change_notifiers.dart';

import 'package:provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<OrderProvider>(
      create: (context) => OrderProvider(),
      child: Consumer<OrderProvider>(
        builder: (context, themeProvider, child) => MaterialApp(
          title: 'Flutter Provider Demo',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: const AuthScreen(),
        ),
      ),
    );
  }
}
