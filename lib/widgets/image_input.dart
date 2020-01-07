import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:shapecam/screens/hairstyles.dart';

class ImageInput extends StatefulWidget {
  @override
  __ImageInputState createState() => __ImageInputState();
}

class __ImageInputState extends State<ImageInput> {
  File _storedImage;
  Future<void> _takePicture() async {

    final imageFile = await ImagePicker.pickImage(
      source: ImageSource.camera,
    );
    setState(() {
      _storedImage = imageFile;
    });
  }

  Future<void> _selectPicture() async {

    final imageFile = await ImagePicker.pickImage(
      source: ImageSource.gallery,
    );
    setState(() {
      _storedImage = imageFile;
    });
  }

  Widget doneButton() {
    return _storedImage != null? Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 50.0),
      child: MaterialButton(
        textColor: Colors.white,
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => HairstylesLoader()));
        },
        child: Text("Done"),
        color: Theme.of(context).accentColor,
        splashColor: Colors.white,
        elevation: 5,
        shape: StadiumBorder(),
      ),
    ): SizedBox();
  }

  Widget imageDislpay() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Center(
        child: ListView(
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width * 0.9,
              height: MediaQuery.of(context).size.height * 0.6,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 3,
                  color: Colors.grey,
                ),
              ),
              child: _storedImage != null
                  ? Image.file(
                      _storedImage,
                      fit: BoxFit.cover,
                      width: double.infinity,
                    )
                  : Text(
                      'no image taken',
                      textAlign: TextAlign.center,
                    ),
              alignment: Alignment.center,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 50.0),
              child: MaterialButton(
                textColor: Colors.white,
                onPressed: _takePicture,
                child: Text("Capture Image"),
                color: Theme.of(context).accentColor,
                splashColor: Colors.white,
                elevation: 5,
                shape: StadiumBorder(),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 50.0),
              child: MaterialButton(
                textColor: Colors.white,
                onPressed: _selectPicture,
                child: Text("Pick from Gallery"),
                color: Theme.of(context).accentColor,
                splashColor: Colors.white,
                elevation: 5,
                shape: StadiumBorder(),
              ),
            ),
            doneButton(),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return imageDislpay();
  }
}
