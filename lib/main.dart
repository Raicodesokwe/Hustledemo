import 'package:flutter/material.dart';
import 'package:qrdemo/pages/firstpage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primaryColor: const Color(0xFF00CC99),
          fontFamily: 'GT Walsheim',
          textTheme: const TextTheme(
              headline1: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w800,
                  fontSize: 18),
              bodyText1: TextStyle(color: Colors.black54)),
         
          appBarTheme: const AppBarTheme(backgroundColor: Colors.white)
          //using const disables unnecesary widget rebuilds
          //defining our theme globally enables us avoid unnecesssary repetition
          ),
      debugShowCheckedModeBanner: false,
      //turns off the debug banner
      home: const FirstPage(),
      //we pass the home widget here which in our case is the Firstpage widget
      //We use const which is a compile time constant to avoid unnecessary widget rebuilds
      //We outsource this code to the FirstPage widget to avoid unnecessary nesting
    );
  }
}
