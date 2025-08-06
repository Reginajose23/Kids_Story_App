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


class step3screen extends StatefulWidget {
  final AnimalInfo animal;
  const step3screen({required this.animal,super.key});

  @override
  State<step3screen> createState() => _step3screenScreenState(animal:animal);
}
// const Detailpage({ required this.animal});

class _step3screenScreenState extends State<step3screen> {
  late AnimalInfo _animal;
  _step3screenScreenState({ required AnimalInfo animal})
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
  List<Map<String,String>> elements=[
    {
      "question_name": "இந்த உலகத்தை ஆண்டவர் படைக்கும் முன் எப்படி இருந்தது",
      "answer": "வெளிச்சமாக,அமைதியாக,வெறுமையும் இருளுமாய்,சத்தமாக "
    },
    {
      "question_name": "ஆண்டவர் நாம் வாழும் இந்த உலகத்தை எத்தனை நாட்களில் படைத்தார் ?",
      "answer": "9 நாட்கள்,7 நாட்கள்,12 நாட்கள்,3 நாட்கள் "
    },
    {
      "question_name": "ஆண்டவர் நான்காம் நாளில் உண்டாக்கியது",
      "answer": "சூரியன் சந்திரன்,புல் பூண்டுகள்,மீன்கள் மிருகங்கள்"
    },
    {
      "question_name": "ஆண்டவர் பறக்கும் பறவைகளை எந்த நாளில் உண்டாக்கினார்",
      "answer": "முதல் நாளில்,மூன்றாம் நாளில்,ஐந்தாம் நாளில்,நான்காம் நாளில்"
    },
    {
      "question_name": "கடவுள் யார் சாயலாக ரூபமாக மனிதனை (நம்மை ) படைத்திருக்கிறார் ",
      "answer": "தேவ தூதர்,மனிதர்கள்,மிருகங்கள்,கடவுள்"
    }
  ];
  List<Map<String, Object>> splitList=[];


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
            body:
                GroupedListView<dynamic,String>(

                                                          elements:elements,
                                                          groupBy:(element)=>element['question_name'],
                                                          floatingHeader:true,
                                                          groupSeparatorBuilder:(String value)=>Padding(
                                                          padding:const EdgeInsets.all(8.0),
                                                          child:Text(
                                                          value,
                                                          textAlign:TextAlign.center,
                                                          style:TextStyle(fontSize:20,fontWeight:FontWeight.bold
                                                          ),
                                                          ),
                                                          ),
                                                     itemBuilder:(ctx,element) {


                                                       final splitNames= element['answer'].split(',');
                                                       print("val->"+(splitNames.length).toString());
                                                       return ListView.builder(
                                                           scrollDirection: Axis.vertical,
                                                           shrinkWrap: true,
                                                           itemCount: splitNames.length,
                                                         physics: ScrollPhysics(),
                                                         itemBuilder: ( ctx, index) {

                                                         return new Column(

                                                             children: <Widget>[
                                                RadioMenuButton(
                                                       value: splitNames[index],

                                                       groupValue: select,
                                                       onChanged: (
                                                       value) {
                                                       setState(() {
                                                       select = value
                                                           .toString();
                                                       });
                                                       },
                                                       child: Text(splitNames[index].padRight(
                                                           '               '.length,
                                                           String.fromCharCodes([
                                                             // no-brake space
                                                             0x00A0,
                                                             // space
                                                             0x0020
                                                           ]))),
                                                       )


    ]);
    });
   },










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