// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:instarify/page7.dart';
import 'colors.dart' as color;
//import 'page5.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'page9.dart';
import 'page8.dart';
import 'page11.dart';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// chosen template page -> figma page name:  Chosen Template

class searchedTemplate extends StatefulWidget {
  const searchedTemplate({Key? key}) : super(key: key);

  @override
  _searchedTemplateState createState() => _searchedTemplateState();
}

class _searchedTemplateState extends State<searchedTemplate> {
  Map<String, dynamic> data = Map();
  var img;
  List results = [];
  List<String> imgUrl = [];
  bool showing = false;
  getData(String query) async {
    http.Response response = await http.get(Uri.parse(
        'https://api.unsplash.com/search/photos/?query=${query}&client_id=5WDMHgFyClM9RpMN-ylzA481-kFXM-rPozYBM64pWAQ&per_page=1'));
    data = json.decode(response.body);
    results = data["results"];
    _assign();
    setState(() {
      showing = true;
    });
  }

  _assign() {
    for (var i = 0; i < results.length; i++) {
      imgUrl.add(results.elementAt(i)['urls']['small']);
    }
  }

  XFile? image;
  double _currentSliderValue = 20;
  double _imgWidth = 250, _imgHeight = 600, _opacity = 1.0;
  final ImagePicker picker = ImagePicker();
  Color pickerColor = Color.fromARGB(255, 236, 192, 207);
  Color currentColor = Color.fromARGB(255, 236, 192, 207);
  void changeColor(Color color) {
    setState(() => pickerColor = color);
  }

  var pos = 1;
  var faved = false;
  var idx = 0;
  //we can upload image from camera or from gallery based on parameter
  Future getImage(ImageSource media) async {
    var img = await picker.pickImage(source: media);

    setState(() {
      image = img;
    });
  }

  List<Widget> list = [];

