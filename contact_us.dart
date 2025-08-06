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


class ContactUs extends StatefulWidget {
const ContactUs({super.key});

  @override
  State<ContactUs> createState() => _ContactUsScreenState();
}
// const Detailpage({ required this.animal});

class _ContactUsScreenState extends State<ContactUs> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            title: const Text('Contact Us',
              style: TextStyle(color: Colors.black, fontSize: 30.0),),
            centerTitle: true,
            elevation: 0.0,
            actions:const <Widget> [
              Image(
                image: AssetImage('assets/images/getsapp_logo.jpeg',),width: 100,height: 100,)
            ],
          ),
          body: SingleChildScrollView(
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
                        image: AssetImage("assets/images/contact_us.jpg"))),
              ),
              onTap: (){
                Get.back();
              },
            ),
          ),
    Container(

    color: Colors.white,
    child: SingleChildScrollView(
    padding: const EdgeInsets.all(20.0),
    child: Center(
    child: Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: <Widget>[
      const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8,vertical: 16),
          child: TextField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              hintText: "Name",
            ),
          ),),
       const Padding(
        padding: EdgeInsets.symmetric(horizontal: 8,vertical: 16),
        child: TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: "Mobile No",
          ),
        ),),
      const Padding(
        padding: EdgeInsets.symmetric(horizontal: 8,vertical: 16),
        child: TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: "Email",
          ),
        ),),
      const Padding(
        padding: EdgeInsets.symmetric(horizontal: 8,vertical: 16),
        child: TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            hintText: "Message",
          ),
        ),),
      const SizedBox(
        height: 10,
      ),
      Center(
        child: MaterialButton(
            color:Colors.blue,
            child:const Text(
              "Submit",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            onPressed: (){
              Navigator.push(
                  context, MaterialPageRoute(builder:(context)=>HomePage()));
            }),
      ),
      ],
    )
    ))),
    ],
        ))));
  }
}