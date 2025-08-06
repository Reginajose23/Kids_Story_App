import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:gets_app/screens/homepage.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';


Future main() async{
  WidgetsFlutterBinding.ensureInitialized();
 // FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding)
  runApp(const MyApp());
}

Future initialization(BuildContext? context)async{
  await Future.delayed(Duration(seconds: 5));
}


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'GetsApp',
      theme: ThemeData(
        fontFamily: 'Pumpkin Story',
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
              // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        //useMaterial3: true,
      ),
      home:  HomePage(),
    );
  }
}

