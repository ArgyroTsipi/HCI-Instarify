import 'package:flutter/material.dart';
import 'colors.dart' as color;
import 'profiling1.dart';
import 'db/database.dart';
import 'package:path/path.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          width: double.infinity,
          padding: const EdgeInsets.only(top: 138),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const Text(
                "Instarify",
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 36,
                  height: 1.00,
                ),
              ),
              const SizedBox(height: 188),
              MaterialButton(
                elevation: 188,
                height: 40,
                minWidth: 161,
                color: color.AppColor.button_background,
                textColor: color.AppColor.button_text,
                onPressed: () {
                 Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Profiling1()),
                  );
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100.0),
                ),
                child: const Text("Tap to get started"),
              )
            ],
          ),
        ),
      ),
    );
  }
}
/*
class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Welcome to my Homepage", style: TextStyle(fontSize: 20),),
              const SizedBox(height: 20,),
              MaterialButton(
                onPressed: () {
                  print("Button pressed!");
                },
                child: const Text("Press me!"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
*/

/*class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color.AppColor.dark_grey,
      body: Container(
        child: Column(children: [
          Row(
            children: [
              Text(
                "Instarify",
                style: TextStyle(
                    fontSize: 30,
                    color: color.AppColor.primary,
                    fontWeight: FontWeight.w700),
              )
            ],
          ),
        ]),
      ),
    );
  }
}
*/