import 'package:chamcong/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: router,
      builder: FToastBuilder(),
      theme: ThemeData(),
      debugShowCheckedModeBanner: false,
    );
  }
}
