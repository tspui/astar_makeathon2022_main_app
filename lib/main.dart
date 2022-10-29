import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:main_app_xphysio/model/exercise_list.dart';
import 'package:main_app_xphysio/screens/general_exercise.dart';
import 'package:main_app_xphysio/screens/instructionpreview.dart';
import 'package:main_app_xphysio/screens/physiolist.dart';
import 'package:firebase_core/firebase_core.dart';
import 'screens/exercise21.dart';
import 'screens/motion21.dart';
import 'firebase_options.dart';

import 'dart:io';
import 'dart:typed_data';

import 'package:body_detection/models/image_result.dart';
import 'package:body_detection/models/pose.dart';
import 'package:body_detection/models/body_mask.dart';
import 'package:body_detection/png_image.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

import 'package:body_detection/body_detection.dart';
import 'package:permission_handler/permission_handler.dart';

import 'pose_mask_painter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final items = Exercise.getExercises();

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.lightGreen,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        '/': (context) => HomePage(),
        '/exercise21': (context) => Exercise21Days(),
        '/motion21': (context) => Motion21Days(),
        '/physiolist': (context) => PhysioList(),
        '/generalexercise': (context) => GeneralExercise(),

      },

    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            "Dashboard",
            style: TextStyle(color: Colors.black, fontSize: 23, fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.lightGreen,
        ),
        body:
        SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
                child: Text("21 Days Habit Tracker", style: TextStyle(fontSize: 26, fontFamily: "Poppins", fontWeight: FontWeight.bold),),
              ),
              Row(
                children: [
                  Padding(
                      padding: EdgeInsets.fromLTRB(25, 30, 0, 0),
                      child: GestureDetector(
                        onTap: (){goExercise(context);},
                        child: Container(
                          width: 170.0,
                          height: 170.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20.0),
                            ),
                            color: Color(0xFFE8E8E8),
                          ),
                          child: Center(
                            child: SizedBox(
                              height: 100,
                              width: 200,
                              child: Image.asset(
                                  "images/new.png"
                              ),
                            ),
                          ),
                        ),
                      )),
                  Padding(
                      padding: EdgeInsets.fromLTRB(25, 30, 0, 0),
                      child: GestureDetector(
                        onTap: (){goMotion(context);},
                        child: Container(
                          width: 170.0,
                          height: 170.0,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(
                              Radius.circular(20.0),
                            ),
                            color: Color(0xFFE8E8E8),
                          ),
                          child: Center(
                            child: SizedBox(
                              width: 220,
                              height: 120,
                              child: Image.asset(
                                "images/flex.png",
                              ),
                            ),
                          ),
                        ),
                      ))
                ],
              ),
              Row(
                children: [
                  Padding(
                      padding: EdgeInsets.fromLTRB(25, 20, 0, 0),
                      child: Container(
                        width: 170.0,
                        height: 170.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20.0),
                          ),
                          color: Color(0xFFE8E8E8),
                        ),
                        child: Center(
                          child: SizedBox(
                            height: 80,
                            width: 150,
                            child: Image.asset(
                                "images/heart.png"
                            ),
                          ),
                        ),
                      )),
                  Padding(
                      padding: EdgeInsets.fromLTRB(25, 20, 0, 0),
                      child: Container(
                        width: 170.0,
                        height: 170.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20.0),
                          ),
                          color: Color(0xFFE8E8E8),
                        ),
                        child:
                        Center(
                          child: SizedBox(
                            width: 220,
                            height: 120,
                            child: Image.asset(
                              "images/waternew.jpg",
                            ),
                          ),
                        ),
                      ))
                ],
              ),
              Row(
                children: [
                  Padding(
                      padding: EdgeInsets.fromLTRB(25, 20, 0, 0),
                      child: Container(
                        width: 170.0,
                        height: 170.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20.0),
                          ),
                          color: Color(0xFFE8E8E8),
                        ),
                        child: Center(
                          child: SizedBox(
                            height: 80,
                            width: 150,
                            child: Image.asset(
                                "images/vege.jpg"
                            ),
                          ),
                        ),
                      )),
                  Padding(
                      padding: EdgeInsets.fromLTRB(25, 20, 0, 0),
                      child: Container(
                        width: 170.0,
                        height: 170.0,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(20.0),
                          ),
                          color: Color(0xFFE8E8E8),
                        ),
                        child: Center(
                          child: SizedBox(
                            width: 200,
                            height: 100,
                            child: Image.asset(
                              "images/bed.png",
                            ),
                          ),
                        ),
                      ))
                ],
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(0, 40, 0, 0),
                child: Text("Vendors", style: TextStyle(fontSize: 26, fontFamily: "Poppins", fontWeight: FontWeight.bold),),
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(20, 20, 20, 30),
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Container(
                    width: 620.0,
                    height: 150.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(
                        Radius.circular(20.0),
                      ),
                      color: Color(0xFFE8E8E8),
                    ),
                    child:
                    Row(
                      children: [
                        Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(20, 20, 0, 0),
                              child: GestureDetector(
                                onTap: (){goPhysioList(context);},
                                child: Container(
                                  width: 90,
                                  height: 90,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    image: DecorationImage(
                                      image: AssetImage(
                                          'images/physio.jpeg'),
                                      fit: BoxFit.fitHeight,
                                    ),
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
                              child: Text("Physiotherapists", style: TextStyle(fontSize: 12, fontFamily: "Poppins", fontWeight: FontWeight.bold)),
                            ),

                          ],
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(20, 20, 0, 0),
                              child: Container(
                                width: 90,
                                height: 90,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  image: DecorationImage(
                                    image: AssetImage(
                                        'images/yoga.jpg'),
                                    fit: BoxFit.fitHeight,
                                  ),
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
                              child: Text("Yoga", style: TextStyle(fontSize: 12, fontFamily: "Poppins", fontWeight: FontWeight.bold)),
                            ),

                          ],
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(20, 20, 0, 0),
                              child: Container(
                                width: 90,
                                height: 90,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  image: DecorationImage(
                                    image: AssetImage(
                                        'images/company.jpeg'),
                                    fit: BoxFit.fitHeight,
                                  ),
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
                              child: Text("Company Wellness", style: TextStyle(fontSize: 12, fontFamily: "Poppins", fontWeight: FontWeight.bold)),
                            ),

                          ],
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(20, 20, 0, 0),
                              child: Container(
                                width: 90,
                                height: 90,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  image: DecorationImage(
                                    image: AssetImage(
                                        'images/school.jpg'),
                                    fit: BoxFit.fitHeight,
                                  ),
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
                              child: Text("School Wellness", style: TextStyle(fontSize: 12, fontFamily: "Poppins", fontWeight: FontWeight.bold)),
                            ),

                          ],
                        ),
                        Column(
                          children: [
                            Padding(
                              padding: EdgeInsets.fromLTRB(20, 20, 0, 0),
                              child: Container(
                                width: 90,
                                height: 90,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  image: DecorationImage(
                                    image: AssetImage(
                                        'images/others.jpeg'),
                                    fit: BoxFit.fitHeight,
                                  ),
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.fromLTRB(20, 10, 0, 0),
                              child: Text("Others", style: TextStyle(fontSize: 12, fontFamily: "Poppins", fontWeight: FontWeight.bold)),
                            ),

                          ],
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        )



    );
  }

}

void goExercise(BuildContext context) {
  Navigator.pushNamed(context, '/exercise21');
}

void goMotion(BuildContext context) {
  Navigator.pushNamed(context, '/motion21');
}

void goPhysioList(BuildContext context) {
  Navigator.pushNamed(context, '/physiolist');
}
