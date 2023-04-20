import 'package:flutter/material.dart';
import 'colors.dart' as color;
//import 'page5.dart';
import 'page7.dart';

// starting frame 1 (Welcome back i'm feeling)

class Page6 extends StatefulWidget {
  const Page6({super.key});

  @override
  _Page6State createState() => _Page6State();
}

class _Page6State extends State<Page6> {
  @override
  Widget build(BuildContext context) {
    final List<String> characteristics =
        ModalRoute.of(context)!.settings.arguments as List<String>;
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
                "Welcome!",
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'Montserrat',
                  fontSize: 36,
                  height: 1.00,
                ),
              ),
              const SizedBox(height: 188),
              const Text(
                "I'm feeling...             ",
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 22,
                    height: 1.00,
                    color: Color.fromARGB(255, 177, 157, 167),
                    fontStyle: FontStyle.italic),
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    IconButton(
                        iconSize: 34,
                        icon: Icon(Icons.sentiment_very_satisfied_rounded),
                        color: Color.fromARGB(255, 219, 105, 162),
                        onPressed: () {
                          characteristics[2] = 'cheerful';
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Page7(),
                              settings: RouteSettings(
                                arguments: characteristics,
                              ),
                            ),
                          );
                        }),
                    IconButton(
                        iconSize: 34,
                        icon: Icon(Icons.sentiment_dissatisfied_outlined),
                        color: Color.fromARGB(255, 219, 105, 162),
                        onPressed: () {
                          characteristics[2] = 'sad';
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Page7(),
                              settings: RouteSettings(
                                arguments: characteristics,
                              ),
                            ),
                          );
                        }),
                    IconButton(
                        iconSize: 34,
                        icon: Icon(Icons.sentiment_neutral_outlined),
                        color: Color.fromARGB(255, 219, 105, 162),
                        onPressed: () {
                          characteristics[2] = 'bored';
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Page7(),
                              settings: RouteSettings(
                                arguments: characteristics,
                              ),
                            ),
                          );
                        }),
                    IconButton(
                        iconSize: 34,
                        icon: Icon(Icons.sentiment_satisfied_alt_outlined),
                        color: Color.fromARGB(255, 219, 105, 162),
                        onPressed: () {
                          characteristics[2] = 'happy';
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Page7(),
                              settings: RouteSettings(
                                arguments: characteristics,
                              ),
                            ),
                          );
                        }),
                  ]),
            ],
          ),
        ),
      ),
    );
  }
}
