import 'dart:developer';

import 'package:befit/screens/bmi_calculator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:befit/reusable widget/reusable_widgets.dart';
import 'package:befit/screens/Login.dart';
import 'package:befit/standards.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter/gestures.dart';

import '../query.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _passwordTextController = TextEditingController();
  final _confirmpasswordTextController = TextEditingController();
  final _emailTextController = TextEditingController();
  final _userNameTextController = TextEditingController();
  final textareaDOB = TextEditingController();
  DateTime currentDate = DateTime.now();
  bool terms = false;

  bool passwordConfirmed() {
    if (_passwordTextController.text == _confirmpasswordTextController.text) {
      return true;
    } else {
      return false;
    }
  }

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: currentDate,
        firstDate: DateTime(1980),
        lastDate: DateTime(2050));
    if (pickedDate != null && pickedDate != currentDate) {
      setState(() {
        currentDate = pickedDate;
      });
    }
  }

  @override
  void initState() {
    textareaDOB.text = 'Date of Birth';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Container(
          margin: EdgeInsets.all(Standards.bounds["margin"]!),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Text(
                  'Hey there',
                  style: Standards.fontStyles["miniWhite"],
                  textAlign: TextAlign.center,
                ),
                Text(
                  'Create an Account',
                  style: Standards.fontStyles["mainWhite"],
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField(
                    "Username", Icons.person, false, _userNameTextController),
                const SizedBox(
                  height: 20,
                ),
                reusableTextField(
                    "Email", Icons.email, false, _emailTextController),
                const SizedBox(
                  height: 20,
                ),

                // Birth date
                TextField(
                  controller: textareaDOB,
                  decoration: InputDecoration(
                    hintText: 'Date of Birth',
                    hintStyle: Standards.fontStyles["tinyWhite"],
                    filled: true,
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(
                          Standards.bounds["miniborderRadius"]!),
                    ),
                    prefixIcon: const Icon(
                      Icons.date_range,
                      color: Colors.blueAccent,
                    ),
                  ),
                  readOnly: true,
                  onTap: () {
                    _selectDate(context);
                    textareaDOB.text =
                        '${currentDate.day}/${currentDate.month}/${currentDate.year}';
                  },
                ),
                // Space between
                const SizedBox(
                  height: 20,
                ),

                // Space Password
                reusableTextField(
                    "Password", Icons.lock, true, _passwordTextController),
                const SizedBox(
                  height: 20,
                ),

                // Space Password
                reusableTextField("Confirm Password", Icons.lock, true,
                    _confirmpasswordTextController),

                // Space between
                const SizedBox(
                  height: 20,
                ),

                // Terms and condition

                CheckboxListTile(
                  title: Text(
                    'I agree to the Terms and Conditions',
                    style: Standards.fontStyles["miniWhite"],
                  ),
                  value: terms,
                  onChanged: (value) {
                    setState(() {
                      terms = value!;
                    });
                  },
                ),

                // Button
                Container(
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
                          'Register',
                          style: Standards.fontStyles["mainButtonWhite"],
                        ),
                      ],
                    ),
                    onPressed: () async {
                      try {
                        if (passwordConfirmed()) {
                          await FirebaseAuth.instance
                              .createUserWithEmailAndPassword(
                                  email: _emailTextController.text,
                                  password: _passwordTextController.text);
                          print("Created New Account");

                          Map<String, dynamic> userDetails = {
                            "username": _userNameTextController.text,
                            "email": _emailTextController.text,
                            "password": _passwordTextController.text,
                            "birthday": textareaDOB.text,
                          };

                          log(name: "USER DETAILS", userDetails.toString());

                          await addAccount(userDetails);

                          if (!mounted) return;
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => BMI()));
                          // Other info
                        }
                      } on FirebaseAuthException catch (e) {
                        print(e);
                        showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                content: Text(e.message.toString()),
                              );
                            });
                      }
                    },
                  ),
                ),
                Container(
                    margin: EdgeInsets.only(top: Standards.bounds["margin"]!),
                    child: Row(children: const <Widget>[
                      Expanded(child: Divider()),
                      Text(
                        'Or',
                        style: TextStyle(
                          color: Colors.blue,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Expanded(child: Divider()),
                    ])),
                Container(
                  // margin: EdgeInsets.only(top: Standards.bounds["margin"]!),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: const FaIcon(
                          FontAwesomeIcons.facebookSquare,
                          color: Colors.blue,
                        ),
                        onPressed: () {
                          // TODO: implement facebook login
                          print('Facebook Login Button Pressed');
                        },
                      ),
                      IconButton(
                        icon: const FaIcon(
                          FontAwesomeIcons.googlePlusSquare,
                          color: Colors.red,
                        ),
                        onPressed: () {
                          // TODO: implement google login
                          print('Google Login Button Pressed');
                        },
                      ),
                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                    text: "Already have an account? ",
                    style: Standards.fontStyles["tinyWhite"],
                    children: [
                      TextSpan(
                        text: 'Login',
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Login(),
                                ));
                          },
                        style: TextStyle(
                          color: Colors.blue,
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.center,
                ),
                // Button(context, "Sign Up", () {
                //   FirebaseAuth.instance
                //       .createUserWithEmailAndPassword(
                //           email: _emailTextController.text,
                //           password: _passwordTextController.text)
                //       .then((value) {
                //     print("Created New Account");
                //     Navigator.push(context,
                //         MaterialPageRoute(builder: (context) => HomeScreen()));
                //   }).onError((error, stackTrace) {
                //     print("Error ${error.toString()}");
                //   });
                // })
              ],
            ),
          )),
    );
  }
}
