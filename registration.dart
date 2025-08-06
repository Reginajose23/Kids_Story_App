import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:gets_app/data.dart';
import 'package:gets_app/screens/homepage.dart';
import 'package:gets_app/widgets/custom_headers.dart';
import 'package:video_player/video_player.dart';
import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:image_picker/image_picker.dart' show ImagePicker, ImageSource, XFile;
import 'package:grouped_list/grouped_list.dart';

import 'image_upload_service.dart';


class registration extends StatefulWidget {
  final AnimalInfo animal;
  const registration({required this.animal,super.key});

  @override
  State<registration> createState() => _registrationScreenState(animal:animal);
}
// const Detailpage({ required this.animal});

class _registrationScreenState extends State<registration> {
  final _formSignInKey=GlobalKey<FormState>();

  late AnimalInfo _animal;
  _registrationScreenState({ required AnimalInfo animal})
  {
    _animal=animal;
  }
  //late final AnimalInfo animal;
  XFile ? _selectedImage;
  bool isuploadvisible=true;
  bool isnextvisible=false;
  ImageUploadService uploadService=new ImageUploadService();
  late CustomVideoPlayerController _customVideoPlayerController;
  late VideoPlayerController videoPlayerController;
  String asset_source = "assets/videos/jesus.mp4";
  String select="none selected";
  var _getResponse = [];
  //List  splitNames=[];


  @override
  void initState()
  {
    super.initState();
    //  initializeVideoPlayer();
    _fetchGetData();
  }

  void _fetchGetData() async {
    try {
      final response = await Dio().get('https://indianchurches.org/getsapp_api/get_questionans.php');
      print("REs pri"+response.data);

      setState(() {
        _getResponse = json.encode(response.data) as List;
      });

    } catch (e) {
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text('GetsApp',
            style: TextStyle(color: Colors.black, fontSize: 30.0),),
          centerTitle: true,
          elevation: 0.0,
          backgroundColor: _animal.color,
        ),
    body: Column(
    children:[
    const Expanded(
    flex:1,
    child: SizedBox(
    height: 10,
    ),
    ),
    Expanded(
    flex:10,
    child: Container(
    padding: const EdgeInsets.fromLTRB(25.0, 50.0,25.0,20.0),
    decoration: const BoxDecoration(
    color:Colors.white,
    borderRadius: BorderRadius.only(
    topLeft: Radius.circular(40.0),
    topRight: Radius.circular(40.0),
    )
    ),
    child:Form(
    key:_formSignInKey,
    child:Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
            Text(
              'Register',
              style:TextStyle(
              fontSize: 30.0,
              fontWeight: FontWeight.w900,
              //color:lightColorScheme.primary,
              )
            ),
            const SizedBox(
            height: 10,
            ),
            TextFormField(
              validator: (value){
              if(value==null || value.isEmpty)
              {
              return 'Please enter email|';
              }
              return null;
              },
              decoration:  InputDecoration(
              label: const Text('Name'),
              hintText: 'Enter Name',
              hintStyle: const TextStyle(
              color: Colors.black26,
              ),
              border: OutlineInputBorder(
              borderSide: const BorderSide(
              color:Colors.black12,
              ),
              borderRadius: BorderRadius.circular(10),
              ),
              enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
              color:Colors.black12,
              ),
              borderRadius: BorderRadius.circular(10),
              )
              ),
            ),
            const SizedBox(
            height: 5,
            ),
            TextFormField(
            validator: (value){
            if(value==null || value.isEmpty)
            {
            return 'Please enter Mobile No';
            }
            return null;
            },
            decoration:  InputDecoration(
            label: const Text('Mobile No'),
            hintText: 'Enter Mobile No',
            hintStyle: const TextStyle(
            color: Colors.black26,
            ),
            border: OutlineInputBorder(
            borderSide: const BorderSide(
            color:Colors.black12,
            ),
            borderRadius: BorderRadius.circular(10),
            ),
            enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
            color:Colors.black12,
            ),
            borderRadius: BorderRadius.circular(10),
            )
            ),
            ),
            const SizedBox(
            height: 5,
            ),
            TextFormField(

            validator: (value){
            if(value==null || value.isEmpty)
            {
            return 'Please enter Email';
            }
            return null;
            },
            decoration:  InputDecoration(
            label: const Text('Email'),
            hintText: 'Enter Email',
            hintStyle: const TextStyle(
            color: Colors.black26,
            ),
            border: OutlineInputBorder(
            borderSide: const BorderSide(
            color:Colors.black12,
            ),
            borderRadius: BorderRadius.circular(10),
            ),
            enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
            color:Colors.black12,
            ),
            borderRadius: BorderRadius.circular(10),
            )
            ),
            ),
            const SizedBox(
            height: 5,
            ),
            TextFormField(

            validator: (value){
            if(value==null || value.isEmpty)
            {
            return 'Please enter Address';
            }
            return null;
            },
            decoration:  InputDecoration(
            label: const Text('Address'),
            hintText: 'Enter Address',
            hintStyle: const TextStyle(
            color: Colors.black26,
            ),
            border: OutlineInputBorder(
            borderSide: const BorderSide(
            color:Colors.black12,
            ),
            borderRadius: BorderRadius.circular(10),
            ),
            enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(
            color:Colors.black12,
            ),
            borderRadius: BorderRadius.circular(10),
            )
            ),
            ),
            const SizedBox(
            height: 10,
            ),
            SizedBox(
            width:double.infinity,
            child: ElevatedButton(
            onPressed: () {
            if (_formSignInKey.currentState!.validate()) {
            ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
            content: Text('Processing Data'),
            ),
            );
            }
            },
            child: const Text('Register'),
            ),
            ),



    ]))))])); }

}