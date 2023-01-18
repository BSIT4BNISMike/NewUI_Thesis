import 'package:befit/main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:befit/reusable widget/reusable_widgets.dart';
import 'package:befit/standards.dart';

class ResetPassword extends StatefulWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  _ResetPasswordState createState() => _ResetPasswordState();
}

class _ResetPasswordState extends State<ResetPassword> {
  TextEditingController _emailTextController = TextEditingController();
  @override
  void dispose() {
    _emailTextController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      body: Container(
        margin: EdgeInsets.all(Standards.bounds["margin"]!),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Forgot Password?',
              style: Standards.fontStyles["mainWhite"],
              textAlign: TextAlign.center,
            ),
            Text(
              'Enter Email address',
              style: Standards.fontStyles["titlemini"],
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 20,
            ),
            reusableTextField(
                "Email", Icons.person_outline, false, _emailTextController),
            const SizedBox(
              height: 20,
            ),

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
                        Icons.key_rounded,
                        color: Standards.colors["whiteColor"],
                      ),
                      VerticalDivider(
                        color: Standards.colors["whiteColor"],
                        width: 10,
                      ),
                      Text(
                        'Reset Password',
                        style: Standards.fontStyles["mainButtonWhite"],
                      ),
                    ],
                  ),
                  onPressed: () async {
                    try {
                      await FirebaseAuth.instance.sendPasswordResetEmail(
                          email: _emailTextController.text);
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              content: Text(
                                  'Password reset link sent! Check your email'),
                            );
                          });
                    } on FirebaseAuthException catch (e) {
                      print(e);
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              content: Text(
                                  'Error! No Account found. Please recheck the email address'),
                            );
                          });
                    }
                  }),
            ),

            // Button(context, "Reset Password", () {
            //   FirebaseAuth.instance
            //       .sendPasswordResetEmail(email: _emailTextController.text)
            //       .then((value) => Navigator.of(context).pop());
            // })
          ],
        ),
      ),
    );
  }
}
