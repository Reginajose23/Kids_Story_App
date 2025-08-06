
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
//import 'package:my_first_flutter/util/emoticon_face.dart';
//import 'package:my_first_flutter/util/task_tile.dart';
import 'package:image_picker/image_picker.dart' show ImagePicker, ImageSource, XFile;

class ImageUploadService{

  Future<String> uploadImage(XFile? pickedfile) async{

        String msg='';
    try{

      Dio dio= Dio();

      if(pickedfile!=null)
        {
          FormData formdata=FormData.fromMap({
            'userFile': await MultipartFile.fromFile(pickedfile.path,filename: 'image.jpg'),
            //print("form data"+formdata);
          });


          //send post request with form data
          Response response=await dio.post('https://indianchurches.org/getsapp_api/img_upload.php',data: formdata,);
          print("res pri->"+response.data);
          //handle response
          if(response.data != null)
            {
              print("hi page");
              msg='success';
              if (kDebugMode) {
                print('Image upload successfully');
                print(response.data);


              }
            }
          else
            {
              msg='failed';
              if (kDebugMode) {
                print('image not uploaded.err:${response.statusCode}');

              }
             // Navigator.of(context).pop();
            }

        }else
          {
            msg='error';
          }
    }catch(e)
    {
      if (kDebugMode) {
        print('error upload: $e');
      }
    }
    return msg;
  }
}