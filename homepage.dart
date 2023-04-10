// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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

  List<String> list_items = [
    'images/hotel1.jpg',
    'images/hotel2.jpg',
    'images/hotel3.jpg',
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff40cd7d),
        elevation: 0,
        // leading: Icon(
        //   Icons.menu,
        //   color: Colors.black,
        // ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text('Dip Aakash Gurung'),
              accountEmail: Text('gurungdip111@gmail.com'),
              currentAccountPicture: GestureDetector(
                child: CircleAvatar(
                  backgroundColor: Colors.grey,
                  child: Icon(
                    Icons.person,
                    color: Colors.white,
                  ),
                ),
              ),
              decoration: const BoxDecoration(
                color: Color(0xff40cd7d),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/homepage');
              },
              child: const ListTile(
                title: Text('Home Page'),
                leading: Icon(
                  Icons.home,
                  color: Colors.red,
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: const ListTile(
                title: Text('My Account'),
                leading: Icon(
                  Icons.person,
                  color: Colors.red,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/hotelinformation');
              },
              child: const ListTile(
                title: Text('Hotel information'),
                leading: Icon(
                  Icons.shopping_basket,
                  color: Colors.red,
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: const ListTile(
                title: Text('room information'),
                leading: Icon(
                  Icons.category,
                  color: Colors.red,
                ),
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/viewhotelinformation');
              },
              child: const ListTile(
                title: Text('view Hotel information'),
                leading: Icon(
                  Icons.favorite,
                  color: Colors.red,
                ),
              ),
            ),
            Divider(),
            InkWell(
              onTap: () {},
              child: const ListTile(
                title: Text('Settings'),
                leading: Icon(
                  Icons.settings,
                  color: Colors.blue,
                ),
              ),
            ),
            InkWell(
              onTap: () {},
              child: const ListTile(
                title: Text('About'),
                leading: Icon(
                  Icons.help,
                  color: Colors.green,
                ),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: width * .08, top: height * .02),
              child: Container(
                height: 40,
                width: width * .8,
                decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                      blurRadius: 30.0, // soften the shadow
                      spreadRadius: 2, //extend the shadow
                      offset: Offset(
                        10.0, // Move to right 10  horizontally
                        15.0, // Move to bottom 10 Vertically
                      ),
                    )
                  ],
                ),
                child: Padding(
                  padding: EdgeInsets.only(left: width * .04),
                  child: Row(
                    children: [
                      Icon(
                        Icons.search,
                        color: Colors.grey,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: width * .04),
                        child: Text(
                          "search",
                          style: TextStyle(color: Colors.grey, fontSize: 14),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: height * .04, left: width * .08),
              child: Text(
                'Discover Hotels in Different places',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),

            Padding(
              padding: EdgeInsets.only(top: height * .04),
              child: Row(children: [
                Container(
                  height: 170,
                  width: 160,
                  margin: EdgeInsets.only(left: 10),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    elevation: 8,
                    clipBehavior: Clip.antiAlias,
                    // color: Colors.lightBlue,

                    child: Column(
                      children: [
                        Image.asset(
                          'images/hotel2.jpg',
                          height: 100,
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  height: 170,
                  width: 160,
                  margin: EdgeInsets.only(left: 10),
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    elevation: 8,
                    clipBehavior: Clip.antiAlias,
                    // color: Colors.lightBlue,

                    child: Column(
                      children: [
                        Image.asset(
                          'images/hotel3.jpg',
                          height: 100,
                        ),
                      ],
                    ),
                  ),
                ),
              ]),
            ),

            // Row(
            //   children: [
            //     Image.asset(
            //       'images/hotel1.jpg',
            //       height: 300,
            //       width: 150,
            //     ),
            //     Image.asset(
            //       'images/hotel2.jpg',
            //       height: 200,
            //       width: 100,
            //     ),
            //     Image.asset(
            //       'images/hotel3.jpg',
            //       height: 200,
            //       width: 100,
            //     ),
            //   ],
            // )
            Padding(
              padding: EdgeInsets.only(top: height * .02),
              child: Image.asset(
                'images/hotel2.jpg',
                width: 350,
                height: 300,
                fit: BoxFit.contain,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
