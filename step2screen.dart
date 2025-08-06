import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:gets_app/data.dart';
import 'package:gets_app/screens/step3screen.dart';
import 'package:gets_app/widgets/custom_headers.dart';
import 'package:video_player/video_player.dart';
import 'package:appinio_video_player/appinio_video_player.dart';
import 'package:image_picker/image_picker.dart' show ImagePicker, ImageSource, XFile;

import 'image_upload_service.dart';


class step2screen extends StatefulWidget {
  final AnimalInfo animal;
  const step2screen({required this.animal,super.key});

  @override
  State<step2screen> createState() => _step2screenScreenState(animal:animal);
}
// const Detailpage({ required this.animal});

class _step2screenScreenState extends State<step2screen> {
  late AnimalInfo _animal;
  late CustomVideoPlayerController _customVideoPlayerController;
  late VideoPlayerController videoPlayerController;
  String asset_source = "assets/videos/jesus.mp4";
  _step2screenScreenState({ required AnimalInfo animal})
  {
    _animal=animal;
  }
  //late final AnimalInfo animal;



  @override
  void initState()
  {
    super.initState();
    initializeVideoPlayer();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            resizeToAvoidBottomInset: false,
            appBar: AppBar(
              title: const Text('GetsApp',
                style: TextStyle(color: Colors.black, fontSize: 30.0),),
              centerTitle: true,
              elevation: 0.0,
              backgroundColor: _animal.color,
            ),
            body: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.all(10),
                    height: 200,
                    decoration: BoxDecoration(
                        color: _animal.color,
                        borderRadius: const BorderRadius.only(
                            bottomLeft: Radius.circular(30),
                            bottomRight: Radius.circular(30))),
                    child: GestureDetector(
                      child: Center(
                        child: Hero(
                            tag: _animal.IconImage,
                            child: Image(
                                image: AssetImage(_animal.IconImage))),
                      ),
                      onTap: (){
                        Get.back();
                      },
                    ),
                  ),
                  Container(

                    color: Colors.white,
                    child: SingleChildScrollView(
                      padding: EdgeInsets.all(20.0),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Header(
                                text: _animal.name
                            ),

                            const SizedBox(
                              height: 10,
                            ),
                            CustomVideoPlayer(
                                customVideoPlayerController: _customVideoPlayerController),
                            MaterialButton(
                              color:Colors.blue,
                              child:const Text(
                                "Next",
                                style: TextStyle(
                                  color: Colors.yellowAccent,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              onPressed: (){
                                  Navigator.push(
                                    context, MaterialPageRoute(builder:(context)=>step3screen(animal: _animal)));
                              },),
                            const SizedBox(
                              height: 10,
                            ),



                          ],
                        ),
                      ),
                    ),
                  ),


                ],
              ),
            )
        ));

  }
  void initializeVideoPlayer() {
    //VideoPlayerController _videoPlayerController;
    videoPlayerController = VideoPlayerController.asset(asset_source)
      ..initialize().then((value) {
        setState(() {

        });
      });
    _customVideoPlayerController=CustomVideoPlayerController(context: context, videoPlayerController: videoPlayerController);
  }
}