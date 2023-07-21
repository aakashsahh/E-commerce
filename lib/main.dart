import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hamro_furniture/firebase_options.dart';
import 'package:hamro_furniture/screens/login_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
   MyApp({Key? key}) : super(key: key);
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Hamro Furniture',
      debugShowCheckedModeBanner: false,
      navigatorKey: navigatorKey,
      home: const LoginPage(),
      
    );
  }
}
