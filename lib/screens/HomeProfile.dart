import 'dart:developer';

import 'package:befit/main.dart';
import 'package:befit/query.dart';
import 'package:befit/screens/A1ToA3.dart';
import 'package:befit/screens/C1ToC3.dart';
import 'package:befit/screens/D1.dart';
import 'package:befit/screens/D2.dart';
import 'package:befit/screens/D3.dart';
import 'package:befit/screens/E1.dart';
import 'package:befit/screens/E2.dart';
import 'package:befit/screens/E3.dart';
import 'package:befit/screens/login.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:befit/screens/panel.dart';
import 'package:befit/standards.dart';

import 'B1ToB3.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  double finalweight = 0;

  //variable
  double _newuserWeight = 0;
  double _calculateNewWeight(newweight) {
    if (newweight == 0) {
      return 0;
    }
    finalweight = userDetails['Weight'] - _newuserWeight;
    return finalweight;
  }

  String _weightCategory() {
    if (finalweight == 0) {
      return "Burn more";
    } else if (finalweight > 0.01) {
      return "You loss weight! Keep up the Good Work !";
    } else {
      return "You gained weight! What are You doing";
    }
  }

  Map<String, dynamic> userDetails = {};

  @override
  Widget build(BuildContext context) {
    final deviceWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Standards.colors["backColor"],
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
                /*Navigator.popUntil(context, ModalRoute.withName('/mainPage'));*/
              },
            );
          },
        ),
        title: Text(
          'Home',
          style: Standards.fontStyles["miniWhite"],
        ),
      ),
      body: FutureBuilder(
        future: getUserDetails(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            userDetails = snapshot.data!.data()!;
            return RefreshIndicator(
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
                                Color.fromARGB(255, 124, 140, 219),
                                Color.fromARGB(255, 83, 70, 199),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Container(
                                width: 180,
                                height: 50,
                                alignment: Alignment.center,
                                child: Text(
                                  'User Profile',
                                  style:
                                      Standards.fontStyles["mainButtonWhite"],
                                ),
                              ),
                            ],
                          ),
                        ),
                        // Divider(
                        //     height: 18,
                        //     thickness: 5,
                        //     color: Standards.colors["primaryColorLight"]),

                        // Profile picture
                        // Container(
                        //   width: 200,
                        //   height: 200,
                        //   decoration: BoxDecoration(
                        //     gradient: const LinearGradient(
                        //       colors: [
                        //         Color.fromARGB(255, 204, 144, 236),
                        //         Color.fromARGB(255, 153, 110, 180),
                        //       ],
                        //     ),
                        //     borderRadius: BorderRadius.circular(100),
                        //   ),
                        //   child: Row(
                        //     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        //     children: [
                        //       Container(
                        //         width: 110,
                        //         height: 80,
                        //         alignment: Alignment.center,
                        //         child: Text(
                        //           'Profile Picture',
                        //           style: Standards.fontStyles["mainButtonWhite"],
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        Divider(
                            height: 18,
                            thickness: 5,
                            color: Standards.colors["primaryColorLight"]),

                        Column(
                          children: [
// Username
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Container(
                                  width: 200,
                                  height: 50,
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
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 10,
                                      ),
                                      Container(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          'Username: ${userDetails['username']}',
                                          style:
                                              Standards.fontStyles["miniWhite"],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  width: 10,
                                ),
                                Column(
                                  children: [
                                    Container(
                                      width: 120,
                                      height: 50,
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
                                      child: Row(
                                        children: [
                                          Container(
                                            width: 10,
                                          ),
                                          Container(
                                            alignment: Alignment.centerLeft,
                                            child: Text(
                                              'Sex: ${userDetails['sex']}',
                                              style: Standards
                                                  .fontStyles["miniWhite"],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        Divider(
                            height: 18,
                            thickness: 5,
                            color: Standards.colors["primaryColorLight"]),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            // Dateofbirth
                            Column(
                              children: [
                                Container(
                                  width: 220,
                                  height: 50,
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
                                  child: Row(
                                    children: [
                                      Container(
                                        width: 10,
                                      ),
                                      Container(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          'Date of birth: ${userDetails['birthday']}',
                                          style: Standards
                                              .fontStyles["microWhite"],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            Container(
                              width: 10,
                            ),
                            Column(
                              children: [
                                Container(
                                  width: 100,
                                  height: 50,
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
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Container(
                                        alignment: Alignment.centerLeft,
                                        child: Text(
                                          'BMI: ${userDetails['BMI']?.toStringAsFixed(2)}',
                                          style:
                                              Standards.fontStyles["miniWhite"],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Divider(
                            height: 18,
                            thickness: 5,
                            color: Standards.colors["primaryColorLight"]),

                        // bmi

                        Column(
                          children: [
                            Container(
                              width: 280,
                              height: 50,
                              alignment: Alignment.centerLeft,
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  colors: [
                                    Color.fromARGB(255, 124, 140, 219),
                                    Color.fromARGB(255, 83, 70, 199),
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'Starting Weight: ${userDetails['Weight']?.toStringAsFixed(2)}',
                                      style: Standards.fontStyles["miniWhite"],
                                    ),
                                  ),
                                  VerticalDivider(
                                    color: Standards.colors["whiteColor"],
                                    width: 20,
                                  ),
                                  Container(
                                    width: 50,
                                    height: 50,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      gradient: const LinearGradient(
                                        colors: [
                                          Color(0xFF5397e5),
                                          Color(0xFF155bc4),
                                        ],
                                        begin: Alignment.topLeft,
                                        end: Alignment.bottomRight,
                                        stops: [0.4, 1.0],
                                      ),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    child: Text(
                                      'KG',
                                      style: Standards.fontStyles["mainWhite"],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              width: 210,
                              height: 50,
                              alignment: Alignment.bottomLeft,
                              decoration: BoxDecoration(
                                gradient: const LinearGradient(
                                  colors: [
                                    Color.fromARGB(255, 124, 140, 219),
                                    Color.fromARGB(255, 83, 70, 199),
                                  ],
                                ),
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: SizedBox(
                                width: MediaQuery.of(context).size.width * .59,
                                height: 50,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Flexible(
                                      child: TextField(
                                        keyboardType: TextInputType.number,
                                        decoration: InputDecoration(
                                          labelText: 'Enter New Weight',
                                          labelStyle:
                                              Standards.fontStyles["tinyWhite"],
                                          border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                                color: Colors.white),
                                            borderRadius:
                                                BorderRadius.circular(15),
                                          ),
                                        ),
                                        style: Standards
                                            .Textcolor["keyboardWhite"],
                                        onChanged: (value) {
                                          setState(() {
                                            _newuserWeight =
                                                double.parse(value);
                                          });
                                        },
                                      ),
                                    ),
                                    Container(
                                      width: 50,
                                      height: 50,
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(
                                        gradient: const LinearGradient(
                                          colors: [
                                            Color(0xFF5397e5),
                                            Color(0xFF155bc4),
                                          ],
                                          begin: Alignment.topLeft,
                                          end: Alignment.bottomRight,
                                          stops: [0.4, 1.0],
                                        ),
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      child: Text(
                                        'KG',
                                        style:
                                            Standards.fontStyles["mainWhite"],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              width: 100,
                              height: 50,
                              margin: EdgeInsets.all(
                                  Standards.bounds["minimargin"]!),
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
                                      'Update',
                                      style: Standards.fontStyles["miniWhite"],
                                    ),
                                  ],
                                ),
                                onPressed: () async {
                                  await updateAccount(
                                      {"Weight": _newuserWeight});
                                },
                              ),
                            )
                          ],
                        ),

                        Divider(
                            height: 18,
                            thickness: 5,
                            color: Standards.colors["primaryColorLight"]),
                        Container(
                          decoration: BoxDecoration(
                            gradient: const LinearGradient(
                              colors: [
                                Color.fromARGB(255, 124, 140, 219),
                                Color.fromARGB(255, 83, 70, 199),
                              ],
                            ),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.77,
                            padding: EdgeInsets.all(
                                Standards.bounds["padding"] as double),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  'Weight: ',
                                  style: Standards.fontStyles["miniWhite"],
                                ),
                                Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Text(
                                        _calculateNewWeight(_newuserWeight)
                                            .toStringAsFixed(2),
                                        style:
                                            Standards.fontStyles["miniWhite"],
                                      ),
                                      Container(
                                        width: 50,
                                        height: 50,
                                        alignment: Alignment.center,
                                        decoration: BoxDecoration(
                                          gradient: const LinearGradient(
                                            colors: [
                                              Color(0xFF5397e5),
                                              Color(0xFF155bc4),
                                            ],
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                            stops: [0.4, 1.0],
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(15),
                                        ),
                                        child: Text(
                                          'KG',
                                          style:
                                              Standards.fontStyles["mainWhite"],
                                        ),
                                      ),
                                    ]),
                                Card(
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  elevation: 5,
                                  child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        _weightCategory(),
                                        style: Standards
                                            .fontStyles["smallerMainBlue"],
                                        textAlign: TextAlign.center,
                                      )),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          width: 10,
                        ),

                        Divider(
                            height: 18,
                            thickness: 5,
                            color: Standards.colors["primaryColorLight"]),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            SizedBox(
                              width: 160,
                              height: 60,
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
                                    const Icon(Icons.arrow_back_outlined,
                                        color: Colors.white),
                                    const VerticalDivider(
                                      color: Colors.transparent,
                                    ),
                                    Text(
                                      'Log Out',
                                      style: Standards.fontStyles["miniWhite"],
                                    ),
                                  ],
                                ),
                                onPressed: () {
                                  FirebaseAuth.instance.signOut().then((value) {
                                    print("Signed Out");
                                    Navigator.pop(context);
                                  });
                                },
                              ),
                            ),
                            Container(
                              width: 10,
                            ),
                            SizedBox(
                              width: 160,
                              height: 60,

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
                                      'Exercises',
                                      style: Standards.fontStyles["miniWhite"],
                                    ),
                                    const VerticalDivider(
                                      color: Colors.transparent,
                                    ),
                                    const Icon(Icons.arrow_forward_outlined,
                                        color: Colors.white),
                                  ],
                                ),
                                onPressed: () {
                                  Widget? panel;
                                  switch (
                                      userDetails['exerciseRecommendation']) {
                                    case "A1":
                                    case "A2":
                                    case "A3":
                                      panel = const A1();
                                      break;
                                    case "B1":
                                    case "B2":
                                    case "B3":
                                      panel = const A2();
                                      break;
                                    case "C1":
                                    case "C2":
                                    case "C3":
                                      panel = const A3();
                                      break;
                                    case "D1":
                                      panel = const A4();
                                      break;
                                    case "D2":
                                      panel = const A5();
                                      break;
                                    case "D3":
                                      panel = const A6();
                                      break;
                                    case "E1":
                                      panel = const A7();
                                      break;
                                    case "E2":
                                      panel = const A8();
                                      break;
                                    case "E3":
                                      panel = const A9();
                                      break;
                                  }

                                  log(
                                      name: "EXERCISE RECOMMENDATION",
                                      userDetails['exerciseRecommendation']);

                                  setState(
                                    () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => panel!,
                                        ),
                                      );
                                    },
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                        Divider(
                            height: 18,
                            thickness: 5,
                            color: Standards.colors["primaryColorLight"]),
                      ],
                    ),
                  ),
                ),
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
