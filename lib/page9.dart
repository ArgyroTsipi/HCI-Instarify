import 'package:flutter/material.dart';
import 'colors.dart' as color;
//import 'page5.dart';
import 'page8.dart';
import 'page7.dart';

class Page9 extends StatefulWidget {
  const Page9({Key? key}) : super(key: key);

  @override
  _Page9State createState() => _Page9State();
}

class _Page9State extends State<Page9> {
  @override
  Widget build(BuildContext context) {
    //return Scaffold(
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              automaticallyImplyLeading: false,
              title: const Text('Instarify'),
              backgroundColor:
                  Color.fromARGB(255, 222, 198, 226), //rgb(255,251,254)
              actions: [
                // Navigate to the Search Screen
                IconButton(
                    onPressed: () => Navigator.of(context)
                        .push(MaterialPageRoute(builder: (_) => const Page8())),
                    icon: const Icon(Icons.search))
              ],
            ),
            body: Container(
                width: double.infinity,
                padding: const EdgeInsets.only(top: 50),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Text(
                        "Suggested Templates                                                                                                                                                                                                                                                        ",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 14,
                          height: 1.00,
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.all(30),
                          width: 1000,
                          height: 50,
                          child: ClipRRect(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(20),
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20)),
                              child: Container(
                                color: Color.fromARGB(255, 240, 228, 247),
                              ))),
                      const Text(
                        "Suggested Filters                                                                                                                                                                                                                                                                ",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 14,
                          height: 1.00,
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.all(30),
                          width: 1000,
                          height: 50,
                          child: ClipRRect(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(20),
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20)),
                              child: Container(
                                color: Color.fromARGB(255, 240, 228, 247),
                              ))),
                      const Text(
                        "Recently Used                                                                                                                                                                                                                                                                         ",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 14,
                          height: 1.00,
                        ),
                      ),
                      Container(
                          margin: EdgeInsets.all(30),
                          width: double.infinity,
                          height: 60,
                          // color: Color.fromARGB(255, 240, 228, 247),
                          child: ClipRRect(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(20),
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20)),
                              child: Container(
                                  color: Color.fromARGB(255, 240, 228, 247),
                                  child: MaterialButton(
                                    elevation: 188,
                                    height: 50,
                                    minWidth: 80,
                                    color: color.AppColor.button_background,
                                    textColor: color.AppColor.button_text,
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Page7()),
                                      );
                                    },
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(70.0),
                                    ),
                                    child: const Text("Upload Template"),
                                  )))),
                      Container(
                          margin: EdgeInsets.all(30),
                          width: double.infinity,
                          height: 60,
                          //color: Color.fromARGB(255, 240, 228, 247),
                          child: ClipRRect(
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(20),
                                  bottomRight: Radius.circular(20),
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20)),
                              child: Container(
                                  color: Color.fromARGB(255, 240, 228, 247),
                                  child: MaterialButton(
                                    elevation: 188,
                                    height: 50,
                                    minWidth: 80,
                                    color: color.AppColor.button_background,
                                    textColor: color.AppColor.button_text,
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => Page7()),
                                      );
                                    },
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(70.0),
                                    ),
                                    child: const Text("Cancel"),
                                  )))),
                    ] //children
                    ))));
  }
}
