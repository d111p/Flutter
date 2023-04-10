import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  File? image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home page"),
      ),
      body: Column(
        children: [
          Text("Welcome to the home page"),
          ElevatedButton(
              onPressed: () {
                pickImage();
              },
              child: Text('image')),
          image != null
              ? Image.file(
                  image!,
                  height: 160,
                  width: 160,
                )
              : FlutterLogo(
                  size: 160,
                ),
          IconButton(onPressed: () {}, icon: Icon(Icons.logout)),
        ],
      ),
    );
  }

  Future pickImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);
      if (image == null) return;
      final imageTempory = File(image.path);
      setState(() {
        this.image = imageTempory;
      });
    } on PlatformException catch (e) {
      print('failed to pick image: $e');
    }
  }
}
