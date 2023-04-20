import 'package:flutter/material.dart';
import 'colors.dart' as color;
import 'page6.dart';

class Page5 extends StatefulWidget {
  const Page5({super.key});

  @override
  _Page5State createState() => _Page5State();
}

class _Page5State extends State<Page5> {
  @override
  Widget build(BuildContext context) {
    final List<String> characteristics =
        ModalRoute.of(context)!.settings.arguments as List<String>;
    //  List<String> chars = characteristics;
    return Scaffold(
      //child: Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.only(top: 138),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text(
              "Thank you!",
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
                  MaterialPageRoute(
                    builder: (context) => Page6(),
                    settings: RouteSettings(
                      arguments: characteristics,
                    ),
                  ),
                );
              },
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100.0),
              ),
              child: const Text("Tap to continue"),
            )
          ],
        ),
      ),
      //  ),
    );
  }
}
