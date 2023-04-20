import 'package:flutter/material.dart';
import 'page7.dart';
import 'profiling1.dart';
import 'colors.dart' as color;
import 'page4.dart';
import 'page12.dart';

// profiling2

class Page3 extends StatefulWidget {
  const Page3({super.key});

  @override
  _Page3State createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  var aesth;
  Color _favIconColor = Colors.white;

  @override
  Widget build(BuildContext context) {
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
                  "Which aesthetic best suits your vibe?",
                  textAlign: TextAlign.center,
                  overflow: TextOverflow.visible,
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 28,
                    height: 1.00,
                  ),
                ),
                const SizedBox(height: 30),
                Column(children: [
                  // const SizedBox(height: 1),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(children: [
                        IconButton(
                          iconSize: 50.0,
                          color: _favIconColor,
                          icon: Image.asset('assets/images/pastel.jpg'),
                          onPressed: () {
                            setState(() {
                              if (_favIconColor ==
                                  color.AppColor.button_background) {
                                _favIconColor = Colors.white;
                              } else {
                                _favIconColor =
                                    color.AppColor.button_background;
                              }
                            });
                            aesth = 'pastel';
                          },
                          //color: Color.fromARGB(255, 237, 223, 243),
                          highlightColor: color.AppColor.button_background,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              const Text(
                                "Pastel",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 12,
                                  height: 1.00,
                                ),
                              ),
                            ]),
                      ]),
                      Column(children: [
                        IconButton(
                          iconSize: 50.0,
                          icon: Image.asset('assets/images/retro.png'),
                          onPressed: () {
                            setState(() {
                              if (_favIconColor ==
                                  color.AppColor.button_background) {
                                _favIconColor = Colors.white;
                              } else {
                                _favIconColor =
                                    color.AppColor.button_background;
                              }
                            });
                            aesth = 'retro';
                          },
                          color: _favIconColor,
                          highlightColor: color.AppColor.button_background,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              const Text(
                                "Retro",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 12,
                                  height: 1.00,
                                ),
                              ),
                            ]),
                      ]),
                      const SizedBox(height: 120),
                      Column(children: [
                        IconButton(
                          iconSize: 50.0,
                          icon: Image.asset('assets/images/bandw.png'),
                          onPressed: () {
                            setState(() {
                              if (_favIconColor ==
                                  color.AppColor.button_background) {
                                _favIconColor = Colors.white;
                              } else {
                                _favIconColor =
                                    color.AppColor.button_background;
                              }
                            });
                            aesth = 'blackwhite';
                          },
                          color: _favIconColor,
                          highlightColor: color.AppColor.button_background,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              const Text(
                                "Black & White",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 12,
                                  height: 1.00,
                                ),
                              ),
                            ]),
                      ]),
                    ],
                  ),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Column(children: [
                      IconButton(
                        iconSize: 50.0,
                        icon: Image.asset('assets/images/cottage.png'),
                        onPressed: () {
                          setState(() {
                            if (_favIconColor ==
                                color.AppColor.button_background) {
                              _favIconColor = Colors.white;
                            } else {
                              _favIconColor = color.AppColor.button_background;
                            }
                          });
                          aesth = 'cottage';
                        },
                        color: _favIconColor,
                        highlightColor: color.AppColor.button_background,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: <Widget>[
                            const Text(
                              "Cottagecore  ",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 12,
                                height: 1.00,
                              ),
                            ),
                          ]),
                    ]),
                    const SizedBox(height: 80),
                    Column(children: [
                      IconButton(
                        iconSize: 50.0,
                        icon: Image.asset('assets/images/minimal.png'),
                        onPressed: () {
                          setState(() {
                            if (_favIconColor ==
                                color.AppColor.button_background) {
                              _favIconColor = Colors.white;
                            } else {
                              _favIconColor = color.AppColor.button_background;
                            }
                          });
                          aesth = 'minimalism';
                        },
                        color: _favIconColor,
                        highlightColor: color.AppColor.button_background,
                      ),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            const Text(
                              "Minimalist  ",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 12,
                                height: 1.00,
                              ),
                            ),
                          ]),
                    ]),
                    const SizedBox(height: 80),
                    Column(
                      children: [
                        IconButton(
                          iconSize: 50.0,
                          icon: Image.asset('assets/images/cyber.png'),
                          onPressed: () {
                            setState(() {
                              if (_favIconColor ==
                                  color.AppColor.button_background) {
                                _favIconColor = Colors.white;
                              } else {
                                _favIconColor =
                                    color.AppColor.button_background;
                              }
                            });
                            aesth = 'cyberpunk';
                          },
                          color: _favIconColor,
                          highlightColor: color.AppColor.button_background,
                        ),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              const Text(
                                "Cyberpunk  ",
                                overflow: TextOverflow.ellipsis,
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontFamily: 'Montserrat',
                                  fontSize: 12,
                                  height: 1.00,
                                ),
                              ),
                            ]),
                      ],
                    ),
                  ]),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Column(children: [
                        IconButton(
                          iconSize: 50.0,
                          icon: Image.asset('assets/images/glam.png'),
                          onPressed: () {
                            setState(() {
                              if (_favIconColor ==
                                  color.AppColor.button_background) {
                                _favIconColor = Colors.white;
                              } else {
                                _favIconColor =
                                    color.AppColor.button_background;
                              }
                            });
                            aesth = 'glam';
                          },
                          color: _favIconColor,
                          highlightColor: color.AppColor.button_background,
                        ),
                        Row(children: <Widget>[
                          const Text(
                            "Glam ",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 12,
                              height: 1.00,
                            ),
                          ),
                        ]),
                      ]),
                      Column(children: [
                        IconButton(
                          iconSize: 50.0,
                          icon: Image.asset('assets/images/hipster.png'),
                          onPressed: () {
                            setState(() {
                              if (_favIconColor ==
                                  color.AppColor.button_background) {
                                _favIconColor = Colors.white;
                              } else {
                                _favIconColor =
                                    color.AppColor.button_background;
                              }
                            });
                            aesth = 'hipster';
                          },
                          color: _favIconColor,
                          highlightColor: color.AppColor.button_background,
                        ),
                        Row(children: <Widget>[
                          const Text(
                            "Hipster  ",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 12,
                              height: 1.00,
                            ),
                          ),
                        ]),
                      ]),
                      const SizedBox(height: 80),
                      Column(children: [
                        IconButton(
                          iconSize: 50.0,
                          icon: Image.asset('assets/images/corporate.png'),
                          onPressed: () {
                            setState(() {
                              if (_favIconColor ==
                                  color.AppColor.button_background) {
                                _favIconColor = Colors.white;
                              } else {
                                _favIconColor =
                                    color.AppColor.button_background;
                              }
                            });
                            aesth = 'corporate';
                          },
                          color: _favIconColor,
                          highlightColor: color.AppColor.button_background,
                        ),
                        Row(children: <Widget>[
                          const Text(
                            "Corporate",
                            overflow: TextOverflow.ellipsis,
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 12,
                              height: 1.00,
                            ),
                          ),
                        ]),
                      ]),
                    ],
                  ),
                  //const SizedBox(height: 210),
                ]),

                const SizedBox(height: 250), //400

                LinearProgressIndicator(
                  value: 0.6,
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
                                builder: (context) => Profiling1()),
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
                              builder: (context) => Page4(),
                              settings: RouteSettings(
                                arguments: aesth,
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
                //const SizedBox(width: 580),
              ],
            ),
          ),
          // ),
        ));
  }
}
