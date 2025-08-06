import 'package:flutter/material.dart';
import 'package:gets_app/data.dart';

class AnimalCard extends StatelessWidget{
  AnimalCard({ required this.animal,required this.onPressed});

  final AnimalInfo animal;
  final VoidCallback onPressed;//void Function();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
          padding: EdgeInsets.all(10.0),
          width: double.infinity,
          height: 230,
          child:Stack(
            children: <Widget>[
              Positioned(
                  left:50,
                  child: Container(
                    decoration: BoxDecoration(
                      color: animal.color,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    constraints:
                    const BoxConstraints(maxWidth:330,maxHeight: 200),
                  )),
              Positioned(
                  top:25.0,
                  child: Hero(
                      tag: animal.name,
                      transitionOnUserGestures: true,
                      child: CircleAvatar(
                        radius: 45,
                        backgroundColor: animal.color,
                        child: ClipOval(
                          child: Image(
                            image:AssetImage(animal.IconImage),
                            fit: BoxFit.cover,
                            width: 80,
                            height: 80,
                          ),
                        ),
                      ),)), /*Image(
                        image:AssetImage(animal.IconImage),
                        width: 150.0,
                        height: 150.0,
      
                      ))),*/
               Positioned(
                  top:25.0,
                  left:100.0,
                  child: Text(animal.name,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 30.0,
                        fontWeight: FontWeight.bold),
                  )),
              Positioned(
                  top:10.0,
                  left:120.0,
                  child: Container(
                    width: 200,
                    height: 200,
                    child:  Opacity(
                      opacity: 0.8,
                      child: Center(
                        child: Text(
                          animal.description,
                          style: const TextStyle(
                              wordSpacing: 4,
                              fontFamily: "PatrickHand-Regular",
                              fontSize: 22,
                              fontWeight: FontWeight.w800,
                              color: Colors.white),
                        ),
                      ),),
                  )),
            ],
          )
      ),
    );
  }
}