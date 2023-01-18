import 'dart:developer';

import 'package:befit/query.dart';
import 'package:flutter/material.dart';
import 'package:befit/standards.dart';

class FinalQuestion extends StatefulWidget {
  final bodyType;
  // Change variable name - temp
  final temp;
  const FinalQuestion({super.key, this.bodyType, this.temp});

  @override
  _FinalQuestionState createState() => _FinalQuestionState();
}

class _FinalQuestionState extends State<FinalQuestion> {
  // TODO: Implement Proper Questions
  final _listQuestions = [
    {
      'id': 1,
      'question':
          'Based on the Health checklist, Did you picked yes from the choices? and do you participate on regular exercises? '
    },
  ];

  Map<String, bool> answerBox = {
    'q1A1': false,
    'q1A2': false,
    'q1A3': false,
    'q1A4': false,
    'q1A5': false,
  };

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
        title: Text(
          'Confirmation',
          style: Standards.fontStyles["mainWhite"],
        ),
      ),
      body: Container(
        padding: EdgeInsets.all(Standards.bounds["padding"] as double),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              'Please select the appropriate answer Honestly.',
              style: Standards.fontStyles["subtitle"],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 10, bottom: 10),
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  // 80% of the Profile Page
                  child: ListView.builder(
                    itemCount: _listQuestions.length,
                    itemBuilder: (BuildContext context, index) {
                      return ListTile(
                        leading: Text(
                          'Q${_listQuestions[index]['id']}:',
                          style: Standards.fontStyles["subtitle"],
                        ),
                        title: Text(
                          '${_listQuestions[index]['question']}',
                          style: Standards.fontStyles["smallerMain"],
                        ),
                        // TODO: Implement Answer Database
                        subtitle: SizedBox(
                          child: Column(
                            children: [
                              // Choice 1
                              Visibility(
                                visible: widget.temp,
                                child: Row(
                                  children: [
                                    // checkbox
                                    Checkbox(
                                      value: answerBox[
                                          'q${_listQuestions[index]['id']}A1'],
                                      onChanged: (bool? value) {
                                        setState(
                                          () {
                                            // Check the box of the chosen answer
                                            answerBox[
                                                    'q${_listQuestions[index]['id']}A1'] =
                                                !answerBox[
                                                    'q${_listQuestions[index]['id']}A1']!;
                                            // if the other answer is selected, uncheck it
                                            if (answerBox[
                                                    'q${_listQuestions[index]['id']}A2'] ==
                                                true) {
                                              answerBox[
                                                      'q${_listQuestions[index]['id']}A2'] =
                                                  !answerBox[
                                                      'q${_listQuestions[index]['id']}A2']!;
                                            }
                                            if (answerBox[
                                                    'q${_listQuestions[index]['id']}A3'] ==
                                                true) {
                                              answerBox[
                                                      'q${_listQuestions[index]['id']}A3'] =
                                                  !answerBox[
                                                      'q${_listQuestions[index]['id']}A3']!;
                                            }
                                            if (answerBox[
                                                    'q${_listQuestions[index]['id']}A4'] ==
                                                true) {
                                              answerBox[
                                                      'q${_listQuestions[index]['id']}A4'] =
                                                  !answerBox[
                                                      'q${_listQuestions[index]['id']}A4']!;
                                            }
                                            if (answerBox[
                                                    'q${_listQuestions[index]['id']}A5'] ==
                                                true) {
                                              answerBox[
                                                      'q${_listQuestions[index]['id']}A5'] =
                                                  !answerBox[
                                                      'q${_listQuestions[index]['id']}A5']!;
                                            }
                                          },
                                        );
                                      },
                                    ),

                                    Expanded(
                                      child: Text(
                                        'Yes, and without medical clearance or approval from physician (to initiate physical activity regime).',
                                        style: Standards.fontStyles["subtitle"],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              Container(
                                height: 15,
                              ),
                              // Choice 2
                              Visibility(
                                visible: widget.temp,
                                child: Row(
                                  children: [
                                    // checkbox
                                    Checkbox(
                                      value: answerBox[
                                          'q${_listQuestions[index]['id']}A2'],
                                      onChanged: (bool? value) {
                                        setState(
                                          () {
                                            // Check the box of the chosen answer
                                            answerBox[
                                                    'q${_listQuestions[index]['id']}A2'] =
                                                !answerBox[
                                                    'q${_listQuestions[index]['id']}A2']!;
                                            // if the other answer is selected, uncheck it
                                            if (answerBox[
                                                    'q${_listQuestions[index]['id']}A1'] ==
                                                true) {
                                              answerBox[
                                                      'q${_listQuestions[index]['id']}A1'] =
                                                  !answerBox[
                                                      'q${_listQuestions[index]['id']}A1']!;
                                            }
                                            if (answerBox[
                                                    'q${_listQuestions[index]['id']}A3'] ==
                                                true) {
                                              answerBox[
                                                      'q${_listQuestions[index]['id']}A3'] =
                                                  !answerBox[
                                                      'q${_listQuestions[index]['id']}A3']!;
                                            }
                                            if (answerBox[
                                                    'q${_listQuestions[index]['id']}A4'] ==
                                                true) {
                                              answerBox[
                                                      'q${_listQuestions[index]['id']}A4'] =
                                                  !answerBox[
                                                      'q${_listQuestions[index]['id']}A4']!;
                                            }
                                            if (answerBox[
                                                    'q${_listQuestions[index]['id']}A5'] ==
                                                true) {
                                              answerBox[
                                                      'q${_listQuestions[index]['id']}A5'] =
                                                  !answerBox[
                                                      'q${_listQuestions[index]['id']}A5']!;
                                            }
                                          },
                                        );
                                      },
                                    ),
                                    Expanded(
                                      child: Text(
                                        'Yes, but with medical clearance or approval from physician and participate in regular exercise',
                                        style: Standards.fontStyles["subtitle"],
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              Container(
                                height: 15,
                              ), //Choice 3
                              Visibility(
                                visible: widget.temp,
                                child: Row(
                                  children: [
                                    // checkbox
                                    Checkbox(
                                      value: answerBox[
                                          'q${_listQuestions[index]['id']}A3'],
                                      onChanged: (bool? value) {
                                        setState(
                                          () {
                                            // Check the box of the chosen answer
                                            answerBox[
                                                    'q${_listQuestions[index]['id']}A3'] =
                                                !answerBox[
                                                    'q${_listQuestions[index]['id']}A3']!;
                                            // if the other answer is selected, uncheck it
                                            if (answerBox[
                                                    'q${_listQuestions[index]['id']}A2'] ==
                                                true) {
                                              answerBox[
                                                      'q${_listQuestions[index]['id']}A2'] =
                                                  !answerBox[
                                                      'q${_listQuestions[index]['id']}A2']!;
                                            }
                                            if (answerBox[
                                                    'q${_listQuestions[index]['id']}A1'] ==
                                                true) {
                                              answerBox[
                                                      'q${_listQuestions[index]['id']}A1'] =
                                                  !answerBox[
                                                      'q${_listQuestions[index]['id']}A1']!;
                                            }
                                            if (answerBox[
                                                    'q${_listQuestions[index]['id']}A4'] ==
                                                true) {
                                              answerBox[
                                                      'q${_listQuestions[index]['id']}A4'] =
                                                  !answerBox[
                                                      'q${_listQuestions[index]['id']}A4']!;
                                            }
                                            if (answerBox[
                                                    'q${_listQuestions[index]['id']}A5'] ==
                                                true) {
                                              answerBox[
                                                      'q${_listQuestions[index]['id']}A5'] =
                                                  !answerBox[
                                                      'q${_listQuestions[index]['id']}A5']!;
                                            }
                                          },
                                        );
                                      },
                                    ),
                                    Expanded(
                                      child: Text(
                                        'Yes, but with medical clearance or approval from physician but does not participate in regular exercise',
                                        style: Standards.fontStyles["subtitle"],
                                      ),
                                    ),
                                  ],
                                ),
                              ),

                              //choice 4
                              Visibility(
                                visible: !widget.temp,
                                child: Row(
                                  children: [
                                    // checkbox
                                    Checkbox(
                                      value: answerBox[
                                          'q${_listQuestions[index]['id']}A4'],
                                      onChanged: (bool? value) {
                                        setState(
                                          () {
                                            // Check the box of the chosen answer
                                            answerBox[
                                                    'q${_listQuestions[index]['id']}A4'] =
                                                !answerBox[
                                                    'q${_listQuestions[index]['id']}A4']!;
                                            // if the other answer is selected, uncheck it
                                            if (answerBox[
                                                    'q${_listQuestions[index]['id']}A2'] ==
                                                true) {
                                              answerBox[
                                                      'q${_listQuestions[index]['id']}A2'] =
                                                  !answerBox[
                                                      'q${_listQuestions[index]['id']}A2']!;
                                            }
                                            if (answerBox[
                                                    'q${_listQuestions[index]['id']}A3'] ==
                                                true) {
                                              answerBox[
                                                      'q${_listQuestions[index]['id']}A3'] =
                                                  !answerBox[
                                                      'q${_listQuestions[index]['id']}A3']!;
                                            }
                                            if (answerBox[
                                                    'q${_listQuestions[index]['id']}A1'] ==
                                                true) {
                                              answerBox[
                                                      'q${_listQuestions[index]['id']}A1'] =
                                                  !answerBox[
                                                      'q${_listQuestions[index]['id']}A1']!;
                                            }
                                            if (answerBox[
                                                    'q${_listQuestions[index]['id']}A5'] ==
                                                true) {
                                              answerBox[
                                                      'q${_listQuestions[index]['id']}A5'] =
                                                  !answerBox[
                                                      'q${_listQuestions[index]['id']}A5']!;
                                            }
                                          },
                                        );
                                      },
                                    ),
                                    Expanded(
                                      child: Text(
                                        'No, and participate in regular exercises',
                                        style: Standards.fontStyles["subtitle"],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              //choice 4
                              Container(
                                height: 15,
                              ),
                              Visibility(
                                visible: !widget.temp,
                                child: Row(
                                  children: [
                                    // checkbox
                                    Checkbox(
                                      value: answerBox[
                                          'q${_listQuestions[index]['id']}A5'],
                                      onChanged: (bool? value) {
                                        setState(
                                          () {
                                            // Check the box of the chosen answer
                                            answerBox[
                                                    'q${_listQuestions[index]['id']}A5'] =
                                                !answerBox[
                                                    'q${_listQuestions[index]['id']}A5']!;
                                            // if the other answer is selected, uncheck it
                                            if (answerBox[
                                                    'q${_listQuestions[index]['id']}A2'] ==
                                                true) {
                                              answerBox[
                                                      'q${_listQuestions[index]['id']}A2'] =
                                                  !answerBox[
                                                      'q${_listQuestions[index]['id']}A2']!;
                                            }
                                            if (answerBox[
                                                    'q${_listQuestions[index]['id']}A3'] ==
                                                true) {
                                              answerBox[
                                                      'q${_listQuestions[index]['id']}A3'] =
                                                  !answerBox[
                                                      'q${_listQuestions[index]['id']}A3']!;
                                            }
                                            if (answerBox[
                                                    'q${_listQuestions[index]['id']}A1'] ==
                                                true) {
                                              answerBox[
                                                      'q${_listQuestions[index]['id']}A1'] =
                                                  !answerBox[
                                                      'q${_listQuestions[index]['id']}A1']!;
                                            }
                                            if (answerBox[
                                                    'q${_listQuestions[index]['id']}A4'] ==
                                                true) {
                                              answerBox[
                                                      'q${_listQuestions[index]['id']}A4'] =
                                                  !answerBox[
                                                      'q${_listQuestions[index]['id']}A4']!;
                                            }
                                          },
                                        );
                                      },
                                    ),
                                    Expanded(
                                      child: Text(
                                        'No, but does not participate in regular exercises',
                                        style: Standards.fontStyles["subtitle"],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              //choice 5

                              Divider(
                                thickness: 5.0,
                                color: Standards.colors["primaryColorLight"],
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),
            // Submit Button
            Container(
              width: MediaQuery.of(context).size.width * 0.90,
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
                      'Submit',
                      style: Standards.fontStyles["mainButtonWhite"],
                    ),
                    const VerticalDivider(
                      color: Colors.transparent,
                    ),
                    const Icon(Icons.arrow_forward_outlined,
                        color: Colors.white),
                  ],
                ),
                onPressed: () async {
                  var bodyType = widget.bodyType;
                  var hasCondition = widget.temp;
                  var exerciseType = null;

                  if (hasCondition) {
                    if (answerBox['q1A1'] == true) {
                      exerciseType = 'A';
                    } else if (answerBox['q1A2'] == true) {
                      exerciseType = 'B';
                    } else if (answerBox['q1A3'] == true) {
                      exerciseType = 'C';
                    }
                  } else if (!hasCondition) {
                    if (answerBox['q1A4'] == true) {
                      exerciseType = 'D';
                    } else if (answerBox['q1A5'] == true) {
                      exerciseType = 'E';
                    }
                  }

                  print(bodyType);
                  print(hasCondition);
                  print(exerciseType);

                  if (exerciseType != null) {
                    log(
                        name: "EXERCISE RECOMMENDATION",
                        "$exerciseType$bodyType");
                    await updateAccount(
                        {"exerciseRecommendation": "$exerciseType$bodyType"});

                    if (!mounted) return;
                    Navigator.popUntil(context, ModalRoute.withName('/setup'));
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
