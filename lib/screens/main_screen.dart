import 'package:flutter/material.dart';
import '../widgets/image_input.dart';

class main_screen extends StatefulWidget {
  @override
  _main_screenState createState() => _main_screenState();
}

class _main_screenState extends State<main_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shape Cam'),
      ),
      body: ImageInput(),
    );
  }
}
