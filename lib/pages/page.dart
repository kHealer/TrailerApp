// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:video_player/video_player.dart';

// import '../model/model.dart';

// class VideoPlayerPage extends StatefulWidget {
//   const VideoPlayerPage({super.key});

//   @override
//   State<VideoPlayerPage> createState() => _VideoPlayerPageState();
// }

// class _VideoPlayerPageState extends State<VideoPlayerPage> {
//   late VideoPlayerController _controller;
//   int _currentIndex = 0;
//   void _playVideo({int index = 0, bool init = false}) {
//     if (index < 0 || index >= videos.length) return;

//     if (!init) {
//       _controller.pause();
//     }

//     setState(() => _currentIndex = index);

//     _controller = VideoPlayerController.network(videos[_currentIndex].url)
//       ..addListener(() => setState(() {}))
//       ..setLooping(true)
//       ..initialize().then((value) => _controller.play());
//   }

//   String _videoDuration(Duration duration) {
//     String twoDigits(int n) => n.toString().padLeft(2, "0");
//     final hours = twoDigits(duration.inHours);
//     final minutes = twoDigits(duration.inMinutes.remainder(60));
//     final seconds = twoDigits(duration.inSeconds.remainder(60));

//     return [
//       if (duration.inHours > 0) hours,
//       minutes,
//       seconds,
//     ].join(":");
//   }

//   @override
//   void initState() {
//     super.initState();
//     _playVideo(init: true);
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Colors.black,
//         title: Text(""),
//         centerTitle: true,
//       ),
//       body: Column(
//         children: [
//           Container(
//             color: Colors.black,
//             height: 410,
//             child: _controller.value.isInitialized
//                 ? Column(
//                     children: <Widget>[
//                       SizedBox(
//                         height: 360,
//                         child: VideoPlayer(_controller),
//                       ),
//                       // Positioned(
//                       //   bottom: 90,
//                       //   right: 0,
//                       //   child: IconButton(
//                       //     onPressed: () {
//                       //       Navigator.of(context).push(
//                       //         MaterialPageRoute(
//                       //           builder: (context) => LandscapePlayerPage(
//                       //               controller: _controller),
//                       //         ),
//                       //       );
//                       //     },
//                       //     icon: const Icon(
//                       //       Icons.fullscreen,
//                       //       color: Colors.white,
//                       //       size: 40,
//                       //     ),
//                       //   ),
//                       // ),
//                       const SizedBox(height: 1),
//                       Row(
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         children: [
//                           IconButton(
//                             onPressed: () => _controller.value.isPlaying
//                                 ? _controller.pause()
//                                 : _controller.play(),
//                             icon: Icon(
//                               _controller.value.isPlaying
//                                   ? Icons.pause
//                                   : Icons.play_arrow,
//                               color: Colors.white,
//                               size: 30,
//                             ),
//                           ),
//                           ValueListenableBuilder(
//                             valueListenable: _controller,
//                             builder: (context, VideoPlayerValue value, child) {
//                               return Text(
//                                 _videoDuration(value.position),
//                                 style: const TextStyle(
//                                   color: Colors.white12,
//                                   fontSize: 20,
//                                 ),
//                               );
//                             },
//                           ),
//                           Expanded(
//                             child: SizedBox(
//                               height: 20,
//                               child: VideoProgressIndicator(
//                                 _controller,
//                                 allowScrubbing: true,
//                                 padding: const EdgeInsets.symmetric(
//                                   vertical: 0,
//                                   horizontal: 12,
//                                 ),
//                               ),
//                             ),
//                           ),
//                           Text(
//                             _videoDuration(_controller.value.duration),
//                             style: const TextStyle(
//                               color: Colors.white12,
//                               fontSize: 20,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   )
//                 : const Center(
//                     child: CircularProgressIndicator(
//                       color: Colors.white,
//                     ),
//                   ),
//           ),
//           Expanded(
//               child: ListView.builder(
//             itemCount: videos.length,
//             itemBuilder: (context, index) {
//               return InkWell(
//                 onTap: () => _playVideo(index: index),
//                 child: Container(
//                   color: Colors.black,
//                   child: Padding(
//                     padding: const EdgeInsets.only(
//                         top: 10, left: 10, right: 45, bottom: 10),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         SizedBox(
//                           height: 250,
//                           width: 180,
//                           child: Image.network(
//                             videos[index].thumbnail,
//                             fit: BoxFit.contain,
//                           ),
//                         ),
//                         const SizedBox(width: 25),
//                         SizedBox(
//                           height: 160,
//                           width: 120,
//                           child: Text(
//                             videos[index].name,
//                             style: const TextStyle(
//                                 fontSize: 20, color: Colors.white),
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                 ),
//               );
//             },
//           )),
//         ],
//       ),
//     );
//   }
// }
