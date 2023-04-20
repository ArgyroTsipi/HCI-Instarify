//rating page 
import 'package:flutter/material.dart';
import 'colors.dart' as color;
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

//import 'page5.dart';
import 'page9.dart';
import 'page11.dart';
// chosen template page -> figma page name:  Chosen Template
class Page11 extends StatefulWidget {
const Page11({Key? key}) : super(key: key);

  @override
  _Page11State createState() => _Page11State();
}




class _Page11State extends State<Page11> {
  @override
  Widget build(BuildContext context) {
    //return Scaffold(
      return SafeArea(
        child: Scaffold(
      
body: 



Container(
        width: double.infinity,
        padding: const EdgeInsets.only(top: 10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
  

IconButton(
          icon: const Icon(Icons.close),
          onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Page9()),
                );
          },
        ),
     

Container(
    margin: EdgeInsets.all(30),
    width: 100,
    height: 100,
    //color: Color.fromARGB(255, 240, 228, 247),
    child:  ClipRRect(
            borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20)),
            child: Container(
              color: Color.fromARGB(255, 240, 228, 247),
            ))
     ),


   
 RatingBar(
   initialRating: 3,
   direction: Axis.horizontal,
   allowHalfRating: true,
   itemCount: 5,
   ratingWidget: RatingWidget(
     full: Icon(Icons.star),
     half: Icon(Icons.star_half_outlined),
     empty: Icon(Icons.star_border_outlined),
   ),
   itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
   onRatingUpdate: (rating) {
     print(rating);
   },
),


   IconButton(
          icon: const Icon(Icons.star_border_purple500),
          //tooltip: 'Increase volume by 10',
          onPressed: () {
            //nothing rn
          },
        ),
        Text('Rate'),
        
      

  BottomNavigationBar(
          backgroundColor: color.AppColor.button_background,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.crop_original_rounded), //add_photo_alternate_outlined ),
            label: 'Library',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_a_photo_outlined),
            label: 'Camera',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Add to Favorites',
          ),
        ],
        //currentIndex: _selectedIndex,
        selectedItemColor: color.AppColor.button_text,
        // onTap: (){} Navigator.push(
        //           context,
        //           MaterialPageRoute(builder: (context) => Page9()),
        //         ); ,
      ),

  ]//children
       )
        



    ))
    );
  }
}