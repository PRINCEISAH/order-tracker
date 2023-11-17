import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_social_button/flutter_social_button.dart';
import 'package:trackorder/screen/home_screen/home_screen.dart';

import '../../provider/order_change_notifiers.dart';
import 'package:provider/provider.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? _user;

  @override
  void initState() {
    _auth.authStateChanges().listen((event) {
      setState(() {
        _user = event;
      });
      if (_user != null)
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return HomeScreen(
                name: _user!.email,
              );
            },
          ),
        );
    });
    // TODO: implement initState
    super.initState();
  }

  void _google() {
    try {
      GoogleAuthProvider _googleAuth = GoogleAuthProvider();
      _auth.signInWithProvider(_googleAuth);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FlutterSocialButton(
          onTap: () {
            _google();
          },
          buttonType: ButtonType.google,
        ),
      ],
    ));
  }
}
