// ignore_for_file: prefer_const_constructors, avoid_print

import 'dart:convert';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hotelbooking/Login/home.dart';
import 'package:hotelbooking/auth/restpassword.dart';
import 'package:hotelbooking/pages/homepage.dart';
import 'package:hotelbooking/pages/roomList.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  double height = 0;
  double width = 0;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    setState(() {
      height = MediaQuery.of(context).size.height;
      width = MediaQuery.of(context).size.width;
    });
  }

  var usernameController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // checkLogin();
  }

  // void checkLogin() async {
  //   //Here we check if user login already or credential already
  //   SharedPreferences pref = await SharedPreferences.getInstance();
  //   String? val = pref.getString("login");
  //   if (val != null) {
  //     print("the value is ");
  //     print(val);
  //     Navigator.of(context).pushAndRemoveUntil(
  //         MaterialPageRoute(builder: (context) => RoomList()),
  //         (route) => false);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff202443),
      body: SafeArea(
          child: SingleChildScrollView(
        child: Form(
          key: formkey,
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: height * .1, right: width * .6),
                child: Text(
                  'Welcome \nBack',
                  style: TextStyle(color: Colors.white, fontSize: 24),
                ),
              ),

              //Text fields for login
              Padding(
                padding: EdgeInsets.only(
                    top: height * .08, left: width * .04, right: width * .04),
                child: TextFormField(
                  style: TextStyle(color: Colors.white),
                  controller: usernameController,
                  decoration: InputDecoration(
                    fillColor: Color(0xff242846),
                    filled: true,
                    hintText: 'user name',
                    hintStyle:
                        const TextStyle(color: Colors.white, fontSize: 15),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(
                          color: Color(0xff202443), width: 2.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(
                          color: Color(0xff202443), width: 2.0),
                    ),
                  ),
                  // validator: RequiredValidator(errorText: " Required"),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Required";
                    } else {
                      return null;
                    }
                  },
                ),
              ),

              // Text field of password

              Padding(
                padding: EdgeInsets.only(
                    top: height * .04, left: width * .04, right: width * .04),
                child: TextFormField(
                  style: TextStyle(color: Colors.white),
                  controller: passwordController,
                  decoration: InputDecoration(
                    fillColor: Color(0xff242846),
                    filled: true,
                    hintText: 'Password',
                    hintStyle:
                        const TextStyle(color: Colors.white, fontSize: 15),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(
                          color: Color(0xff202443), width: 2.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                      borderSide: const BorderSide(
                          color: Color(0xff202443), width: 2.0),
                    ),
                  ),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Required";
                    } else if (value.length < 8) {
                      return "Password must be atleast 8 characters long";
                    } else {
                      return null;
                    }
                  },
                  // validator: RequiredValidator(errorText: " Required"),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: width * .6, top: height * .02),
                child: TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ResetPassword()));
                    },
                    child: Text(
                      'forget password?',
                      style: TextStyle(color: Color(0xff40cd7d)),
                    )),
              ),

              SizedBox(
                height: height * .06,
              ),

              //login button

              SizedBox(
                width: width * .8,
                height: 50,
                child: ElevatedButton(
                  onPressed: () {
                    if (formkey.currentState!.validate()) {
                      login();
                    }
                  },
                  child: const Text('login'),
                  style: ElevatedButton.styleFrom(
                      primary: const Color(0xff40cd7d),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30))),
                ),
              ),

              SizedBox(
                height: height * .1,
              ),
              RichText(
                  text: TextSpan(children: [
                TextSpan(text: 'new users? '),
                TextSpan(
                    text: "signup",
                    style: TextStyle(color: Color(0xff40cd7d)),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.pushNamed(context, '/usersignup');
                      })
              ])),
            ],
          ),
        ),
      )),
    );
  }

  Future<void> login() async {
    if (passwordController.text.isNotEmpty) {
      var response = await http.post(
          Uri.parse("http://10.0.2.2:8000/api/userlogin/"),
          body: ({
            'username': usernameController.text,
            'password': passwordController.text
          }));
      if (response.statusCode == 200) {
        final body = jsonDecode(response.body);

        //share ppreference to store token
        pageRoute(body['access'], body['id']);
      } else {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("Invalid Credentails.")));
      }
    } else {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Black Field NOt Allowed")));
    }
  }

  void pageRoute(String token, id) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.setString("jwt", token);
    await pref.setString("id", id.toString());
    showToast();
    Navigator.of(context).pushAndRemoveUntil(
        MaterialPageRoute(builder: (context) => RoomList()), (route) => false);
  }

  void showToast() {
    Fluttertoast.showToast(
        msg: 'sucessfully Login to your Account',
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        backgroundColor: Colors.green,
        textColor: Colors.white);
  }
}
