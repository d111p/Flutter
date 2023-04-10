import 'package:flutter/material.dart';
import 'package:hotelbooking/Login/login.dart';
import 'package:hotelbooking/Login/user_signup.dart';
import 'package:hotelbooking/pages/homepage.dart';
import 'package:hotelbooking/pages/hotel_info.dart';
import 'package:hotelbooking/pages/onboardingpage/onbordin.dart';
import 'package:hotelbooking/pages/splashscreen/splashscreen.dart';
import 'package:hotelbooking/pages/viewhotelinfo.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: '/splashScreen',
        routes: {
          '/splashScreen': (context) => SplashScreen(),
          '/onboarding': (context) => OnBoardingPage(),
          '/login': (context) => Login(),
          '/usersignup': (context) => UserSignup(),
          '/homepage': (context) => HomePage(),
          '/hotelinformation': (context) => Hotel_info(),
          '/viewhotelinformation': (context) => ViewHotelInfo(),
        });
  }
}
