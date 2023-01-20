// ignore_for_file: prefer_const_constructors, unused_local_variable

import 'package:flutter/material.dart';
import 'package:project/cardswiper.dart';
import 'package:project/intro_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _routes = {
      '/': (context) => CardSwiper(),//SplashScreen(),
      '/product': (context) => IntroPage(),
      // '/login': (context) => WelcomeBackPage(),
      // '/add': (context) => AddProduct(),
      // '/edit': (context) => EditProduct(),
    };
    return MaterialApp(
      title: 'eCommerce int2',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      //routes: _routes,
      theme: ThemeData(
        brightness: Brightness.light,
        canvasColor: Colors.transparent,
        primarySwatch: Colors.blue,
        //fontFamily: "Montserrat",
      ),
      home: IntroPage(),
    );
  }
}