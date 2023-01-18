import 'package:flutter/material.dart';
import 'package:befit/standards.dart';
import 'package:befit/screens/health_checklist.dart';

class TypeChecklist extends StatefulWidget {
  @override
  _TypeChecklistState createState() => _TypeChecklistState();
}

class _TypeChecklistState extends State<TypeChecklist> {
  // TODO: Implement Proper Questions
  final _listQuestions = [
    {
      'id': 1,
      'question': 'Based on the classification Feature what is your body type?'
    },
  ];

  Map<String, bool> answerBox = {
    'q1A1': false,
    'q1A2': false,
    'q1A3': false,
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
          'Body Type Checklist',
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
              'Please select the appropriate answer.',
              style: Standards.fontStyles["subtitle"],
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              // 80% of the Profile Page
              height: MediaQuery.of(context).size.height * 0.7,
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
                          Row(
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
                                    },
                                  );
                                },
                              ),
                              Text(
                                'ECTOMORPH',
                                style: Standards.fontStyles["subtitle"],
                              ),
                            ],
                          ),
                          // Choice 2
                          Row(
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
                                    },
                                  );
                                },
                              ),
                              //choice 3
                              Text(
                                'MESOMORPH',
                                style: Standards.fontStyles["subtitle"],
                              ),
                            ],
                          ),
                          Row(
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
                                    },
                                  );
                                },
                              ),
                              Text(
                                'ENDOMORPH',
                                style: Standards.fontStyles["subtitle"],
                              ),
                            ],
                          ),
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
            // Submit Button
            Container(
              width: MediaQuery.of(context).size.width * 0.90,
              // margin: EdgeInsets.only(top: Standards.bounds["margin"]!),
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
                onPressed: () {
                  setState(
                    () {
                      var bodyType = null;
                      if (answerBox['q1A1'] == true) {
                        bodyType = 1;
                      } else if (answerBox['q1A2'] == true) {
                        bodyType = 2;
                      } else if (answerBox['q1A3'] == true) {
                        bodyType = 3;
                      }

                      print(bodyType);

                      if (bodyType != null) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                HealthChecklist(bodyType: bodyType),
                          ),
                        );
                      }
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
