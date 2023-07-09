import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hamro_furniture/firebase_options.dart';
import 'package:hamro_furniture/screens/home2.dart';

// import 'screens/Homepage.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Hamro Furniture',
      debugShowCheckedModeBanner: false,
      home: Homepage2(),
      
    );
  }
}
