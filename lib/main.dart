import 'package:flutter/material.dart';
import 'package:weathe_self/network/remote/dio%20helper.dart';
import 'package:weathe_self/ui%20screens/home%20page.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await DioHelper.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: ' flutter weather app',
      theme: ThemeData(
      ),
      home:  HomePage(title: 'Home Weather!'),
    );
  }
}

