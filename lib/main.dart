import 'package:e_mart/firebase_options.dart';
import 'package:e_mart/views/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'consts/consts.dart';
import 'package:get/get.dart';

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
    //changing into getMaterialApp
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: appname,
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.transparent,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(
            color: darkFontGrey
          ),
        ),
        fontFamily: regular,
      ),
      home: const SplashScreen(),
    );
  }
}
