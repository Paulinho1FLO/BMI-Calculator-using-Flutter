import 'package:flutter/material.dart';
import 'package:bmicalculator/constants.dart';



class BottomButton extends StatelessWidget {

  const BottomButton (this.onTap, this.buttonTitle, {super.key});

  final void Function() onTap;
  final String buttonTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
    onTap: onTap,
    child: Container(
      width: double.infinity,
      height: alturaContainer,
      color: kContainerCor,
      child: Center(
      child: Text ( 
        buttonTitle,
        style: kLargeButtonTextStyle       
          ),     
        ),
      ),
    );
  }
}