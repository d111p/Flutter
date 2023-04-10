// ignore_for_file: non_constant_identifier_names, unused_field, prefer_final_fields, prefer_const_constructors, unnecessary_new

import 'package:flutter/material.dart';
import 'package:hotelbooking/Model/hotelinfo.dart';
import 'package:http/http.dart' as http;

class Hotel_info extends StatefulWidget {
  const Hotel_info({Key? key}) : super(key: key);

  @override
  _Hotel_infoState createState() => _Hotel_infoState();
}

class _Hotel_infoState extends State<Hotel_info> {
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

  TextEditingController _hotelName = TextEditingController();
  TextEditingController _ZipCode = TextEditingController();
  TextEditingController _city = TextEditingController();
  TextEditingController _state = TextEditingController();
  TextEditingController _hotelLocation = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff40cd7d),
          elevation: 0,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(top: height * .04),
                child: Text(
                  'please uplaod the hotel information',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(
                  top: height * .02,
                  left: width * .04,
                  right: width * .04,
                ),
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    color: Colors.white,
                  ),
                  child: TextField(
                    controller: _hotelName,
                    decoration: InputDecoration(
                        hintText: 'hotel name',
                        hintStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                        suffixIcon: Icon(Icons.close),
                        suffixStyle: TextStyle(color: Colors.black),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xffeceff3),
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        focusColor: Colors.black,
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xffeceff3),
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(15)))),
                  ),
                ),
              ),

              //Zip code Textfield

              Padding(
                padding: EdgeInsets.only(
                  top: height * .02,
                  left: width * .04,
                  right: width * .04,
                ),
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    color: Colors.white,
                  ),
                  child: TextField(
                    controller: _ZipCode,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        hintText: 'Zip code',
                        hintStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                        suffixIcon: Icon(Icons.close),
                        suffixStyle: TextStyle(color: Colors.black),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xffeceff3),
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        focusColor: Colors.black,
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xffeceff3),
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(15)))),
                  ),
                ),
              ),

              // City

              Padding(
                padding: EdgeInsets.only(
                  top: height * .02,
                  left: width * .04,
                  right: width * .04,
                ),
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    color: Colors.white,
                  ),
                  child: TextField(
                    controller: _city,
                    decoration: InputDecoration(
                        hintText: 'City',
                        hintStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                        suffixIcon: Icon(Icons.close),
                        suffixStyle: TextStyle(color: Colors.black),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xffeceff3),
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        focusColor: Colors.black,
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xffeceff3),
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(15)))),
                  ),
                ),
              ),

              //State

              Padding(
                padding: EdgeInsets.only(
                  top: height * .02,
                  left: width * .04,
                  right: width * .04,
                ),
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    color: Colors.white,
                  ),
                  child: TextField(
                    controller: _state,
                    decoration: InputDecoration(
                        hintText: 'state',
                        hintStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                        suffixIcon: Icon(Icons.close),
                        suffixStyle: TextStyle(color: Colors.black),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xffeceff3),
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        focusColor: Colors.black,
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xffeceff3),
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(15)))),
                  ),
                ),
              ),

              // hotel location

              Padding(
                padding: EdgeInsets.only(
                  top: height * .02,
                  left: width * .04,
                  right: width * .04,
                ),
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    color: Colors.white,
                  ),
                  child: TextField(
                    controller: _hotelLocation,
                    decoration: InputDecoration(
                        hintText: 'hotel location',
                        hintStyle: TextStyle(
                            color: Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                        suffixIcon: Icon(Icons.close),
                        suffixStyle: TextStyle(color: Colors.black),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xffeceff3),
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(15))),
                        focusColor: Colors.black,
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Color(0xffeceff3),
                            ),
                            borderRadius:
                                BorderRadius.all(Radius.circular(15)))),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: height * .04),
                child: SizedBox(
                  width: width * .8,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      RegisterHotelInfo();
                    },
                    child: const Text('submit'),
                    style: ElevatedButton.styleFrom(
                        primary: const Color(0xff40cd7d),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30))),
                  ),
                ),
              ),
            ],
          ),
        ));
  }

  Future RegisterHotelInfo() async {
    String APIURL = "http://10.0.2.2:8000/api/hotel-details/";
    // final Map mappeddata = {
    //   'name': _name.text,
    //   'category': _category.text,
    //   'price': _price.text,
    //   'description': _Description.text,
    //   'stars': _status.text,
    // };
    modelHotelInfo model = new modelHotelInfo(
      hotelName: _hotelName.text,
      zipCode: _ZipCode.text,
      city: _city.text,
      state: _state.text,
      hotel_location: _hotelLocation.text,
    );
    print(model.toJson());

    http.Response response =
        await http.post(Uri.parse(APIURL), body: model.toJson());
    if (response.statusCode == 200) {
      print("value add");
    } else {
      print("exception occor $response");
      print(response.statusCode);
    }
  }
}
