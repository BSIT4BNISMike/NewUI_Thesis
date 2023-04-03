import 'dart:developer';
import 'dart:io';

import 'package:befit/video.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

import '../standards.dart';

class Feedbacks extends StatefulWidget {
  List<Map<String, dynamic>> feedbackFiles;
  Feedbacks({Key? key, required this.feedbackFiles}) : super(key: key);

  @override
  State<Feedbacks> createState() => _FeedbacksState();
}

class _FeedbacksState extends State<Feedbacks> {
  formatTime(int time) {
    String formattedTime = time < 10 ? "0$time" : "$time";

    return formattedTime;
  }

  @override
  void initState() {
    log(widget.feedbackFiles.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Standards.colors["whiteColor"],
          ),
          // TODO: Implement Back Button
          // Tapping Back Button will return to the ROUTES TESTER (temporary)
          onPressed: () {
            setState(
              () {
                Navigator.pop(context);
              },
            );
          },
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: SizedBox(
            child: Column(
              children: [
                Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10),
                    child: Column(
                      children: [
                        SizedBox(
                            child: Column(
                          children: [
                            Text(
                              "Please perform the exercises correctly!",
                              style: Standards.fontStyles["notelabel"],
                            ),
                            Text(
                              "Your exercises will be counted in the progress bar even",
                              style: Standards.fontStyles["notelabel"],
                            ),
                            Text(
                              "you performed it incorrectly but the result in your ",
                              style: Standards.fontStyles["notelabel"],
                            ),
                            Text(
                              "body might be different from your expected outcome",
                              style: Standards.fontStyles["notelabel"],
                            ),
                          ],
                        )),
                        SizedBox(
                          child: Row(
                            children: [
                              Text(
                                "Upload",
                                style: Standards.fontStyles["smallerMain"],
                              ),
                              const Spacer(),
                              Text(
                                "Feedback",
                                style: Standards.fontStyles["smallerMain"],
                              )
                            ],
                          ),
                        ),
                      ],
                    )),
                const Divider(color: Colors.black),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: widget.feedbackFiles.length,
                  itemBuilder: (context, index) {
                    var feedback = widget.feedbackFiles[index];

                    return FutureBuilder<FullMetadata>(
                      future: feedback['txt'].getMetadata(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          var dateCreated = snapshot.data?.timeCreated;
                          var filetype = snapshot.data?.contentType;
                          var fullPath = snapshot.data?.fullPath;

                          var day = formatTime(dateCreated!.day);
                          var month = formatTime(dateCreated.month);
                          var year = dateCreated.year;

                          return Column(
                            children: [
                              ListTile(
                                  title: Text("$month/$day/$year"),
                                  leading: Text("${index + 1}"),
                                  horizontalTitleGap: 0,
                                  visualDensity: VisualDensity.compact,
                                  trailing: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 10),
                                        child: ElevatedButton(
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    VideoPlayerScreen(
                                                  url: feedback['video'],
                                                ),
                                              ),
                                            );
                                          },
                                          child: const Text("MP4"),
                                        ),
                                      ),
                                      ElevatedButton(
                                        onPressed: () async {
                                          final dir =
                                              await getTemporaryDirectory();

                                          showDialog<void>(
                                            useSafeArea: true,
                                            context: context,
                                            builder: (BuildContext context) {
                                              return Dialog(
                                                shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            25)),
                                                insetPadding:
                                                    const EdgeInsets.all(15),
                                                child: Stack(
                                                  children: [
                                                    Positioned(
                                                      top: 15,
                                                      left: 15,
                                                      child: GestureDetector(
                                                        onTap: () {
                                                          Navigator.pop(
                                                              context);
                                                        },
                                                        child: const Icon(
                                                          Icons.arrow_back,
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets
                                                              .fromLTRB(
                                                          20, 50, 20, 20),
                                                      child: FutureBuilder(
                                                        future: File(
                                                                '${dir.path}/$fullPath')
                                                            .readAsString(),
                                                        builder: (context,
                                                            snapshot) {
                                                          if (snapshot
                                                                  .connectionState ==
                                                              ConnectionState
                                                                  .done) {
                                                            return SingleChildScrollView(
                                                                scrollDirection:
                                                                    Axis.vertical,
                                                                child: Column(
                                                                  children: [
                                                                    Text(
                                                                        "${snapshot.data}")
                                                                  ],
                                                                ));
                                                          } else {
                                                            return Center();
                                                          }
                                                        },
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              );
                                            },
                                          );
                                        },
                                        child: Text("$filetype"),
                                      )
                                    ],
                                  )),
                              const Divider(color: Colors.black),
                            ],
                          );
                        } else {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      },
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
