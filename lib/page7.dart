// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'colors.dart' as color;
//import 'page5.dart';
import 'page8.dart';
import 'page9.dart';
import 'page10.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'uploadTemplate.dart';

//setState(() {
//showing = false;
//});
class Page7 extends StatefulWidget {
  const Page7({Key? key}) : super(key: key);

  @override
  _Page7State createState() => _Page7State();
}

enum SampleItem { itemOne, itemTwo }

//SampleItem? selectedMenu;

class _Page7State extends State<Page7> {
  Map<String, dynamic> data = Map();
  Map<String, dynamic> dataEmotion = Map();
  var img;
  var upload = 3;
  List results = [];
  List resultsEmotion = [];
  List<String> imgUrl = [];
  List<String> imgUrlEmotion = [];
  bool showing = false;
  getData(List<String> characteristics) async {
    http.Response response = await http.get(Uri.parse(
        'https://api.unsplash.com/search/photos/?query=${characteristics[0]}&client_id=5WDMHgFyClM9RpMN-ylzA481-kFXM-rPozYBM64pWAQ&color=${characteristics[1]}&per_page=7'));
    data = json.decode(response.body);
    results = data["results"];
    _assign();
    /*setState(() {
      showing = false;
    });*/
  }

  getDataEmotion(List<String> characteristics) async {
    http.Response response = await http.get(Uri.parse(
        'https://api.unsplash.com/search/photos/?query=${characteristics[2]}+wallpaper&client_id=5WDMHgFyClM9RpMN-ylzA481-kFXM-rPozYBM64pWAQ&per_page=6'));
    dataEmotion = json.decode(response.body);
    resultsEmotion = dataEmotion["results"];
    _assignEmotion();
    setState(() {
      showing = true;
    });
  }

  _assign() {
    for (var i = 0; i < results.length; i++) {
      imgUrl.add(results.elementAt(i)['urls']['small']);
    }
  }

  _assignEmotion() {
    for (var i = 0; i < resultsEmotion.length; i++) {
      imgUrlEmotion.add(resultsEmotion.elementAt(i)['urls']['small']);
    }
  }