  Offset _offset = const Offset(26, 30);
  @override
  Widget build(BuildContext context) {
    final List<String> characteristics =
        ModalRoute.of(context)!.settings.arguments as List<String>;
    getData(characteristics[characteristics.length - 1]);
    if (!showing)
      return Scaffold();
    else {
      return SafeArea(
        child: Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            currentIndex: idx,
            backgroundColor: color.AppColor.button_background,
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.crop_original_rounded),
                label: 'Library',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.add_a_photo_outlined),
                label: 'Camera',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.favorite),
                activeIcon: Icon(Icons.favorite),
                label: 'Add to Favorites',
              ),
            ],
            selectedItemColor: color.AppColor.button_text,
            onTap: (value) {
              if (value == 0) {
                //Navigator.pop(context);
                getImage(ImageSource.gallery);
              }
              if (value == 1) {
                //Navigator.pop(context);
                getImage(ImageSource.camera);
              }
              if (value == 2) {
                pos = 2;
                characteristics[characteristics.length - 1] = imgUrl[0];
                !faved
                    ? {
                        faved = true,
                        characteristics.add('f'),
                        showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                                  title: const Text('Added to favourites!'),
                                  content: const Text(''),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(context, 'OK'),
                                      child: const Text('OK'),
                                    ),
                                  ],
                                ))
                      }
                    : {
                        faved = false,
                        characteristics.removeLast(),
                        showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                                  title: const Text('Removed from favourites!'),
                                  content: const Text(''),
                                  actions: <Widget>[
                                    TextButton(
                                      onPressed: () =>
                                          Navigator.pop(context, 'OK'),
                                      child: const Text('OK'),
                                    ),
                                  ],
                                ))
                      };
              }
            },
          ),
          body: Stack(children: [
            Column(children: [
              const SizedBox(height: 20, width: 30),
              const SizedBox(width: 30),
              Row(),
              Container(
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 219, 219, 219),
                    shape: BoxShape.circle,
                  ),
                  child: IconButton(
                    constraints: BoxConstraints(maxHeight: 28),
                    iconSize: 14,
                    icon: const Icon(Icons.close),
                    onPressed: () {
                      characteristics[characteristics.length - pos] = imgUrl[0];
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Page7(),
                          settings: RouteSettings(
                            arguments: characteristics,
                          ),
                        ),
                      );
                    },
                  )),
            ]),
            Positioned(
                bottom: 10,
                child: Container(
                    margin: EdgeInsets.all(30),
                    width: 300,
                    height: 650,
                    //color: Color.fromARGB(255, 240, 228, 247),
                    child: ClipRRect(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(20),
                            bottomRight: Radius.circular(20),
                            topLeft: Radius.circular(20),
                            topRight: Radius.circular(20)),
                        child: Container(
                            color: currentColor,
                            child: Stack(
                                alignment: AlignmentDirectional.center,
                                children: [
                                  Positioned.fill(
                                      child: Image(
                                          image: NetworkImage(imgUrl[0]),
                                          width: double.infinity,
                                          fit: BoxFit.fitWidth)),
                                  /*TextField(
                              textAlign: TextAlign.center,
                              decoration: InputDecoration(
                                focusColor: color.AppColor.backb,
                                fillColor: color.AppColor.backb,
                                //border: OutlineInputBorder(),
                                labelText: '',
                              ),
                            ),*/
                                  image != null
                                      ? LayoutBuilder(
                                          builder: (context, constraints) {
                                          return Stack(children: [
                                            Positioned(
                                                left: _offset.dx,
                                                top: _offset.dy,
                                                child: LongPressDraggable(
                                                  feedback: Image.file(
                                                    //to show image, you type like this.
                                                    File(image!.path),
                                                    fit: BoxFit.cover,
                                                    width: _imgWidth,
                                                    height: _imgHeight,
                                                    color: Color.fromARGB(
                                                        255, 236, 192, 207),
                                                    colorBlendMode:
                                                        BlendMode.colorBurn,
                                                  ),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                    child: Image.file(
                                                      //to show image, you type like this.
                                                      File(image!.path),
                                                      fit: BoxFit.cover,
                                                      color: Colors.white
                                                          .withOpacity(
                                                              _opacity),
                                                      colorBlendMode:
                                                          BlendMode.modulate,
                                                      width: _imgWidth,
                                                      height: _imgHeight,
                                                    ),
                                                  ),
                                                  onDragEnd: (details) {
                                                    setState(() {
                                                      double adjustment =
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .height -
                                                              constraints
                                                                  .maxHeight;
                                                      _offset = Offset(
                                                          details.offset.dx -
                                                              30,
                                                          details.offset.dy -
                                                              adjustment +
                                                              100);
                                                    });
                                                  },
                                                )),
                                          ]);
                                        })
                                      : Text(
                                          "Insert your photo",
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontStyle: FontStyle.italic,
                                            color: Color.fromARGB(
                                                    255, 218, 211, 211)
                                                ?.withOpacity(0.8),
                                            fontFamily: "Montserrat",
                                          ),
                                        ),
                                ]))))),

            image != null
                ? Positioned(
                    //height: 60,
                    right: 30,
                    child: Align(
                      alignment: Alignment.topRight,
                      child: RotatedBox(
                        quarterTurns: 1,
                        child: Slider(
                          label: 'Size',
                          activeColor: color.AppColor.button_background,
                          inactiveColor: color.AppColor.button_text,
                          thumbColor: color.AppColor.button_text,
                          value: _currentSliderValue,
                          max: 100,
                          divisions: 10,
                          // label: _currentSliderValue.round().toString(),
                          onChanged: (double value) {
                            setState(() {
                              _currentSliderValue = value;
                              _imgHeight = 550 + value * 0.2;
                              _imgWidth = 250 + value * 0.2;
                            });
                          },
                        ),
                      ),
                    ))
                : Align(),
            const SizedBox(width: 2990),
            image != null
                ? Positioned(
                    right: 0,
                    child: Align(
                      alignment: Alignment.topRight,
                      child: RotatedBox(
                        quarterTurns: 1,
                        child: Slider(
                          label: 'Opacity: ${_opacity.toString()}',
                          activeColor: color.AppColor.button_background,
                          inactiveColor: color.AppColor.button_text,
                          thumbColor: color.AppColor.button_text,
                          value: _opacity,
                          max: 1.0,
                          divisions: 10,
                          // label: _currentSliderValue.round().toString(),
                          onChanged: (double value) {
                            setState(() {
                              _opacity = value;
                            });
                          },
                        ),
                      ),
                    ))
                : Align(),
            Positioned(
              right: 10,
              bottom: 20,
              child: RatingBar.builder(
                initialRating: 3,
                minRating: 1,
                direction: Axis.vertical,
                allowHalfRating: true,
                itemCount: 5,
                itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                itemBuilder: (context, _) => Icon(
                  Icons.star,
                  color: Colors.amber,
                ),
                onRatingUpdate: (rating) {
                  print(rating);
                },
              ),
            ),
            Positioned(
                right: 10,
                bottom: 230,
                child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(color: color.AppColor.backb, width: 4),
                      color: color.AppColor.button_background,
                      shape: BoxShape.circle,
                    ),
                    child: IconButton(
                        icon: Icon(Icons.colorize),
                        color: color.AppColor.button_text,
                        highlightColor: Colors.transparent,
                        onPressed: () => showDialog(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                                    title: const Text('Pick a color!'),
                                    content: SingleChildScrollView(
                                        child: ColorPicker(
                                      pickerColor: pickerColor,
                                      onColorChanged: changeColor,
                                    )),
                                    actions: <Widget>[
                                      ElevatedButton(
                                        child: const Text('Got it'),
                                        onPressed: () {
                                          setState(
                                              () => currentColor = pickerColor);
                                          Navigator.pop(context);
                                        },
                                      ),
                                    ])))))

            /*Container(
    padding: EdgeInsets.all(20.0),
    child: new ListView.builder(itemBuilder: (context, index){
    Widget widget = list.elementAt(index);
    return widget;
  }, itemCount: list.length,),),
  IconButton(
   onPressed: (){
    list.add(new TextField(decoration: InputDecoration(hintText: 'Hint ${list.length+1}'),));
    setState(() {});
  }, icon: new Icon(Icons.add),),*/

            //  Text('Rate'),
          ]),
        ),
      );
    }
  }
}
