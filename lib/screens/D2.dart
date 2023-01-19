import 'package:befit/screens/BicycleCrunch.dart';
import 'package:befit/screens/cobraPose.dart';
import 'package:befit/screens/mountainClimbers.dart';
import 'package:befit/screens/pushUps.dart';
import 'package:befit/screens/prisonerSquats.dart';
import 'package:befit/screens/superman.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:befit/standards.dart';
import 'package:befit/screens/D22ndweek.dart';

import '../query.dart';

class A5 extends StatefulWidget {
  const A5({Key? key}) : super(key: key);

  @override
  State<A5> createState() => _A5State();
}

class _A5State extends State<A5> {
  var week = "1st";
  var numOfExercises = 7;

  List<Map<String, dynamic>> prisonerSquatsFeedback = [];
  List<Map<String, dynamic>> bicycleCrunchFeedback = [];
  List<Map<String, dynamic>> pushUpsFeedback = [];
  List<Map<String, dynamic>> supermanFeedback = [];
  List<Map<String, dynamic>> cobraPoseFeedback = [];
  List<Map<String, dynamic>> mountainClimbersFeedback = [];

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
                          width: 230,
                          height: 50,
                          alignment: Alignment.center,
                          child: Text(
                            'Perform for 1 Week',
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
                              'Number of Exercises: 6',
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
                            padding: const EdgeInsets.only(top: 10, bottom: 10),
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
                                  'Prisoners squats',
                                  style: Standards.fontStyles["miniWhite"],
                                ),
                                const SizedBox(
                                  width: 160,
                                  height: 160,
                                  child: Image(
                                    image: AssetImage(
                                        "assets/images/prisonersquats.jpg"),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                Container(
                                  width: 150,
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Repeat exercise 15 times for 3 sets',
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
                                                prisonerSquatsFeedback,
                                          ),
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
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(15)),
                                    ),
                                    child: FutureBuilder(
                                      future: downloadFeedbacks(
                                          "Prisoner_Squats", week),
                                      builder: (context, snapshot) {
                                        if (snapshot.connectionState ==
                                            ConnectionState.done) {
                                          prisonerSquatsFeedback =
                                              snapshot.data!;
                                          return Stack(
                                            children: [
                                              Container(
                                                decoration: const BoxDecoration(
                                                  gradient: LinearGradient(
                                                    colors: [
                                                      Color(0xFF155bc4),
                                                      Color(0xFF5397e5),
                                                    ],
                                                  ),
                                                ),
                                                width: (190 - 70) *
                                                    (prisonerSquatsFeedback
                                                            .length /
                                                        numOfExercises),
                                              ),
                                              Center(
                                                child: Text(
                                                    "${(prisonerSquatsFeedback.length / numOfExercises * 100).toStringAsFixed(2)}%",
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
                                )
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Container(
                            width: 160,
                            padding: const EdgeInsets.only(top: 10, bottom: 10),
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
                                  'Bicycle Crunch',
                                  style: Standards.fontStyles["miniWhite"],
                                ),
                                const SizedBox(
                                  width: 160,
                                  height: 160,
                                  child: Image(
                                    image: AssetImage(
                                        "assets/images/bicyclecrunch.jpg"),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                                Container(
                                  width: 150,
                                  alignment: Alignment.center,
                                  child: Text(
                                    'Repeat exercise 15 times for 3 sets',
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
                                          builder: (context) => BicycleCrunch(
                                            week: week,
                                            feedbackFiles:
                                                bicycleCrunchFeedback,
                                          ),
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
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(15)),
                                    ),
                                    child: FutureBuilder(
                                      future: downloadFeedbacks(
                                          "Bicycle_Crunch", week),
                                      builder: (context, snapshot) {
                                        if (snapshot.connectionState ==
                                            ConnectionState.done) {
                                          bicycleCrunchFeedback =
                                              snapshot.data!;
                                          return Stack(
                                            children: [
                                              Container(
                                                decoration: const BoxDecoration(
                                                  gradient: LinearGradient(
                                                    colors: [
                                                      Color(0xFF155bc4),
                                                      Color(0xFF5397e5),
                                                    ],
                                                  ),
                                                ),
                                                width: (190 - 70) *
                                                    (bicycleCrunchFeedback
                                                            .length /
                                                        numOfExercises),
                                              ),
                                              Center(
                                                child: Text(
                                                    "${(bicycleCrunchFeedback.length / numOfExercises * 100).toStringAsFixed(2)}%",
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
                                )
                              ],
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  Divider(
                      height: 18,
                      thickness: 5,
                      color: Standards.colors["primaryColorLight"]),

// Exercise 3
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 160,
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
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
                            Text('Push Ups',
                                style: Standards.fontStyles["miniWhite"]),
                            const SizedBox(
                              width: 160,
                              height: 160,
                              child: Image(
                                image: AssetImage("assets/images/pushups.jpg"),
                                fit: BoxFit.fill,
                              ),
                            ),
                            Container(
                              width: 150,
                              alignment: Alignment.center,
                              child: Text(
                                'Repeat exercise 15 times for 3 sets',
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
                                      builder: (context) => PushUps(
                                        week: week,
                                        feedbackFiles: pushUpsFeedback,
                                      ),
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
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                ),
                                child: FutureBuilder(
                                  future: downloadFeedbacks("Push_Ups", week),
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.done) {
                                      pushUpsFeedback = snapshot.data!;
                                      return Stack(
                                        children: [
                                          Container(
                                            decoration: const BoxDecoration(
                                              gradient: LinearGradient(
                                                colors: [
                                                  Color(0xFF155bc4),
                                                  Color(0xFF5397e5),
                                                ],
                                              ),
                                            ),
                                            width: (190 - 70) *
                                                (pushUpsFeedback.length /
                                                    numOfExercises),
                                          ),
                                          Center(
                                            child: Text(
                                                "${(pushUpsFeedback.length / numOfExercises * 100).toStringAsFixed(2)}%",
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
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: 10,
                      ),
                      Container(
                        width: 160,
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
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
                              'Superman',
                              style: Standards.fontStyles["miniWhite"],
                            ),
                            const SizedBox(
                              width: 160,
                              height: 160,
                              child: Image(
                                image: AssetImage("assets/images/superman.jpg"),
                                fit: BoxFit.fill,
                              ),
                            ),
                            Container(
                              width: 150,
                              alignment: Alignment.center,
                              child: Text(
                                'Repeat exercise 15 times for 3 sets',
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
                                      builder: (context) => Superman(
                                        week: week,
                                        feedbackFiles: supermanFeedback,
                                      ),
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
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                ),
                                child: FutureBuilder(
                                  future: downloadFeedbacks("Superman", week),
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.done) {
                                      supermanFeedback = snapshot.data!;
                                      return Stack(
                                        children: [
                                          Container(
                                            decoration: const BoxDecoration(
                                              gradient: LinearGradient(
                                                colors: [
                                                  Color(0xFF155bc4),
                                                  Color(0xFF5397e5),
                                                ],
                                              ),
                                            ),
                                            width: (190 - 70) *
                                                (supermanFeedback.length /
                                                    numOfExercises),
                                          ),
                                          Center(
                                            child: Text(
                                                "${(supermanFeedback.length / numOfExercises * 100).toStringAsFixed(2)}%",
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
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  Divider(
                      height: 18,
                      thickness: 5,
                      color: Standards.colors["primaryColorLight"]),
                  // Exercise 5

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 160,
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
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
                              'Cobrapose',
                              style: Standards.fontStyles["miniWhite"],
                            ),
                            const SizedBox(
                              width: 160,
                              height: 160,
                              child: Image(
                                image:
                                    AssetImage("assets/images/cobrapose.jpg"),
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
                                      builder: (context) => CobraPose(
                                        week: week,
                                        feedbackFiles: cobraPoseFeedback,
                                      ),
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
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                ),
                                child: FutureBuilder(
                                  future: downloadFeedbacks("Cobra_Pose", week),
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.done) {
                                      cobraPoseFeedback = snapshot.data!;
                                      return Stack(
                                        children: [
                                          Container(
                                            decoration: const BoxDecoration(
                                              gradient: LinearGradient(
                                                colors: [
                                                  Color(0xFF155bc4),
                                                  Color(0xFF5397e5),
                                                ],
                                              ),
                                            ),
                                            width: (190 - 70) *
                                                (cobraPoseFeedback.length /
                                                    numOfExercises),
                                          ),
                                          Center(
                                            child: Text(
                                                "${(cobraPoseFeedback.length / numOfExercises * 100).toStringAsFixed(2)}%",
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
                            )
                          ],
                        ),
                      ),
                      Container(
                        width: 10,
                      ),
                      Container(
                        width: 160,
                        padding: const EdgeInsets.only(top: 10, bottom: 10),
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
                              'Mountain climber',
                              style: Standards.fontStyles["microWhite"],
                            ),
                            const SizedBox(
                              width: 160,
                              height: 160,
                              child: Image(
                                image: AssetImage(
                                    "assets/images/mountainclimbers.jpg"),
                                fit: BoxFit.fill,
                              ),
                            ),
                            Container(
                              width: 150,
                              alignment: Alignment.center,
                              child: Text(
                                'Perform Exercise for 1 minute',
                                style: Standards.fontStyles["microWhite"],
                              ),
                            ),
                            Container(
                              height: 6,
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
                                      builder: (context) => MountainClimbers(
                                        week: week,
                                        feedbackFiles: mountainClimbersFeedback,
                                      ),
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
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                ),
                                child: FutureBuilder(
                                  future: downloadFeedbacks(
                                      "Mountain_Climbers", week),
                                  builder: (context, snapshot) {
                                    if (snapshot.connectionState ==
                                        ConnectionState.done) {
                                      mountainClimbersFeedback = snapshot.data!;
                                      return Stack(
                                        children: [
                                          Container(
                                            decoration: const BoxDecoration(
                                              gradient: LinearGradient(
                                                colors: [
                                                  Color(0xFF155bc4),
                                                  Color(0xFF5397e5),
                                                ],
                                              ),
                                            ),
                                            width: (190 - 70) *
                                                (mountainClimbersFeedback
                                                        .length /
                                                    numOfExercises),
                                          ),
                                          Center(
                                            child: Text(
                                                "${(mountainClimbersFeedback.length / numOfExercises * 100).toStringAsFixed(2)}%",
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
                            )
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
                        if (prisonerSquatsFeedback.length == numOfExercises &&
                            bicycleCrunchFeedback.length == numOfExercises &&
                            pushUpsFeedback.length == numOfExercises &&
                            supermanFeedback.length == numOfExercises &&
                            cobraPoseFeedback.length == numOfExercises &&
                            mountainClimbersFeedback.length == numOfExercises) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => D22ndweek(),
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
