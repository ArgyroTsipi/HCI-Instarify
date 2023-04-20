import 'package:flutter/material.dart';
import 'colors.dart' as color;
import 'package:flutter/cupertino.dart';
import 'searchedTemplate.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({
    super.key,
    required this.fieldValue,
  });

  final ValueChanged<String> fieldValue;

  @override
  Widget build(BuildContext context) {
    return CupertinoSearchTextField(
      onChanged: (String value) {
        fieldValue('The text has changed to: $value');
      },
      onSubmitted: (String value) {
        fieldValue('Submitted text: $value');
      },
    );
  }
}

class Page8 extends StatefulWidget {
  const Page8({super.key});

  @override
  _Page8State createState() => _Page8State();
}

class _Page8State extends State<Page8> {
  String value = '';
  final _controller = TextEditingController();
  var query = '';

  @override
  Widget build(BuildContext context) {
    final List<String> characteristics =
        ModalRoute.of(context)!.settings.arguments as List<String>;
    return Scaffold(
      appBar: AppBar(backgroundColor:
                    Color.fromARGB(255, 222, 198, 226),
          // The search area here
          title: Container(
        width: double.infinity,
        height: 40,
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(5)),
        child: Center(
          child: TextField(
            controller: _controller,
            onChanged: (text) {
              value = text;
            },
            onSubmitted: (String value) {
              query = value;
              characteristics.add(query);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => searchedTemplate(),
                  settings: RouteSettings(
                    arguments: characteristics,
                  ),
                ), //
              );
            },
            decoration: InputDecoration(
                prefixIcon: const Icon(Icons.search),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    value = '';
                    _controller.clear();
                  },
                ),
                hintText: 'Search...',
                border: InputBorder.none),
          ),
        ),
      )),
    );
  }
}
