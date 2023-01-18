import 'dart:developer';
import 'dart:io';
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:path_provider/path_provider.dart';

Future<void> addAccount(Map<String, dynamic> userDetails) async {
  var uid = FirebaseAuth.instance.currentUser!.uid;

  var usersCollection = FirebaseFirestore.instance.collection('users');
  await usersCollection.doc(uid).set(userDetails);
}

Future<void> updateAccount(Map<String, dynamic> userDetails) async {
  var uid = FirebaseAuth.instance.currentUser!.uid;

  var usersCollection = FirebaseFirestore.instance.collection('users');
  await usersCollection.doc(uid).set(userDetails, SetOptions(merge: true));
}

Future<DocumentSnapshot<Map<String, dynamic>>> getUserDetails() async {
  var uid = FirebaseAuth.instance.currentUser!.uid;

  var usersCollection = FirebaseFirestore.instance.collection('users');
  var userDetails = await usersCollection.doc(uid).get();

  return userDetails;
}

Future<List<Map<String, dynamic>>> downloadFeedbacks(
    var exercise, var week) async {
  log(exercise);
  var email = FirebaseAuth.instance.currentUser!.email;
  var subfolders = ['txt', 'video'];
  List<Map<String, dynamic>> feedbacks = [];

  int num = week == "1st"
      ? 7
      : week == "2nd"
          ? 14
          : 21;

  for (int i = 1; i <= num; i++) {
    String url = "";
    late Reference ref;
    for (var subfolder in subfolders) {
      final path = '$email/${week}_week/$exercise/Feedback/$i/$subfolder';

      final files = await FirebaseStorage.instance.ref(path).listAll();
      if (files.items.isEmpty) return feedbacks;

      for (var item in files.items) {
        if (subfolder == 'video') {
          url = await item.getDownloadURL();
          log(url);
        } else {
          ref = item;
          final dir = await getTemporaryDirectory();
          await Directory('${dir.absolute.path}/$path').create(recursive: true);
          final file = File('${dir.path}/${item.fullPath}');
          await item.writeToFile(file);
          log(File('${dir.path}/${item.fullPath}').path);
        }
      }
    }
    feedbacks.add({"txt": ref, "video": url});
  }

  log(feedbacks.toString());

  return feedbacks;
}
