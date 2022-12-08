import 'package:flutter/material.dart';
import '../pages/home_page.dart';
import '../pages/search_page.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      resizeToAvoidBottomInset: false,
      // bottomNavigationBar: getFooter(),
      body: getBody(),
    );
  }

  Widget getBody() {
    return IndexedStack(
      children: [
        HomePage(),
        SearchPage(),
      ],
    );
  }

  // Widget getFooter() {
  //   return Container(
  //     height: 80,
  //     decoration: BoxDecoration(color: Colors.black),
  //     child: Row(
  //       mainAxisAlignment: MainAxisAlignment.spaceAround,
  //       children: [
  //         GestureDetector(
  //           onTap: () {
  //             setState(() {
  //               Navigator.push(
  //                   context,
  //                   MaterialPageRoute(
  //                     builder: (_) => HomePage(),
  //                   ));
  //             });
  //           },
  //           child: Column(
  //             children: [
  //               Icon(
  //                 Icons.home,
  //                 color: Colors.white,
  //               ),
  //               SizedBox(
  //                 height: 5,
  //               ),
  //               Text(
  //                 "Home",
  //                 style: TextStyle(
  //                   color: Colors.white,
  //                   fontSize: 15,
  //                 ),
  //               )
  //             ],
  //           ),
  //         ),
  //         GestureDetector(
  //           onTap: () {
  //             setState(() {
  //               Navigator.push(
  //                   context,
  //                   MaterialPageRoute(
  //                     builder: (_) => SearchPage(),
  //                   ));
  //             });
  //           },
  //           child: Column(
  //             children: [
  //               Icon(
  //                 Icons.search,
  //                 color: Colors.white,
  //               ),
  //               SizedBox(
  //                 height: 5,
  //               ),
  //               Text(
  //                 "Search",
  //                 style: TextStyle(
  //                   color: Colors.white,
  //                   fontSize: 15,
  //                 ),
  //               )
  //             ],
  //           ),
  //         )
  //       ],
  //     ),
  //   );
  // }
}
