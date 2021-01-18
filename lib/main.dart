import 'package:firebase_android/app/locator.dart';
import 'package:firebase_android/ui/views/wrapper/wrapper_view.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

// Visual Studio Code extension - use dart and flutter 3.14.1

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WrapperView(),
    );
  }
}
