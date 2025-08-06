import 'dart:io';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:gets_app/data.dart';
import 'package:gets_app/screens/step2screen.dart';
import 'package:gets_app/widgets/custom_headers.dart';
import 'package:image_picker/image_picker.dart' show ImagePicker, ImageSource, XFile;

import 'image_upload_service.dart';


class Detailpage extends StatefulWidget {
  final AnimalInfo animal;
  const Detailpage({required this.animal,super.key});

  @override
  State<Detailpage> createState() => _DetailpageScreenState(animal:animal);
}
 // const Detailpage({ required this.animal});
 
class _DetailpageScreenState extends State<Detailpage> {
  late AnimalInfo _animal;
  _DetailpageScreenState({ required AnimalInfo animal})
  {
    _animal=animal;
  }
  //late final AnimalInfo animal;
  XFile ? _selectedImage;
  bool isuploadvisible=true;
  bool isnextvisible=false;
  ImageUploadService uploadService=new ImageUploadService();

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
                         SubHeader(
                             text: _animal.paragraph
                         ),
                         const SizedBox(
                           height: 10,
                         ),
                         Row(
                           children: [
            
                              ElevatedButton.icon(
                               icon: Icon(Icons.camera),
                               label: Text("Pick Camera"),
                               onPressed: () => pickImageFromCamera(),
                               style: ElevatedButton.styleFrom(
                                 shape: RoundedRectangleBorder(
                                   borderRadius: BorderRadius.circular(32.0),
                                 ),
                               ),
                             ),
                            const SizedBox(
                               width: 10,
                             ),
                             ElevatedButton.icon(
                               icon: Icon(Icons.file_copy_outlined),
                               label: Text("Pick Gallery"),
                               onPressed: () => pickImageFromGallery(),
                               style: ElevatedButton.styleFrom(
                                 shape: RoundedRectangleBorder(
                                   borderRadius: BorderRadius.circular(32.0),
                                 ),
                               ),
                             ),
                             ],
                           ),
                         const SizedBox(
                           height: 10,
                         ),
                          Row(
                              children: [
                                       Visibility(
                                           visible: _selectedImage!=null,
                                           child  : Column(
                                             children: [
                                               _selectedImage !=null
                                                   ? Image.file(File(_selectedImage!.path),height: 200,width: 300): const Text('Please select an Image'),
                                               if (isuploadvisible) MaterialButton(
                                                 color:Colors.blue,
                                                 child:const Text(
                                                   "Upload Image",
                                                   style: TextStyle(
                                                     color: Colors.yellowAccent,
                                                     fontWeight: FontWeight.bold,
                                                     fontSize: 16,
                                                   ),
                                                 ),
                                                 onPressed: (){
                                                   uploadImage();
                                                 },) ,
                                               SizedBox(
                                                 height: 20,
                                               ),
                                               if(isnextvisible)MaterialButton(
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
                                                      context, MaterialPageRoute(builder:(context)=>step2screen(animal: _animal)));
                                                 },),
                                             ],
                                           )
                                       ),
                                     ]),

            
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
  Future pickImageFromGallery() async {
    final returnedImage = await ImagePicker().pickImage(
        source: ImageSource.gallery);
    if(returnedImage==null) return;
    setState((){
      _selectedImage =XFile (returnedImage!.path) ;
    });
  }
  Future pickImageFromCamera() async {
    final returnedImage = await ImagePicker().pickImage(
        source: ImageSource.camera);
    if(returnedImage==null) return;
    setState((){
      _selectedImage =XFile (returnedImage!.path) ;
    });
  }
  Future uploadImage() async{
    //loading circle
     showDialog(
        context: context,
        builder: (context){
          return const Center(child:CircularProgressIndicator());
        },);
    String msg=await uploadService.uploadImage(_selectedImage);
    print("alertvmsg-,$msg");
    setState(() {
      if(msg == 'success') {
        Navigator.of(context).pop();
        Fluttertoast.showToast(msg: "Image Uploaded Successfully",
            toastLength: Toast.LENGTH_LONG,
            gravity: ToastGravity.BOTTOM,
            backgroundColor: Colors.blue,
            textColor: Colors.white,
            timeInSecForIosWeb: 2,
            fontSize: 18);
        isnextvisible = true;
        isuploadvisible = false;
      }


    });
    //});
    //
  }
}