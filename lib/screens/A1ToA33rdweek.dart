import 'package:befit/screens/Congratulations.dart';
import 'package:befit/screens/kneeToChest.dart';
import 'package:befit/screens/prisonerSquats.dart';
import 'package:befit/screens/walking.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:befit/screens/panel.dart';
import 'package:befit/standards.dart';

import '../query.dart';

class A1toA33rd extends StatefulWidget {
  @override
  State<A1toA33rd> createState() => _A1toA33rdState();
}

class _A1toA33rdState extends State<A1toA33rd> {
  var week = "3rd";
  var numOfExercises = 21;

  List<Map<String, dynamic>> kneeToChestFeedback = [];
  List<Map<String, dynamic>> prisonerSquatFeedback = [];

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
            Navigator.popUntil(context, ModalRoute.withName('/mainPage'));
          },
        ),
        title: Text(
          'Recommendation',
          style: Standards.fontStyles["mainWhite"],
        ),
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          setState(() {});
          return Future<void>.delayed(const Duration(seconds: 1));
        },
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: SizedBox(
              child: Column(
                children: [
                  // Header
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
                          width: 250,
                          height: 50,
                          alignment: Alignment.center,
                          child: Text(
                            'Perform for 3 Weeks',
                            style: Standards.fontStyles["mainWhite"],
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Part 1

                  Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 230,
                            height: 50,
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Number of Exercises: 3',
                              style: Standards.fontStyles["miniWhite"],
                            ),
                          ),
                        ],
                      ),

                      Divider(
                          height: 18,
                          thickness: 5,
                          color: Standards.colors["primaryColorLight"]),
