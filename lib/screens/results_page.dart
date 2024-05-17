import 'package:bmicalculator/components/bottom_button.dart';
import 'package:bmicalculator/constants.dart';
import 'package:bmicalculator/components/custom_container.dart';
import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget {
  
   ResultsPage(this.interpretation, this.bmiResult, this.resultText, {super.key});

  final String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return  Scaffold( 
      appBar: AppBar( 
        title: const Text('BMI CALCULATOR'),
      ),
      body: Column( 
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [ 
           Expanded( 
            child: Container(
              padding: const EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
            child: const Text( 
              'Your result',
              style: kTitleTextStlye,
            ),
           ),
           ),
           // ignore: prefer_const_constructors
           Expanded( 
            flex: 5,
            // ignore: prefer_const_constructors
            child: CustomContainer(
              2,
              2,
              // ignore: prefer_const_constructors
              Column( 
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                // ignore: prefer_const_literals_to_create_immutables
                children: [ 
                  // ignore: prefer_const_constructors
                  Text( 
                    bmiResult,
                    style: kResultTextStyle,
                  ),
                  // ignore: prefer_const_constructors
                  Text( 
                    interpretation,
                    style: kBMITextStyle ,
                  ),
                  // ignore: prefer_const_constructors
                  Text( 
                    resultText,
                    style: kBodyTextStyle,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              kActiveCardColour,
            ),
           ),
           BottomButton( 
             () {
              Navigator.pop(context);
            },
             'RE-CALCULATE',
           ),  
          ],
        ),
      );
  }
}