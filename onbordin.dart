// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:hotelbooking/Login/login.dart';
import 'package:hotelbooking/pages/booking.dart';

class OnBoardingPage extends StatefulWidget {
  const OnBoardingPage({Key? key}) : super(key: key);

  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Color(0xff688dd7),
          // currentIndex: 0, // this will be set when a new tab is tapped
          items: [
            BottomNavigationBarItem(
                icon: new Icon(Icons.arrow_back_ios), label: ""),
            BottomNavigationBarItem(
              icon: Text(
                "Skip",
                style: TextStyle(color: Colors.white, fontSize: 20),
              ),
              label: "",
            ),
            BottomNavigationBarItem(
                icon: new Icon(Icons.arrow_forward_ios), label: ""),
          ],
        ),
        body: PageView(
          children: <Widget>[
            Container(
              color: Colors.white,
              child: Center(
                  child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Image.asset("images/onboarding1.jpg"),
                  const Text(
                    "Select Hotel",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  const Text(
                    "select the best hotel from hotel Booking app",
                    style: TextStyle(fontSize: 17),
                  ),
                  const Text(
                    "It helps to find best hotel at anywhere",
                    style: TextStyle(fontSize: 17),
                  ),
                  // Text(
                  //   "do eiusmod tempor incididunt ut",
                  //   style: TextStyle(fontSize: 17),
                  // ),
                  // Text(
                  //   "labore et dolore magna aliqua,",
                  //   style: TextStyle(fontSize: 17),
                  // ),
                ],
              )),
            ),

            //second onbording page

            Container(
              color: Colors.white,
              child: Center(
                  child: Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Image.asset("images/onboarding2.png"),
                  const Text(
                    "Manage Booking",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  const Text(
                    "Booking & Cancellation anytime,",
                    style: TextStyle(fontSize: 17),
                  ),
                  const Text(
                    "anywhere you want",
                    style: TextStyle(fontSize: 17),
                  ),
                ],
              )),
            ),

            //Third onbording page
            // Container(
            //   color: Colors.white,
            //   child: Center(
            //       child: Column(
            //     children: [
            //       const SizedBox(
            //         height: 20,
            //       ),
            //       Image.asset(
            //         "images/onboarding3.jpg",
            //         height: 200,
            //         width: 250,
            //       ),
            //       const Text(
            //         "Title",
            //         style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
            //       ),
            //       const SizedBox(
            //         height: 50,
            //       ),
            //       const Text(
            //         "Lorem ipsum dolor sit amet,",
            //         style: TextStyle(fontSize: 17),
            //       ),
            //       const Text(
            //         "consectetur adipiscing edit,sed",
            //         style: TextStyle(fontSize: 17),
            //       ),
            //       Text(
            //         "do eiusmod tempor incididunt ut",
            //         style: TextStyle(fontSize: 17),
            //       ),
            //       Text(
            //         "labore et dolore magna aliqua,",
            //         style: TextStyle(fontSize: 17),
            //       ),
            //       Text(
            //         " enim ad minim veniam, quis",
            //         style: TextStyle(fontSize: 17),
            //       ),
            //       Text(
            //         "nostrud exercitation ullamco",
            //         style: TextStyle(fontSize: 17),
            //       ),
            //       Text(
            //         "laboris nisi aliuip ex ea",
            //         style: TextStyle(fontSize: 17),
            //       ),
            //       Text(
            //         "commodo consequat.",
            //         style: TextStyle(fontSize: 17),
            //       ),
            //     ],
            //   )),
            // ),

            //Fourth onBording

            Container(
              color: Colors.white,
              child: Center(
                  child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 250, top: 20),
                    child: SizedBox(
                      height: 50,
                      width: 100,
                      child: TextButton(
                          onPressed: () {
                            Navigator.of(context).pushAndRemoveUntil(
                                MaterialPageRoute(
                                    builder: (context) => Login()),
                                (route) => false);
                          },
                          child: const Text(
                            "Skip",
                            style: TextStyle(fontSize: 20),
                          ),
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.blue[100]))),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Image.asset(
                    "images/onboarding3.jpg",
                    height: 200,
                    width: 250,
                  ),
                  const Text(
                    "Find Best Deals",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  const Text(
                    "Stay with us and find best",
                    style: TextStyle(fontSize: 17),
                  ),
                  const Text(
                    "deals on every stay.",
                    style: TextStyle(fontSize: 17),
                  ),
                ],
              )),
            ),
          ],
        ),
      ),
    );
  }
}
