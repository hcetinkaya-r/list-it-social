import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:list_it_social/pages/home.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'List-it Social',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFFA30003),
        accentColor: Colors.grey,
      ),
      home: Home(),
    );
  }
}
