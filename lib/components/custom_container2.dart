import 'package:flutter/material.dart';
import '../constants.dart';

class CustomContainer2 extends StatelessWidget {

  final double width;
  final double height;
  final Widget child;
  const CustomContainer2 ( this.width, this.height, this.child, {super.key});

  


  @override 
  Widget build(BuildContext context){
    return  Container(
                width: 160.0,
                height: 200.0,
                margin: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: kInactiveCardColour,
                  borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: child,
                );
       }
    }