import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:gets_app/data.dart';
import 'package:gets_app/screens/complete_task.dart';
import 'package:gets_app/screens/contact_us.dart';
import 'package:gets_app/screens/detailpage.dart';
import 'package:gets_app/widgets/animal_card.dart';


class HomePage extends StatefulWidget{
  @override
  _HomePageState createState()=> _HomePageState();
  }

class _HomePageState extends State<HomePage>{

  List<AnimalInfo> animals=[];
  final List<Widget> _naviItem=[
    const Icon(Icons.home),
    const Icon(Icons.task_alt),
    const Icon(Icons.contact_mail),
  ];

  @override
  void initState() {
    //animals=ani;
   animals=animallist;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
return SafeArea(
    child: Scaffold(
      appBar: AppBar(
        title: const Text('GetsApp',style: TextStyle(color: Colors.black,fontSize: 30.0),),
        centerTitle: true,
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading:Icon(Icons.filter_list,color: Colors.amber,),
        actions:const <Widget> [
          Image(
              image: AssetImage('assets/images/getsapp_logo.jpeg',),width: 100,height: 100,)
        ],
      ),


      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                "assets/images/cute_bg2.jpg"
              ),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.all(5.0),
            itemCount: animals.length,
            itemBuilder: (context,index)=>
                  AnimalCard(
                      animal:animals[index],
                      onPressed:(){
                       Get.to(Detailpage(animal: animals[index]));
            },),
        ),
      ),
      bottomNavigationBar: CurvedNavigationBar(
          backgroundColor:Colors.green,
          height: 50,
          items: _naviItem,
          onTap: (index){
            if(index==0){
              Navigator.push(
                  context, MaterialPageRoute(builder:(context)=>HomePage()));
            }
            else if(index==1){
              Navigator.push(
                  context, MaterialPageRoute(builder:(context)=>CompleteTask()));
              }
            else if(index==2){
              Navigator.push(
                  context, MaterialPageRoute(builder:(context)=>ContactUs()));
            }

          },),
    ));
  }
}