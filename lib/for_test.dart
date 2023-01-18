// // THIS IS FOR TESTING THE SCREENS ROUTER
// import 'package:flutter/material.dart';
// import 'package:befit/standards.dart';
// import 'package:befit/app.dart';

// class ForTest extends StatefulWidget {
//   @override
//   _ForTestState createState() => _ForTestState();
// }

// class _ForTestState extends State<ForTest> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         padding: EdgeInsets.all(Standards.bounds["padding"] as double),
//         constraints: const BoxConstraints.expand(),
//         width: MediaQuery.of(context).size.width,
//         height: MediaQuery.of(context).size.height * 0.5,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             Container(
//               width: MediaQuery.of(context).size.width * 0.8,
//               height: 200,
//               decoration: const BoxDecoration(
//                 image: DecorationImage(
//                   image: NetworkImage(
//                     'https://img.freepik.com/free-vector/developer-laptop-computer-with-open-robotic-soft-open-automation-architecture-open-source-robotics-soft-free-development-concept_335657-1900.jpg?t=st=1651211429~exp=1651212029~hmac=1fbd046618ee0f44f3c6efe2756abdff65e4beb7ae16cbdc91c36a923c11a4ca&w=740',
//                   ),
//                   fit: BoxFit.cover,
//                 ),
//               ),
//             ),
//             Text(
//               'BeFit Routes Tester',
//               style: Standards.fontStyles["mainColored"],
//             ),
//             const Divider(
//               color: Colors.black,
//               height: 20.0,
//             ),
//             SizedBox(
//               width: 250,
//               child: Text(
//                 'Click the button below "Initial Setup" to test, initial setup of the application.',
//                 style: Standards.fontStyles["subtitle"],
//                 textAlign: TextAlign.center,
//               ),
//             ),
//             // Button for Initial Setup
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(
//                           Standards.bounds["borderRadius"] as double),
//                     ),
//                     primary: Standards.colors["primaryColorDark"],
//                     elevation: 5,
//                   ),
//                   child: Row(
//                     children: [
//                       Text(
//                         'Initial Setup',
//                         style: Standards.fontStyles["smallerMainWhite"],
//                       ),
//                       Icon(
//                         Icons.arrow_downward,
//                         color: Standards.colors["whiteColor"],
//                       ),
//                     ],
//                   ),
//                   onPressed: () {
//                     Navigator.pushNamed(context, '/setup');
//                   },
//                 ),
//               ],
//             ),
//             const Divider(
//               color: Colors.black,
//               height: 20.0,
//             ),
//             SizedBox(
//               width: 250,
//               child: Text(
//                 'Click the button below "Returning User" to test, is someone is already logged in',
//                 style: Standards.fontStyles["subtitle"],
//                 textAlign: TextAlign.center,
//               ),
//             ),
//             // Button for Returning User
//             Row(
//               mainAxisAlignment: MainAxisAlignment.center,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 ElevatedButton(
//                   style: ElevatedButton.styleFrom(
//                     primary: Standards.colors["primaryColorDark"],
//                     elevation: 5,
//                     shape: RoundedRectangleBorder(
//                       borderRadius: BorderRadius.circular(
//                           Standards.bounds["borderRadius"] as double),
//                     ),
//                   ),
//                   child: Row(
//                     children: [
//                       Text(
//                         'Returning User',
//                         style: Standards.fontStyles["smallerMainWhite"],
//                       ),
//                       Icon(
//                         Icons.arrow_downward,
//                         color: Standards.colors["whiteColor"],
//                       ),
//                     ],
//                   ),
//                   onPressed: () {
//                     Navigator.pushNamed(context, '/home');
//                   },
//                 ),
//               ],
//             ),
//             const Divider(
//               color: Colors.black,
//               height: 10.0,
//             ),
//             SizedBox(
//               width: 250,
//               child: Text(
//                 'Note: This is not part of the final application, use this to test the routes.',
//                 style: Standards.fontStyles["subtitle"],
//                 textAlign: TextAlign.center,
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