// Exercise 1
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: 160,
                              padding:
                                  const EdgeInsets.only(top: 10, bottom: 10),
                              alignment: Alignment.bottomCenter,
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  colors: [
                                    Color.fromARGB(255, 124, 140, 219),
                                    Color.fromARGB(255, 83, 70, 199),
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Column(
                                children: [
                                  Text(
                                    'Walking',
                                    style: Standards.fontStyles["miniWhite"],
                                  ),
                                  const SizedBox(
                                    width: 160,
                                    height: 160,
                                    child: Image(
                                      image: AssetImage(
                                          "assets/images/walking.jpg"),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  Container(
                                    height: 84,
                                    width: 150,
                                    alignment: Alignment.center,
                                    child: Text(
                                      '5000 steps a day',
                                      style: Standards.fontStyles["miniWhite"],
                                    ),
                                  ),
                                  Container(
                                    width: 50,
                                    height: 45,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      gradient: const LinearGradient(
                                        colors: [
                                          Color(0xFF155bc4),
                                          Color(0xFF5397e5),
                                        ],
                                        stops: [1.0, 1.0],
                                      ),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: IconButton(
                                      icon: Icon(
                                        Icons.arrow_forward,
                                        color: Standards.colors["whiteColor"],
                                      ),
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => Walking(
                                              week: week,
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              width: 10,
                            ),
                            Container(
                              width: 160,
                              padding:
                                  const EdgeInsets.only(top: 10, bottom: 10),
                              alignment: Alignment.bottomCenter,
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  colors: [
                                    Color.fromARGB(255, 124, 140, 219),
                                    Color.fromARGB(255, 83, 70, 199),
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Column(
                                children: [
                                  Text(
                                    'Knee To Chest',
                                    style: Standards.fontStyles["miniWhite"],
                                  ),
                                  const SizedBox(
                                    width: 160,
                                    height: 160,
                                    child: Image(
                                      image: AssetImage(
                                          "assets/images/kneetochest.jpg"),
                                      fit: BoxFit.fill,
                                    ),
                                  ),
                                  Container(
                                    width: 150,
                                    alignment: Alignment.center,
                                    child: Text(
                                      'Repeat exercise 3 times',
                                      style: Standards.fontStyles["miniWhite"],
                                    ),
                                  ),
                                  Container(
                                    width: 50,
                                    height: 45,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      gradient: const LinearGradient(
                                        colors: [
                                          Color(0xFF155bc4),
                                          Color(0xFF5397e5),
                                        ],
                                        stops: [1.0, 1.0],
                                      ),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: IconButton(
                                      icon: Icon(
                                        Icons.arrow_forward,
                                        color: Standards.colors["whiteColor"],
                                      ),
                                      onPressed: () {
                                        Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                            builder: (context) => KneeToChest(
                                                week: week,
                                                feedbackFiles:
                                                    kneeToChestFeedback),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10, left: 20, right: 20),
                                    child: Container(
                                      width: double.maxFinite,
                                      height: 20,
                                      clipBehavior: Clip.hardEdge,
                                      decoration: const BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15)),
                                      ),
                                      child: FutureBuilder(
                                        future: downloadFeedbacks(
                                            "Knee_To_Chest", week),
                                        builder: (context, snapshot) {
                                          if (snapshot.connectionState ==
                                              ConnectionState.done) {
                                            kneeToChestFeedback =
                                                snapshot.data!;
                                            return Stack(
                                              children: [
                                                Container(
                                                  decoration:
                                                      const BoxDecoration(
                                                    gradient: LinearGradient(
                                                      colors: [
                                                         Color(0xFF155bc4),
                                                      Color(0xFF5397e5),
                                                      ],
                                                    ),
                                                  ),
                                                  width: (190 - 70) *
                                                      (kneeToChestFeedback
                                                              .length /
                                                          numOfExercises),
                                                ),
                                                Center(
                                                  child: Text(
                                                      "${(kneeToChestFeedback.length / numOfExercises * 100).toStringAsFixed(2)}%",
                                                      style: const TextStyle(
                                                          color: Colors.black)),
                                                )
                                              ],
                                            );
                                          } else if (snapshot.connectionState ==
                                              ConnectionState.waiting) {
                                            return const LinearProgressIndicator(
                                              color: Color(0xFF155bc4),
                                              backgroundColor:
                                                  Color(0xFF5397e5),
                                            );
                                          } else {
                                            return const Center();
                                          }
                                        },
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ]),
                    ],
                  ),
                  Divider(
                      height: 18,
                      thickness: 5,
                      color: Standards.colors["primaryColorLight"]),

                  // Exercise 2
                  Column(
                    children: [],
                  ),

// Exercise 3
                  Column(
                    children: [
                      Container(
                        width: deviceWidth,
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
                        alignment: Alignment.bottomCenter,
                        decoration: BoxDecoration(
                          gradient: const LinearGradient(
                            colors: [
                              Color.fromARGB(255, 83, 70, 199),
                              Color.fromARGB(255, 124, 140, 219),
                            ],
                          ),
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                const SizedBox(
                                  width: 150,
                                  height: 130,
                                  child: Image(
                                    image: AssetImage(
                                        "assets/images/prisonersquats.jpg"),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                Container(
                                  width: 115,
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Prisoner squats repeat exercise 15 times for 3 sets',
                                    style: Standards.fontStyles["miniWhite"],
                                  ),
                                ),
                                Container(
                                  width: 50,
                                  height: 45,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    gradient: const LinearGradient(
                                      colors: [
                                        Color(0xFF155bc4),
                                        Color(0xFF5397e5),
                                      ],
                                      stops: [1.0, 1.0],
                                    ),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  child: IconButton(
                                    icon: Icon(
                                      Icons.arrow_forward,
                                      color: Standards.colors["whiteColor"],
                                    ),
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => PrisonerSquats(
                                              week: week,
                                              feedbackFiles:
                                                  prisonerSquatFeedback),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 10, left: 20, right: 20),
                              child: Container(
                                width: double.maxFinite,
                                height: 20,
                                clipBehavior: Clip.hardEdge,
                                decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                ),
                                child: FutureBuilder(
                                  future: downloadFeedbacks(
                                      "Prisoner_Squats", week),
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.done) {
                                      prisonerSquatFeedback = snapshot.data!;
                                      return Stack(
                                        children: [
                                          Container(
                                            decoration: const BoxDecoration(
                                              gradient: LinearGradient(
                                                colors: [
                                                  Color.fromARGB(
                                                      255, 124, 140, 219),
                                                  Color.fromARGB(
                                                      255, 83, 70, 199),
                                                ],
                                              ),
                                            ),
                                            width: (deviceWidth - 70) *
                                                (prisonerSquatFeedback.length /
                                                    numOfExercises),
                                          ),
                                          Center(
                                            child: Text(
                                                "${(prisonerSquatFeedback.length / numOfExercises * 100).toStringAsFixed(2)}%",
                                                style: const TextStyle(
                                                    color: Colors.black)),
                                          )
                                        ],
                                      );
                                    } else if (snapshot.connectionState ==
                                        ConnectionState.waiting) {
                                      return const LinearProgressIndicator(
                                        color: Color(0xFF155bc4),
                                        backgroundColor: Color(0xFF5397e5),
                                      );
                                    } else {
                                      return const Center();
                                    }
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Divider(
                      height: 18,
                      thickness: 5,
                      color: Standards.colors["primaryColorLight"]),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.90,
                    margin: EdgeInsets.only(top: Standards.bounds["margin"]!),
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
                            'Next',
                            style: Standards.fontStyles["mainButtonWhite"],
                          ),
                          const VerticalDivider(
                            color: Colors.transparent,
                          ),
                          const Icon(Icons.arrow_forward_outlined,
                              color: Colors.white),
                        ],
                      ),
                      onPressed: () {
                        if (kneeToChestFeedback.length == numOfExercises &&
                            prisonerSquatFeedback.length == numOfExercises) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Congrats(),
                            ),
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