  @override
  Widget build(BuildContext context) {
    SampleItem? selectedMenu;
    final List<String> characteristics =
        ModalRoute.of(context)!.settings.arguments as List<String>;

    getData(characteristics);
    getDataEmotion(characteristics);
    //return Scaffold(
    if (!showing)
      return Scaffold();
    else {
      return SafeArea(
          child: Scaffold(
              appBar: AppBar(
                automaticallyImplyLeading: false,
                title: const Text('Instarify'),
                backgroundColor:
                    Color.fromARGB(255, 222, 198, 226), //rgb(255,251,254)
                //children: [
                actions: [
                  PopupMenuButton<int>(
                    splashRadius: 20,
                    icon: Icon(Icons.add_box),
                    color: Color.fromARGB(255, 244, 240, 245),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(8.0),
                      bottomRight: Radius.circular(8.0),
                      topLeft: Radius.circular(8.0),
                      topRight: Radius.circular(8.0),
                    )),
                    // Callback that sets the selected popup menu item.

                    itemBuilder: (context) => [
                      PopupMenuItem(
                        value: 0,
                        child: Text('Upload Template',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        onTap: () =>
                            WidgetsBinding.instance.addPostFrameCallback((_) {
                          setState(() {
                            showing = false;
                          });
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (BuildContext context) {
                                return const uploadTemplate();
                              },
                              settings: RouteSettings(
                                arguments: characteristics,
                              ),
                            ),
                          );
                        }),
                      ),
                      PopupMenuItem(
                        // ignore: sort_child_properties_last
                        child: Text('Cancel'),
                        value: 1,
                      ),
                      // other items...
                    ],
                  ),
                  // Navigate to the Search Screen
                  IconButton(
                      onPressed: () => {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) => const Page8(),
                                  settings: RouteSettings(
                                    arguments: characteristics,
                                  )),
                            )
                          },
                      icon: const Icon(Icons.search))
                ],
              ),
              body: SingleChildScrollView(
                  child: Container(
                      width: double.infinity,
                      padding: const EdgeInsets.only(top: 50),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            //   buildFloatingSearchBar(),

                            const Text(
                              "   Suggested Templates                                                                                                                                                                                                                                                        ",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 18,
                                height: 1.00,
                              ),
                            ),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Container(
                                  margin: EdgeInsets.all(30),
                                  width: 1600,
                                  height: 150,
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(20),
                                          bottomRight: Radius.circular(20),
                                          topLeft: Radius.circular(20),
                                          topRight: Radius.circular(20)),
                                      child: Container(
                                          color: Color.fromARGB(
                                              255, 240, 228, 247),
                                          child: Row(children: [
                                            InkWell(
                                              onTap: () {
                                                img = imgUrl.elementAt(0);
                                                characteristics.add(img);
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        Page10(),
                                                    settings: RouteSettings(
                                                      arguments:
                                                          characteristics,
                                                    ),
                                                  ),
                                                );
                                              },
                                              child: Image.network(
                                                imgUrl.elementAt(0),
                                                loadingBuilder:
                                                    (BuildContext context,
                                                        Widget child,
                                                        ImageChunkEvent?
                                                            loadingProgress) {
                                                  if (showing) {
                                                    return child;
                                                  }
                                                  return Center(
                                                    child:
                                                        CircularProgressIndicator(
                                                      value: showing == false
                                                          ? null
                                                          : null,
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                            InkWell(
                                                onTap: () {
                                                  img = imgUrl.elementAt(1);
                                                  characteristics.add(img);
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          Page10(),
                                                      settings: RouteSettings(
                                                        arguments:
                                                            characteristics,
                                                      ),
                                                    ),
                                                  );
                                                },
                                                child: Image(
                                                  image: NetworkImage(
                                                      imgUrl.elementAt(1)),
                                                )),
                                            InkWell(
                                                onTap: () {
                                                  img = imgUrl.elementAt(2);
                                                  characteristics.add(img);
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          Page10(),
                                                      settings: RouteSettings(
                                                        arguments:
                                                            characteristics,
                                                      ),
                                                    ),
                                                  );
                                                },
                                                child: Image(
                                                  image: NetworkImage(
                                                      imgUrl.elementAt(2)),
                                                )),
                                            for (int i = 3; i < 6; i++)
                                              InkWell(
                                                  onTap: () {
                                                    img = imgUrl.elementAt(i);
                                                    characteristics.add(img);
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            Page10(),
                                                        settings: RouteSettings(
                                                          arguments:
                                                              characteristics,
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                  child: Image(
                                                    image: NetworkImage(
                                                        imgUrl.elementAt(i)),
                                                  )),
                                          ])))),
                            ),
                            const Text(
                              "   Express your mood                                                                                                                                                                                                                                                               ",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 18,
                                height: 1.00,
                              ),
                            ),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Container(
                                  margin: EdgeInsets.all(30),
                                  width: 2200,
                                  height: 150,
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.only(
                                          bottomLeft: Radius.circular(20),
                                          bottomRight: Radius.circular(20),
                                          topLeft: Radius.circular(20),
                                          topRight: Radius.circular(20)),
                                      child: Container(
                                          color: Color.fromARGB(
                                              255, 240, 228, 247),
                                          child: Row(children: [
                                            InkWell(
                                              onTap: () {
                                                img =
                                                    imgUrlEmotion.elementAt(0);
                                                characteristics.add(img);
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        Page10(),
                                                    settings: RouteSettings(
                                                      arguments:
                                                          characteristics,
                                                    ),
                                                  ),
                                                );
                                              },
                                              child: Image.network(
                                                imgUrlEmotion.elementAt(0),
                                                loadingBuilder:
                                                    (BuildContext context,
                                                        Widget child,
                                                        ImageChunkEvent?
                                                            loadingProgress) {
                                                  if (showing) {
                                                    return child;
                                                  }
                                                  return Center(
                                                    child:
                                                        CircularProgressIndicator(
                                                      value: showing == false
                                                          ? null
                                                          : null,
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                            InkWell(
                                                onTap: () {
                                                  img = imgUrlEmotion
                                                      .elementAt(1);
                                                  characteristics.add(img);
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          Page10(),
                                                      settings: RouteSettings(
                                                        arguments:
                                                            characteristics,
                                                      ),
                                                    ),
                                                  );
                                                },
                                                child: Image(
                                                  image: NetworkImage(
                                                      imgUrlEmotion
                                                          .elementAt(1)),
                                                )),
                                            InkWell(
                                                onTap: () {
                                                  img = imgUrlEmotion
                                                      .elementAt(2);
                                                  characteristics.add(img);
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          Page10(),
                                                      settings: RouteSettings(
                                                        arguments:
                                                            characteristics,
                                                      ),
                                                    ),
                                                  );
                                                },
                                                child: Image(
                                                  image: NetworkImage(
                                                      imgUrlEmotion
                                                          .elementAt(2)),
                                                )),
                                            for (int i = 3; i < 5; i++)
                                              InkWell(
                                                  onTap: () {
                                                    img = imgUrlEmotion
                                                        .elementAt(i);
                                                    characteristics.add(img);
                                                    Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            Page10(),
                                                        settings: RouteSettings(
                                                          arguments:
                                                              characteristics,
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                  child: Image(
                                                    image: NetworkImage(
                                                        imgUrlEmotion
                                                            .elementAt(i)),
                                                  )),
                                          ])))),
                            ),

                            const Text(
                              "   Recently Used                                                                                                                                                                                                                                                                         ",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 18,
                                height: 1.00,
                              ),
                            ),

                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Container(
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
                                    child: Row(children: [
                                      if (characteristics.length >= 3)
                                        for (var i = characteristics.length - 1;
                                            i > 2;
                                            i--)
                                          if (characteristics[i] != 'f')
                                            InkWell(
                                              onTap: () {
                                                img = characteristics[i];
                                                characteristics.add(img);
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        Page10(),
                                                    settings: RouteSettings(
                                                      arguments:
                                                          characteristics,
                                                    ),
                                                  ),
                                                );
                                              },
                                              child: Image(
                                                image: NetworkImage(
                                                    characteristics[i]),
                                              ),
                                            ),
                                    ]),
                                  ),
                                ),
                              ),
                            ),

                            const Text(
                              "   Favourite Templates                                                                                                                                                                                                                                                            ",
                              overflow: TextOverflow.ellipsis,
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                fontFamily: 'Montserrat',
                                fontSize: 18,
                                height: 1.00,
                              ),
                            ),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Container(
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
                                    child: Row(children: [
                                      if (characteristics.length >= 3)
                                        for (var i = 3;
                                            i < characteristics.length - 1;
                                            i++)
                                          if (characteristics[i] != 'f' &&
                                              characteristics[i + 1] == 'f')
                                            InkWell(
                                              onTap: () {
                                                img = characteristics[i];
                                                characteristics.add(img);
                                                Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        Page10(),
                                                    settings: RouteSettings(
                                                      arguments:
                                                          characteristics,
                                                    ),
                                                  ),
                                                );
                                              },
                                              child: Image(
                                                image: NetworkImage(
                                                    characteristics[i]),
                                              ),
                                            ),
                                    ]),
                                  ),
                                ),
                              ),
                            ),
                          ])))));
    }
  }
}
