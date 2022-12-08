import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:trailers_app/model/home_model.dart';
import 'package:trailers_app/pages/video_detail_page.dart';

import '../model/model.dart';
import '../model/search_json.dart';
import 'login_page.dart';
import 'search_page.dart';

final List<String> list = <String>['Movies', 'Tv Series'];

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  String MainImage = "${videos[0].thumbnail}";
  String MainUrl = "${videos[0].url}";
  String MainName = "${videos[0].name}";
  String MainStory = "${videos[0].story}";

  ScrollController _scrollController = ScrollController();

  void _scrollToTop() {
    _scrollController.animateTo(0,
        duration: const Duration(milliseconds: 60), curve: Curves.linear);
  }

  String dropdownValue = list.first;
  final storage = new FlutterSecureStorage();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.black,
      bottomNavigationBar: getFooter(),
      body: getBody(),
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(bottom: 10, top: 23),
      child: SingleChildScrollView(
          controller: _scrollController,
          child: Stack(
            children: [
              Container(
                width: size.height - 80,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: 540,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage("${MainImage}"),
                                fit: BoxFit.cover),
                          ),
                        ),
                        Container(
                          height: 540,
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Colors.black.withOpacity(0.45),
                                Colors.black.withOpacity(0.35),
                              ],
                              end: Alignment.topCenter,
                              begin: Alignment.bottomCenter,
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (_) => VideoDetailPage(
                                          videoUrl: "${MainUrl}",
                                          videoName: "${MainName}",
                                          videoImage: "${MainImage}",
                                          videoStory: "${MainStory}",
                                        )));
                          },
                          child: Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(4)),
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    right: 13, left: 8, top: 2, bottom: 2),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.play_arrow,
                                      color: Colors.black,
                                      size: 30,
                                    ),
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "Play",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            IconButton(
                              icon: Icon(
                                Icons.info_outline_rounded,
                                color: Colors.white,
                                size: 30,
                              ),
                              onPressed: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) {
                                      return Dialog(
                                        child: Container(
                                          color:
                                              Colors.black.withOpacity(0.975),
                                          width: 360,
                                          height: 360,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                left: 16, right: 16),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                SizedBox(
                                                  height: 10,
                                                ),
                                                Text(
                                                  "Story",
                                                  style: TextStyle(
                                                      color: Colors.red,
                                                      fontSize: 35,
                                                      fontWeight:
                                                          FontWeight.w900),
                                                ),
                                                SizedBox(
                                                  height: 15,
                                                ),
                                                Text(
                                                  "${MainStory}",
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 18,
                                                  ),
                                                ),
                                                SizedBox(
                                                  height: 15,
                                                ),
                                                IconButton(
                                                  icon: Icon(
                                                    Icons.open_in_new_off_sharp,
                                                    color: Colors.white,
                                                    size: 35,
                                                  ),
                                                  onPressed: (() {
                                                    Navigator.of(context,
                                                            rootNavigator: true)
                                                        .pop();
                                                  }),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      );
                                    });
                              },
                            ),
                            Text(
                              "Info",
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white,
                                  fontSize: 17),
                            )
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: Text(
                            "Fantasy",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Row(
                              children: List.generate(fantasy.length, (index) {
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      MainImage =
                                          "${fantasy[index]["thumbnail"]}";
                                      MainName = "${fantasy[index]["name"]}";
                                      MainUrl = "${fantasy[index]["url"]}";
                                      MainStory = "${fantasy[index]["story"]}";
                                      _scrollToTop();
                                    });
                                  },
                                  child: Container(
                                    margin:
                                        EdgeInsets.only(right: 10, bottom: 15),
                                    width: 140,
                                    height: 200,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                fantasy[index]["thumbnail"]),
                                            fit: BoxFit.cover),
                                        borderRadius: BorderRadius.circular(6)),
                                  ),
                                );
                              }),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: Text(
                            "Action",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Row(
                              children: List.generate(action.length, (index) {
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      MainImage =
                                          "${action[index]["thumbnail"]}";
                                      MainName = "${action[index]["name"]}";
                                      MainUrl = "${action[index]["url"]}";
                                      MainStory = "${action[index]["story"]}";
                                      _scrollToTop();
                                    });
                                  },
                                  child: Container(
                                    margin:
                                        EdgeInsets.only(right: 10, bottom: 15),
                                    width: 140,
                                    height: 200,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                action[index]["thumbnail"]),
                                            fit: BoxFit.cover),
                                        borderRadius: BorderRadius.circular(6)),
                                  ),
                                );
                              }),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: Text(
                            "Epic",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Row(
                              children: List.generate(epic.length, (index) {
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      MainImage = "${epic[index]["thumbnail"]}";
                                      MainName = "${epic[index]["name"]}";
                                      MainUrl = "${epic[index]["url"]}";
                                      MainStory = "${epic[index]["story"]}";
                                      _scrollToTop();
                                    });
                                  },
                                  child: Container(
                                    margin:
                                        EdgeInsets.only(right: 10, bottom: 15),
                                    width: 140,
                                    height: 200,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                epic[index]["thumbnail"]),
                                            fit: BoxFit.cover),
                                        borderRadius: BorderRadius.circular(6)),
                                  ),
                                );
                              }),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: Text(
                            "Horror",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 8,
                        ),
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Row(
                              children: List.generate(horror.length, (index) {
                                return GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      MainImage =
                                          "${horror[index]["thumbnail"]}";
                                      MainName = "${horror[index]["name"]}";
                                      MainUrl = "${horror[index]["url"]}";
                                      MainStory = "${horror[index]["story"]}";
                                      _scrollToTop();
                                    });
                                  },
                                  child: Container(
                                    margin:
                                        EdgeInsets.only(right: 10, bottom: 15),
                                    width: 200,
                                    height: 300,
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                horror[index]["thumbnail"]),
                                            fit: BoxFit.cover),
                                        borderRadius: BorderRadius.circular(6)),
                                  ),
                                );
                              }),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              Container(
                child: SafeArea(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 1,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            "${dropdownValue}",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          Row(
                            children: [
                              DropdownButton(
                                elevation: 8,
                                dropdownColor: Colors.black.withOpacity(0.1),
                                icon: Icon(
                                  Icons.keyboard_arrow_down,
                                  color: Colors.white,
                                  size: 25,
                                ),
                                hint: Text(
                                  "Categories",
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                                onChanged: (String? value) {
                                  setState(() {
                                    dropdownValue = value!;
                                  });
                                },
                                items: list.map<DropdownMenuItem<String>>(
                                    (String value) {
                                  return DropdownMenuItem<String>(
                                    alignment: AlignmentDirectional.bottomEnd,
                                    value: value,
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: Text(
                                        value,
                                        style: TextStyle(
                                          decorationColor: Colors.black,
                                          fontSize: 17,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ),
                              SizedBox(
                                width: 3,
                              ),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ],
          )),
    );
  }

  Widget getFooter() {
    return Container(
      height: 80,
      decoration: BoxDecoration(color: Colors.black),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          GestureDetector(
            onTap: () async {
              FirebaseAuth.instance.signOut();
              await storage.delete(key: "uid").then((value) {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (_) => LoginPage()),
                    (Route<dynamic> route) => false);
              });
              // .then((value) {

              // });
            },
            child: Column(
              children: [
                Icon(
                  Icons.logout,
                  color: Colors.red.shade900,
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "Log-out",
                  style: TextStyle(
                    color: Colors.red.shade900,
                    fontSize: 15,
                  ),
                )
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => HomePage(),
                    ));
              });
            },
            child: Column(
              children: [
                Icon(
                  Icons.home,
                  color: Colors.white,
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "Home",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                )
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => SearchPage(),
                    ));
              });
            },
            child: Column(
              children: [
                Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                SizedBox(
                  height: 5,
                ),
                Text(
                  "Search",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
