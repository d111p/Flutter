// ignore_for_file: prefer_const_constructors

// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hotelbooking/Model/customerdetails.dart';
import 'package:hotelbooking/Model/customerid.dart';
import 'package:hotelbooking/pages/booking.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class CustomerDetailsAfterBooking extends StatefulWidget {
  const CustomerDetailsAfterBooking({Key? key}) : super(key: key);

  @override
  State<CustomerDetailsAfterBooking> createState() =>
      _CustomerDetailsAfterBookingState();
}

class _CustomerDetailsAfterBookingState
    extends State<CustomerDetailsAfterBooking> {
  GlobalKey<FormState> formkey = GlobalKey<FormState>();
  double height = 0;
  double width = 0;
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    setState(() {
      height = MediaQuery.of(context).size.height;
      width = MediaQuery.of(context).size.width;
    });
  }

  TextEditingController firstName = new TextEditingController();
  TextEditingController lastName = new TextEditingController();
  TextEditingController city = new TextEditingController();
  TextEditingController state = new TextEditingController();
  TextEditingController phoneNumber = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Padding(
          padding: EdgeInsets.only(left: 60),
          child: Text(
            "Customer Information ",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 20),
          child: Form(
            key: formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Text(
                  'Guest Details',
                  style: TextStyle(color: Colors.black54, fontSize: 18),
                ),
                Text(
                    'We will use this information to share your booking details.',
                    style: TextStyle(fontSize: 13)),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: TextFormField(
                    controller: firstName,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(bottom: 3),
                      labelText: 'first Name',
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      hintText: 'dip',
                      hintStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Required";
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: TextFormField(
                    controller: lastName,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(bottom: 3),
                      labelText: 'Last Name',
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      hintText: 'Nepal',
                      hintStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Required";
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: TextFormField(
                    controller: phoneNumber,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(bottom: 3),
                      labelText: 'Phone Number',
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      hintText: '9843117125',
                      hintStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Required";
                      } else if (!RegExp(r'^(?:\+977[- ])?\d{2}-?\d{8}$')
                          .hasMatch(value)) {
                        return "Please input the correct phone number";
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: TextFormField(
                    controller: state,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(bottom: 3),
                      labelText: 'state',
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      hintText: 'Bagmati',
                      hintStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Required";
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: TextFormField(
                    controller: city,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(bottom: 3),
                      labelText: 'City',
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      hintText: 'Kathmandu',
                      hintStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Required";
                      } else {
                        return null;
                      }
                    },
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                SizedBox(
                  width: width * .8,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      if (formkey.currentState!.validate()) {
                        BookingDetails();
                        Bookings();
                      }
                    },
                    child: const Text('submit'),
                    style: ElevatedButton.styleFrom(
                        primary: const Color(0xff40cd7d),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30))),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future BookingDetails() async {
    String APIURL = "http://10.0.2.2:8000/api/customer-details/";

    customerDetails model = customerDetails(
      firstName: firstName.text,
      lastName: lastName.text,
      city: city.text,
      state: state.text,
      PhoneNumber: phoneNumber.text,
    );

    http.Response response =
        await http.post(Uri.parse(APIURL), body: model.toJson());
    final body = jsonDecode(response.body);
    if (response.statusCode == 200 || response.statusCode == 201) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Sucessfully book the room")));
      print("value add");
      Map useMap = body;
      var customer = customerid.fromJson(useMap);
      var cid = int.parse('${customer.id}');
      print(cid);
      await customerdata(cid);
      Bookings();
      //await reservation(cid);
    } else {
      print("exception occor $response");
      print(response.statusCode);
    }
  }

  Future customerdata(int cid) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var id = pref.getString("id");
    print(id);
    String APIURL = "http://10.0.2.2:8000/api/customer-info/";

    http.Response response = await http.post(Uri.parse(APIURL),
        body: ({'user': '${id}', 'id': '${cid}'}));
    final body = jsonDecode(response.body);
    print(body);
    if (response.statusCode == 200 || response.statusCode == 201) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Sucessfully book the room")));
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Bookings()));

      print("value add");
    } else {
      print("exception occor $response");
      print(response.statusCode);
    }
  }

  Future reservation(int cid) async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    var currentdate = pref.getString('bookdate');
    var hour = pref.getString("hours");
    var numberOfGuest = pref.getString("numberOfGuest");
    String APIURL = "http://10.0.2.2:8000/api/reservation/";
    print(currentdate);
    print(hour);
    print(numberOfGuest);

    http.Response response = await http.post(Uri.parse(APIURL),
        body: ({
          'checkInDateTime': '${currentdate}',
          'checkOutDateTime': '${currentdate}',
          'reservationGuest': '${firstName.text}',
          'numberOfGuest': '${numberOfGuest}',
          'CustomerId': '${cid}'
        }));
    final body = jsonDecode(response.body);
    print(body);
    if (response.statusCode == 200 || response.statusCode == 201) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("Sucessfully book the room")));
      print("value add");
    } else {
      print("exception occor $response");
      print(response.statusCode);
    }
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
