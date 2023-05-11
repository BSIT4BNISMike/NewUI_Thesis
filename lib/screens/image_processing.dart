import 'dart:io';
import 'package:befit/main.dart';
import 'package:befit/screens/bmi_calculator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tflite/tflite.dart';
import 'package:image_picker/image_picker.dart';
import 'package:befit/standards.dart';

class ImageProcessing extends StatefulWidget {
  @override
  _ImageProcessingState createState() => _ImageProcessingState();
}

class _ImageProcessingState extends State<ImageProcessing> {
  bool _loading = true;
  late File _image;
  late List _output;
  final picker = ImagePicker(); //allows us to pick image from gallery or camera

  @override
  void initState() {
    //initS is the first function that is executed by default when this class is called
    super.initState();
  }

  @override
  void dispose() {
    //dis function disposes and clears our memory
    super.dispose();
    Tflite.close();
  }

  classifyImage(File image) async {
    try {
      //this function runs the model on the image
      var output = await Tflite.runModelOnImage(
        path: image.path,
        numResults:
            3, //the amount of categories our neural network can predict (here no. of Body Types)
        threshold: 0.5,
        imageMean: 127.5,
        imageStd: 127.5,
      );
      setState(() {
        _output = output!;
        _loading = false;
      });
    } catch (e) {
      String e = 'please select take another photo';
      print(e);
    }
  }

  loadModel() async {
    //this function loads our model
    try {
      await Tflite.loadModel(
        model: 'assets/model_unquant.tflite',
        labels: 'assets/labels.txt',
      );
    } on PlatformException {
      print("Failed to load the model");
    }
  }

// permission to camera
  pickImage() async {
    //this function to grab the image from camera
    var image = await picker.pickImage(source: ImageSource.camera);
    if (image == null) return null;

    await loadModel();

    setState(() {
      _image = File(image.path);
    });
    classifyImage(_image);
  }

  // permission to video

  pickGalleryImage() async {
    //this function to grab the image from gallery
    var image = await picker.pickImage(source: ImageSource.gallery);
    if (image == null) return null;
    // init classificationn model
    // loading
    // display result
    setState(() {
      _image = File(image.path);
    });
    classifyImage(_image);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Body Type Classification',
            style: TextStyle(
              color: Standards.colors["whiteColor"],
              fontWeight: FontWeight.w500,
              fontSize: 23,
            ),
          ),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
            color: Standards.colors["backColor"],
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Standards.colors["whiteColor"],
                borderRadius: BorderRadius.circular(30),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.width * .73,
                    width: MediaQuery.of(context).size.width * .76,
                    decoration: BoxDecoration(
                      color: Standards.colors["blueColor"],
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Container(
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(10),
                      child: Center(
                        child: _loading == true
                            ? null //show nothing if no picture selected
                            : Container(
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height:
                                          MediaQuery.of(context).size.width *
                                              .55,
                                      width: MediaQuery.of(context).size.width *
                                          .55,
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(15),
                                        child: Image.file(
                                          _image,
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),

                                    Divider(
                                        height: 18,
                                        thickness: 5,
                                        color: Standards
                                            .colors["primaryColorLight"]),

                                    // ignore: unnecessary_null_comparison
                                    _output != null && _output.length > 0
                                        ? Text(
                                            'Body Type is: ${_output[0]['label']}',
                                            style: Standards
                                                .fontStyles["microWhite"],
                                          )
                                        : Container(),
                                    // TODO, add UI to show error message
                                  ],
                                ),
                              ),
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Divider(
                          height: 18,
                          thickness: 5,
                          color: Standards.colors["primaryColorLight"]),
                    ],
                  ),
                  Container(
                    height: MediaQuery.of(context).size.width * .32,
                    width: MediaQuery.of(context).size.width * .76,
                    decoration: BoxDecoration(
                      color: Standards.colors["backColor"],
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          child: Text(
                              'Note: Please stand 1 meter away and arms at you side  and ensure that when you are taking a picture of your body (from head to toe) is perfectly seen in the frame.',
                              style: Standards.fontStyles["tinyWhite"],
                              textAlign: TextAlign.center),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Divider(
                          height: 18,
                          thickness: 5,
                          color: Standards.colors["primaryColorLight"]),
                      const SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: pickImage,
                            child: Container(
                              width: 135,
                              height: 60,
                              alignment: Alignment.center,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              decoration: BoxDecoration(
                                color: Standards.colors["blueColor"],
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Text('Take A Photo',
                                  style: Standards.fontStyles["microWhite"]),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          GestureDetector(
                            onTap: pickGalleryImage,
                            child: Container(
                              width: 135,
                              height: 60,
                              alignment: Alignment.center,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 5),
                              decoration: BoxDecoration(
                                color: Standards.colors["blueColor"],
                                borderRadius: BorderRadius.circular(15),
                              ),
                              child: Text('Gallery',
                                  style: Standards.fontStyles["miniWhite"]),
                            ),
                          ),
                        ],
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.90,
                        margin:
                            EdgeInsets.only(top: Standards.bounds["margin"]!),
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
                                'Done',
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
                                Navigator.pop(context);
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
