import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:gets_app/data.dart';
import 'package:gets_app/screens/step2screen.dart';
import 'package:gets_app/widgets/custom_headers.dart';
import 'package:image_picker/image_picker.dart' show ImagePicker, ImageSource, XFile;

import 'homepage.dart';
import 'image_upload_service.dart';


class CompleteTask extends StatefulWidget {
  const CompleteTask({super.key});

  @override
  State<CompleteTask> createState() => _CompleteTaskScreenState();
}
// const Detailpage({ required this.animal});

class _CompleteTaskScreenState extends State<CompleteTask> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              title: const Text('Completed Task',
                style: TextStyle(color: Colors.black, fontSize: 30.0),),
              centerTitle: true,
              elevation: 0.0,
              actions:const <Widget> [
                Image(
                  image: AssetImage('assets/images/getsapp_logo.jpeg',),width: 100,height: 100,)
              ],
            ),
            body:SingleChildScrollView(
        child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
        Container(
        padding: EdgeInsets.all(10),
      height: 200,
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30))),
      child: GestureDetector(
        child: const Center(
          child: Hero(
              tag: "contact",
              child: Image(
                  image: AssetImage("assets/images/task.jpg"))),
        ),
        onTap: (){
          Get.back();
        },
      ),
    ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Card(
                  color: Colors.grey,
                  child: SizedBox(
                    child: Center(
                      child: Padding(
                        padding: EdgeInsets.all(8.0),

                        child: Text(
                          "No Task found",
                          style: TextStyle(fontSize: 18),

                        ),
                      ),
                    ),
                  )
              )]),

       ]) )));
  }
}