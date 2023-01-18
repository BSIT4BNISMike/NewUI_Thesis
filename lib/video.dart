import 'dart:io';
import 'package:befit/standards.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerScreen extends StatefulWidget {
  final url;
  const VideoPlayerScreen({Key? key, required this.url}) : super(key: key);

  @override
  State<VideoPlayerScreen> createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController controller;

  @override
  void initState() {
    controller = VideoPlayerController.network(widget.url)
      ..setLooping(true)
      ..initialize().then((_) {
        setState(() {
          controller.play();
        });
      });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final orientation = MediaQuery.of(context).orientation;

    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context);
        SystemChrome.setPreferredOrientations([
          DeviceOrientation.portraitUp,
        ]);
        return false;
      },
      child: Scaffold(
        body: SafeArea(
          child: Stack(
            children: [
              IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: Standards.colors["whiteColor"],
                ),
                onPressed: () {
                  Navigator.pop(context);
                  SystemChrome.setPreferredOrientations([
                    DeviceOrientation.portraitUp,
                  ]);
                },
              ),
              Center(
                child: controller.value.isInitialized
                    ? GestureDetector(
                        onTap: () {
                          controller.value.isPlaying == true
                              ? controller.pause()
                              : controller.play();
                        },
                        child: AspectRatio(
                          aspectRatio: controller.value.aspectRatio,
                          child: Stack(
                            children: [
                              VideoPlayer(controller),
                              Positioned(
                                bottom: 0,
                                right: 0,
                                child: GestureDetector(
                                    onTap: () {
                                      if (orientation == Orientation.portrait) {
                                        SystemChrome.setPreferredOrientations([
                                          DeviceOrientation.landscapeLeft,
                                        ]);
                                      } else {
                                        SystemChrome.setPreferredOrientations([
                                          DeviceOrientation.portraitUp,
                                        ]);
                                      }
                                    },
                                    child: Icon(
                                        orientation == Orientation.portrait
                                            ? Icons.zoom_out_map
                                            : Icons.zoom_in_map,
                                        color: Colors.white)),
                              ),
                            ],
                          ),
                        ),
                      )
                    : Container(
                        height: 300,
                        width: double.maxFinite,
                        decoration: const BoxDecoration(color: Colors.grey),
                        child: const Center(
                          child: CircularProgressIndicator(),
                        ),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
