// ignore_for_file: file_names

import 'package:flutter/material.dart';

class ReviewBooking extends StatefulWidget {
  const ReviewBooking({Key? key}) : super(key: key);

  @override
  State<ReviewBooking> createState() => _ReviewBookingState();
}

class _ReviewBookingState extends State<ReviewBooking> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 1,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.green,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Column(
        children: [
          Row(
            children: [
              Image.asset('images/hotel1.jpg'),
              Text('hotel Name: Anapurna hotel')
            ],
          ),
          Text('Booking Info'),
          Row(
            children: [Text('Checkin'), Text('5 Dec 2021 Sunday 10:00 AM')],
          ),
          Row(
            children: [Text('Checkin'), Text('5 Dec 2021 Sunday')],
          )
        ],
      ),
    );
  }
}
