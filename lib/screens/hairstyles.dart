import 'package:flutter/material.dart';

class HairstylesLoader extends StatefulWidget {
  @override
  _HairstylesLoaderState createState() => _HairstylesLoaderState();
}

class _HairstylesLoaderState extends State<HairstylesLoader> {

  void goToNextPage() async{
    await new Future.delayed(const Duration(milliseconds: 1500));
    Navigator.pushReplacement(context, new MaterialPageRoute(builder: (__) => HairStylesPage()));
  }

  @override
  void initState(){
    super.initState();
    goToNextPage();
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}


class HairStylesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Recommended Hairstyles"),
      ),
      body: GridView.count(
        crossAxisCount: 2,
        children: List.generate(16, (index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.blue,
              ),
              child: Center(
                child: Text(
                  '${index + 1}',
                  style: TextStyle(color: Colors.white, fontSize: 22.0),
                ),
              ),
            ),
          );
        }),
      ),
    );
  }
}
