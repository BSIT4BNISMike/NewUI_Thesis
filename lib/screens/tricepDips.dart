import 'dart:io';
import 'package:befit/uploadFile.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:befit/standards.dart';
import 'package:gif_view/gif_view.dart';

import 'feedbacks.dart';

class TricepDips extends StatefulWidget {
  final week;
  final feedbackFiles;
  const TricepDips({Key? key, required this.week, this.feedbackFiles})
      : super(key: key);

  @override
  State<TricepDips> createState() => _TricepDipsState();
}

class _TricepDipsState extends State<TricepDips> {
  var exercise;
  var week;
  var feedbackFiles;

  @override
  void initState() {
    exercise = "Triceps_Dips";
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
                          'Tricep Dips',
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
                          'assets/images/Tricepdips.gif',
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
                            '-	Place your hands on a bench, box or chair behind you with your feet together and flat on the floor with knees bent. ',
                            style: Standards.fontStyles["tinyWhite"],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            '-	Lower slowly your body towards the floor as far as you can',
                            style: Standards.fontStyles["tinyWhite"],
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            '-	Press back up and repeat.',
                            style: Standards.fontStyles["tinyWhite"],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),

                Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
