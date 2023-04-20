import 'package:flutter/material.dart';
import 'colors.dart' as color;
import 'page3.dart';
//import 'dbhelper.dart';
//import 'user.dart';
// import 'DATABASE222.dart';
// import 'package:sqflite/sqflite.dart';

class Profiling1 extends StatefulWidget {
  const Profiling1({super.key});

  @override
  _Profiling1State createState() => _Profiling1State();
}

class _Profiling1State extends State<Profiling1> {
  //Database? _database;
  // int? _userId = 1;
  // Future<void> _openDatabase() async {
  //   _database = await openDatabase('user.db',
  //       onCreate: (Database db, int version) async {
  //     await db.execute(
  //         'CREATE TABLE user (id INTEGER PRIMARY KEY, gender TEXT, age TEXT, aesthetic TEXT)');
  //   });
  // }

  @override
  void initState() {
    super.initState();
    // _openDatabase();
  }

  //final dbHelper = DatabaseHelper.instance;
  var value1, value2;
  String dropdownvalue = '>18';
  var items = ['>18', '18-25', '26-31', '31+'];
  String dropdownvalue2 = 'Male';
  var items2 = ['Male', 'Female', 'Other'];
  //final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  @override

  //dropdown menu 1
  Widget build(BuildContext context) {
    return Scaffold(
        //child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.only(top: 80),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Text(
                  "What's your age?",
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 28,
                    height: 1.00,
                  ),
                ),

                const SizedBox(height: 20),

                Container(
                  width: 250,
                  child: DropdownButton(
                    value: dropdownvalue,
                    elevation: 188,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items: items.map((String items) {
                      return DropdownMenuItem(
                        value: items,
                        child: Text(items),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownvalue = newValue!;
                      });
                      value1 = newValue;
                    },
                  ),
                ),

                const SizedBox(height: 180),

                //2nd dropdown
                const Text(
                  "What's your gender?",
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.left,
                  style: TextStyle(
                    fontFamily: 'Montserrat',
                    fontSize: 28,
                    height: 1.00,
                  ),
                ),

                const SizedBox(height: 20),

                Container(
                  width: 250,
                  child: DropdownButton(
                    value: dropdownvalue2,
                    elevation: 188,
                    //width: 200,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    items: items2.map((String items2) {
                      return DropdownMenuItem(
                        value: items2,
                        child: Text(items2),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownvalue2 = newValue!;
                      });
                    },
                  ),
                ),

                const SizedBox(height: 250), //300

                LinearProgressIndicator(
                  value: 0.3,
                  color: color.AppColor.button_text,
                  backgroundColor: color.AppColor.button_background,
                ),

                const SizedBox(height: 30),

                Row(
                  children: <Widget>[
                    const Spacer(),
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
                                builder: (context) => Page3(),
                                settings: RouteSettings(
                                    //arguments: aesth,
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
                  ],
                ),
              ],
            ),
          ),
          //)
        ));
  }
}
  /*void _update(id, age, gender, aesthetic, color) async {
    // row to update
    User user = User(id, age, gender, aesthetic, color);
    final rowsAffected = await dbHelper.update(user);
  }
}*/