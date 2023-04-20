import 'package:flutter/material.dart';
import 'page7.dart';
import 'colors.dart' as color;
import 'page3.dart';
import 'page5.dart';

// profiling 3

class Page4 extends StatefulWidget {
  const Page4({super.key});

  @override
  _Page4State createState() => _Page4State();
}

class _Page4State extends State<Page4> {
  String dropdownvalue = 'blue';
  var items = ['blue', 'green', 'red', 'magenta', 'yellow', 'black'];
  var fillers = [
    Color.fromARGB(255, 58, 26, 216),
    Color.fromARGB(255, 37, 196, 40),
    Color.fromARGB(255, 223, 18, 18),
    Color.fromARGB(255, 250, 40, 190),
    Color.fromARGB(255, 240, 236, 10),
    Color.fromARGB(255, 0, 0, 0)
  ];
  Color fill = Color.fromARGB(255, 58, 26, 216);
  @override
  //dropdown menu 1
  Widget build(BuildContext context) {
    final String aesth = ModalRoute.of(context)!.settings.arguments as String;
    List<String> characteristics = ['1', '2', '3'];
    characteristics[0] = aesth;
    characteristics[1] = dropdownvalue;
    return Scaffold(
        // child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.only(top: 80),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  "What's your favorite color?",
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 28,
                    height: 1.00,
                  ),
                ),
                const SizedBox(height: 30),
                Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: 250,
                        child: DropdownButton(
                          value: dropdownvalue,
                          elevation: 188,
                          icon: const Icon(Icons.keyboard_arrow_down),
                          //alignment: Alignment.centerRight,
                          items: items.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Text(items),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropdownvalue = newValue!;
                              characteristics[1] = dropdownvalue;
                              if (newValue == 'blue') fill = fillers[0];
                              if (newValue == 'green') fill = fillers[1];
                              if (newValue == 'red') fill = fillers[2];
                              if (newValue == 'magenta') fill = fillers[3];
                              if (newValue == 'yellow') fill = fillers[4];
                              if (newValue == 'black') fill = fillers[5];
                            });
                          },
                          //height: 40,
                          // minWidth: 161,
                          // color: color.AppColor.button_background,
                          // textColor: color.AppColor.button_text,
                        ),
                      )
                    ]),
                const SizedBox(height: 30),
                Icon(
                  Icons.star,
                  size: 350,
                  color: fill,
                  shadows: <Shadow>[
                    Shadow(color: Colors.black, blurRadius: 15.0)
                  ],
                ),
                const SizedBox(height: 130),
                LinearProgressIndicator(
                  value: 0.9,
                  color: color.AppColor.button_text,
                  backgroundColor: color.AppColor.button_background,
                ),
                const SizedBox(height: 30),
                Row(children: <Widget>[
                  Expanded(
                    child: Center(
                      child: MaterialButton(
                        elevation: 188,
                        height: 40,
                        minWidth: 80,
                        color: color.AppColor.backb,
                        textColor: color.AppColor.button_text,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Page3(),
                                settings:
                                    RouteSettings(arguments: characteristics)),
                          );
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100.0),
                        ),
                        child: const Text("Back"),
                      ),
                    ),
                  ),

                  Expanded(
                    child: Center(
                      child: MaterialButton(
                        elevation: 188,
                        height: 40,
                        minWidth: 80,
                        color: color.AppColor.button_background,
                        textColor: color.AppColor.button_text,
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Page5(),
                              settings: RouteSettings(
                                arguments: characteristics,
                              ),
                            ), //
                          );
                        },
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(100.0),
                        ),
                        child: const Text("Next"),
                      ),
                    ),
                  ),
                  //   const SizedBox(width: 150),

                  //mainAxisAlignment: ,
                  //children: <Widget>[
                  //const SizedBox(width: 400),
                ])
              ],
            ),
          ),
          //)
        ));
  }
}
