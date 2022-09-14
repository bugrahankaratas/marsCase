import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mars_case/pages/login_page/view/login_view.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: Colors.brown[200]),
      title: 'Material App',
      home: LoginView(),
    );
  }
}
