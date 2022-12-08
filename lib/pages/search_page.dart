import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:trailers_app/model/model.dart';
import 'package:trailers_app/model/search_json.dart';

import 'home_page.dart';
import 'video_detail_page.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  final Stream<QuerySnapshot> Movies =
      FirebaseFirestore.instance.collection('MainMovieList').snapshots();
  bool isSearch = false;
  List<MovieModel> lstMovie = [];

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: Movies,
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          return Scaffold(
            backgroundColor: Colors.black,
            bottomNavigationBar: getFooter(),
            appBar: AppBar(
              automaticallyImplyLeading: false,
              backgroundColor: Colors.black,
              elevation: 0.0,
            ),
            body: Padding(
              padding: EdgeInsets.only(top: 0, left: 16, right: 16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Search",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextField(
                    onChanged: (value) {
                      if (value.isNotEmpty) {
                        setState(() {
                          lstMovie = main_movie_list
                              .where((element) => element.name!
                                  .toLowerCase()
                                  .contains(value.toLowerCase()))
                              .toList();
                        });
                      }
                    },
                    style: TextStyle(color: Colors.white),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.black,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                        borderSide: BorderSide.none,
                      ),
                      hintText: "Search",
                      hintStyle:
                          TextStyle(color: Colors.white.withOpacity(0.3)),
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.white.withOpacity(0.3),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  lstMovie.length > 0
                      ? Expanded(
                          child: ListView.builder(
                          itemCount: lstMovie.length,
                          itemBuilder: (context, index) {
                            return ListTile(
                              title: Text(
                                lstMovie[index].name!,
                                style: const TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              leading: Padding(
                                padding: const EdgeInsets.only(bottom: 3),
                                child: SizedBox(
                                  height: 120,
                                  width: 100,
                                  child: Image.network(
                                    lstMovie[index].thumbnail!,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (_) => VideoDetailPage(
                                              videoUrl:
                                                  "${lstMovie[index].url}",
                                              videoName:
                                                  "${lstMovie[index].name}",
                                              videoImage:
                                                  "${lstMovie[index].thumbnail}",
                                              videoStory:
                                                  "${lstMovie[index].story}",
                                            )));
                              },
                            );
                          },
                        ))
                      : Expanded(
                          child: snapshot.data == null
                              ? Card()
                              : ListView(
                                  children: snapshot.data!.docs
                                      .map((DocumentSnapshot document) {
                                    Map<String, dynamic> data = document.data()!
                                        as Map<String, dynamic>;

                                    return ListTile(
                                      title: Text(
                                        data["name"],
                                        style: const TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      leading: Padding(
                                        padding:
                                            const EdgeInsets.only(bottom: 3),
                                        child: SizedBox(
                                          height: 120,
                                          width: 100,
                                          child: Image.network(
                                            data["thumbnail"],
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (_) => VideoDetailPage(
                                                      videoUrl:
                                                          "${data["url"]}",
                                                      videoName:
                                                          "${data["name"]}",
                                                      videoImage:
                                                          "${data["thumbnail"]}",
                                                      videoStory:
                                                          "${data["story"]}",
                                                    )));
                                      },
                                    );
                                  }).toList(),
                                ),
                        ),
                ],
              ),
            ),
          );
        });
  }

  Widget getFooter() {
    return Container(
      height: 80,
      decoration: BoxDecoration(color: Colors.black),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
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
