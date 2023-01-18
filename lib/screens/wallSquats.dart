import 'dart:io';
import 'package:befit/uploadFile.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:befit/standards.dart';
import 'package:gif_view/gif_view.dart';

import '../query.dart';
import 'feedbacks.dart';

class WallSquats extends StatefulWidget {
  final week;
  final feedbackFiles;
  const WallSquats({Key? key, required this.week, this.feedbackFiles})
      : super(key: key);

  @override
  State<WallSquats> createState() => _WallSquatsState();
}

class _WallSquatsState extends State<WallSquats> {
  var exercise;
  var week;
  var feedbackFiles;

  @override
  void initState() {
    exercise = "Wall_Squats";
    week = widget.week;
    feedbackFiles = widget.feedbackFiles;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
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
        title: Text(
          'Exercise',
          style: Standards.fontStyles["mainWhite"],
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: SizedBox(
            child: Column(
              children: [
                //header
                Container(
                  width: deviceWidth,
                  decoration: BoxDecoration(
                    gradient: const LinearGradient(
                      colors: [
                        Color(0xFF5397e5),
                        Color(0xFF155bc4),
                      ],
                    ),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 300,
                        height: 50,
                        alignment: Alignment.center,
                        child: Text(
                          'Wall Squats',
                          style: Standards.fontStyles["mainButtonWhite"],
                        ),
                      ),
                    ],
                  ),
                ),

                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GifView.asset(
                          'assets/images/WallSquats.gif',
                          height: 300,
                          width: 330,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'NOTE: Please be sure to record yourself doing this workout with your left side part is seen in the camera.',
                            style: Standards.fontStyles["tinyWhite"],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            '',
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            '-	Stand with feet shoulder-width apart and back flat against a wall. ',
                            style: Standards.fontStyles["tinyWhite"],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            '-	Lower into a sitting position by bending your knees at a 90-degree angle while keeping the lower back firmly against the wall.',
                            style: Standards.fontStyles["tinyWhite"],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            '-	Straighten back up and repeat.',
                            style: Standards.fontStyles["tinyWhite"],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                Row(
                  children: [
                    Container(
                      width: 145,
                      height: 50,
                      margin: EdgeInsets.all(Standards.bounds["minimargin"]!),
                      // Rounded button
                      child: ElevatedButton(
                        // Rounded button
                        style: ElevatedButton.styleFrom(
                          primary: Standards.colors["blueColor"],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                Standards.bounds["borderRadius"]!),
                          ),
                        ),
                        // Text with icon
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Feedback',
                              style: Standards.fontStyles["miniWhite"],
                            ),
                          ],
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  Feedbacks(feedbackFiles: feedbackFiles),
                            ),
                          );
                        },
                      ),
                    ),
                    Container(
                      width: 145,
                      height: 50,
                      margin: EdgeInsets.all(Standards.bounds["minimargin"]!),
                      // Rounded button
                      child: ElevatedButton(
                        // Rounded button
                        style: ElevatedButton.styleFrom(
                          primary: Standards.colors["blueColor"],
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                Standards.bounds["borderRadius"]!),
                          ),
                        ),
                        // Text with icon
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Upload',
                              style: Standards.fontStyles["miniWhite"],
                            ),
                          ],
                        ),
                        onPressed: () async {
                          await uploadFile(exercise, week);
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () async {
      //     await uploadFile();
      //   },
      //   child: Text('Upload'),
      // ),
    );
  }
}
