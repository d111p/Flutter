// ignore_for_file: prefer_const_literals_to_create_immutables

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hotelbooking/Model/hotelinfo.dart';
import 'package:http/http.dart' as http;

class ViewHotelInfo extends StatefulWidget {
  const ViewHotelInfo({Key? key}) : super(key: key);

  @override
  _ViewHotelInfoState createState() => _ViewHotelInfoState();
}

class _ViewHotelInfoState extends State<ViewHotelInfo> {
  Future fetchAlbum() async {
    final response =
        await http.get(Uri.parse('http://10.0.2.2:8000/api/hotel-details/'));

    if (response.statusCode == 200) {
      final ConvertDataJSON = json.decode(response.body);
      print(ConvertDataJSON);
      return ConvertDataJSON;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  void initState() {
    // TODO: implement initState
    super.initState();
    fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff40cd7d),
        title: Text('View the Hotel Info'),
        elevation: 0,
      ),
      body: Column(
        children: [
          Center(
              // child: FutureBuilder<modelHotelInfo>(
              //     future: fetchAlbum(),
              //     builder: (BuildContext context, AsyncSnapshot snapShot) {
              //       if (snapShot.hasData) {
              //         final hoteldata = snapShot.data;
              //         Table(
              //           border: TableBorder.all(),
              //           children: [
              //             buildRow([
              //               'HotelName',
              //               'zipcode',
              //               'Ciity',
              //               'State',
              //               'Hotel Location'
              //             ], isHeader: true),
              //             // buildRow([
              //             //   '${hoteldata.hotelName}',
              //             //   '${hoteldata.zipCode}',
              //             //   '${hoteldata.city}',
              //             //   '${hoteldata.state}',
              //             //   '${hoteldata.hotel_location}'
              //             // ]),
              //           ],
              //         );
              //       } else if (snapShot.hasError) {
              //         return Text('${snapShot.error}');
              //       }
              //       throw '';
              //     }),
              ),
          FutureBuilder(
              future: fetchAlbum(),
              builder: (BuildContext context, AsyncSnapshot snapShot) {
                if (snapShot.hasData) {
                  final covid = snapShot.data;
                  print(covid);

                  print(covid[1]['hotelName']);

                  return Expanded(
                    child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        itemCount: covid.length,
                        itemBuilder: (context, index) {
                          return Column(
                            children: [
                              DataTable(
                                columns: [
                                  DataColumn(label: Text('HotelName')),
                                  DataColumn(label: Text('zipcode')),
                                  DataColumn(label: Text('City')),
                                  DataColumn(label: Text('State')),
                                  DataColumn(label: Text('Hotel Location')),
                                ],
                                rows: [
                                  DataRow(cells: [
                                    DataCell(
                                        Text(' ${covid[index]['hotelName']}')),
                                    DataCell(
                                        Text(' ${covid[index]['zipCode']}')),
                                    DataCell(Text(' ${covid[index]['city']}')),
                                    DataCell(Text(' ${covid[index]['state']}')),
                                    DataCell(Text(
                                        ' ${covid[index]['hotel_location']}')),
                                  ]),
                                ],
                              ),
                            ],
                          );
                        }),
                  );
                } else if (snapShot.hasError) {
                  return Text(snapShot.error.toString());
                } else {
                  return CircularProgressIndicator();
                }
              }),
        ],
      ),
    );
  }
}
