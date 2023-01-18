import 'package:befit/screens/HomeProfile.dart';
import 'package:befit/screens/sign_up.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:befit/screens/resetpassword.dart';
import 'package:befit/reusable widget/reusable_widgets.dart';
import 'package:befit/standards.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _passwordTextController = TextEditingController();
  final _emailTextController = TextEditingController();

  @override
  void dispose() {
    _emailTextController.dispose();
    _passwordTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          margin: EdgeInsets.all(Standards.bounds["margin"]!),
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: SingleChildScrollView(
              child: Column(children: [
            Text(
              'Hey There',
              style: Standards.fontStyles["miniWhite"],
              textAlign: TextAlign.center,
            ),
            Text(
              'Welcome back',
              style: Standards.fontStyles["mainWhite"],
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              width: 230,
              height: 200,
              child: Image(
                image: AssetImage("assets/images/Logo1.png"),
                fit: BoxFit.fill,
              ),
            ),
            // Space between
            Container(
              height: 10,
            ),

            // Username
            reusableTextField(
                "Username", Icons.person, false, _emailTextController),
            // Space between
            const SizedBox(
              height: 20,
            ),
            // Password
            reusableTextField(
                "Password", Icons.lock, true, _passwordTextController),
            // Space between
            const SizedBox(
              height: 20,
            ),
            // Forgot passwor
            forgetPassword(context),

            // Space between

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
                    Icon(
                      Icons.login_rounded,
                      color: Standards.colors["whiteColor"],
                    ),
                    VerticalDivider(
                      color: Standards.colors["whiteColor"],
                      width: 10,
                    ),
                    Text(
                      'Login',
                      style: Standards.fontStyles["mainButtonWhite"],
                    ),
                  ],
                ),
                onPressed: () async {
                  try {
                    await FirebaseAuth.instance.signInWithEmailAndPassword(
                        email: _emailTextController.text,
                        password: _passwordTextController.text);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => Home()));
                  } on FirebaseAuthException catch (e) {
                    print(e);
                    showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            content: Text(
                                'Error! No Account found. Please check username and password'),
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
            Container(
              height: 5,
            ),
            RichText(
              text: TextSpan(
                text: "Don't have an account? ",
                style: Standards.fontStyles["titlemini"],
                children: [
                  TextSpan(
                    text: 'Create Account',
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => SignUp(),
                            ));
                      },
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.blue,
                    ),
                  ),
                ],
              ),
              textAlign: TextAlign.center,
            ),
            Container(
              height: 10,
            ),
            // Button
            // Button(context, "Login", () {
            //   FirebaseAuth.instance
            //       .signInWithEmailAndPassword(
            //           email: _emailTextController.text,
            //           password: _passwordTextController.text)
            //       .then((value) {
            //     Navigator.push(
            //         context,
            //         MaterialPageRoute(
            //             builder: (context) => HomeScreen()));
            //   }).onError((error, stackTrace) {
            //     print("Error ${error.toString()}");
            //   });
            // }),
            // Space between
          ])),
        ),
      ),
    );
  }

  Widget forgetPassword(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 35,
      alignment: Alignment.bottomRight,
      child: TextButton(
        child: const Text(
          "Forgot Password?",
          style: TextStyle(color: Colors.blue, fontSize: 15),
          textAlign: TextAlign.right,
        ),
        onPressed: () => Navigator.push(
            context, MaterialPageRoute(builder: (context) => ResetPassword())),
      ),
    );
  }
}
