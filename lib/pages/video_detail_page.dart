import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:video_player/video_player.dart';

import '../model/model.dart';
import 'search_page.dart';

class VideoDetailPage extends StatefulWidget {
  final String videoUrl;
  final String videoName;
  final String videoImage;
  final String videoStory;
  const VideoDetailPage(
      {super.key,
      required this.videoUrl,
      required this.videoName,
      required this.videoImage,
      required this.videoStory});
  @override
  State<VideoDetailPage> createState() => _VideoDetailPageState();
}

class _VideoDetailPageState extends State<VideoDetailPage> {
  navtosearchpage() {
    setState(() {
      Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) => SearchPage(),
          ));
    });
  }

  late VideoPlayerController _controller;
  bool isSoundOn = true;
  @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.network(widget.videoUrl)
      ..initialize().then((_) {
        setState(() {
          _controller.play();
        });
      });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(50),
        child: getAppBar(),
      ),
      body: getBody(),
    );
  }

  Widget getAppBar() {
    return AppBar(
      backgroundColor: Colors.black,
      elevation: 0,
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
      actions: [
        IconButton(
          icon: Icon(
            Icons.search,
            size: 28,
            color: Colors.white,
          ),
          onPressed: navtosearchpage,
        ),
      ],
    );
  }

  Widget getBody() {
    var size = MediaQuery.of(context).size;
    return Container(
      width: size.width,
      height: size.height,
      child: Column(
        children: [
          Container(
            height: 300,
            child: Stack(children: [
              AspectRatio(aspectRatio: 1.3, child: VideoPlayer(_controller)),
              Container(
                decoration: BoxDecoration(color: Colors.black.withOpacity(0.2)),
              ),
              Center(
                child: IconButton(
                    icon: Icon(
                      _controller.value.isPlaying ? null : Icons.play_arrow,
                      color: Colors.white,
                      size: 50,
                    ),
                    onPressed: () {
                      setState(() {
                        _controller.value.isPlaying
                            ? _controller.pause()
                            : _controller.play();
                      });
                    }),
              ),
              Positioned(
                right: 0,
                bottom: 65,
                child: Container(
                  width: 48,
                  height: 45,
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(5)),
                  child: Row(children: [
                    IconButton(
                      icon: Icon(
                        isSoundOn == true ? Icons.volume_up : Icons.volume_mute,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        setState(() {
                          isSoundOn == true
                              ? _controller.setVolume(0.0)
                              : _controller.setVolume(1.0);
                          isSoundOn = !isSoundOn;
                        });
                      },
                    ),
                  ]),
                ),
              )
            ]),
          ),
          SizedBox(
            height: 1,
          ),
          Container(
            height: size.height - 430,
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.only(
                  left: 25,
                  right: 15,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${widget.videoName}",
                      style: TextStyle(
                        color: Colors.white.withOpacity(0.9),
                        fontWeight: FontWeight.bold,
                        height: 1.4,
                        fontSize: 28,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          margin:
                              EdgeInsets.only(top: 10, right: 5, bottom: 25),
                          height: 320,
                          width: 340,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: NetworkImage(widget.videoImage),
                              fit: BoxFit.contain,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Center(
                      child: SizedBox(
                        height: 35,
                        child: Text(
                          "Story",
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 25,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(top: 10),
                      height: 250,
                      width: 350,
                      child: Text(
                        "${widget.videoStory}",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
