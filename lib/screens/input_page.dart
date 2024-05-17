import 'package:bmicalculator/screens/results_page.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/custom_container2.dart';
import '../components/custom_container.dart';
import '../components/icon_content.dart';
import '../constants.dart';
import '../components/round_icon_button.dart';
import '../components/bottom_button.dart';
import 'package:bmicalculator/calculator_brain.dart';

enum Gender {
  female,
  male,
}

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  

  @override
  State<InputPage> createState() => _InputPageState();
}
  const Color maleCardColour = kInactiveCardColour;
  const Color femaleCardColour = kInactiveCardColour;
  Gender? selectedGender;
  double height =  180;
  int weight = 70;
  int age = 20;

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: [
          const Padding(
            padding: EdgeInsets.all(10.0),
          ),
             Row(
            children: [
                const Padding(
                padding: EdgeInsets.only(left: 20.0),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedGender = Gender.male;
                  });
                },
              child: CustomContainer(
                 170.0,
                 160,
                const IconContent(
                  FontAwesomeIcons.mars, 'MALE'),
                  selectedGender == Gender.male ? kActiveCardColour : kInactiveCardColour,
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    selectedGender = Gender.female;
                  });
                },
             child: CustomContainer(
                170.0,
                160,
                const IconContent(FontAwesomeIcons.venus, 'FEMALE'),
                selectedGender == Gender.female ? kActiveCardColour : kInactiveCardColour,
               ),
              ),
            ]
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 340,
                height: 200,
                margin: const EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                  color: kInactiveCardColour,
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Column( 
                  mainAxisAlignment: MainAxisAlignment.center,
                  textBaseline: TextBaseline.alphabetic,
                  children: [ 
                    const Text( 
                      'HEIGHT',
                      style: kLabelTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text( 
                          height.toString(),
                          style: kNumberTextStyle,  
                          ),
                          const Text( 
                            'cm',
                            style: kLabelTextStyle,
                          ),
                       ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        inactiveTrackColor: const Color(0xFF8D8E98),
                        activeTrackColor: Colors.white,
                        thumbColor: const Color(0xFFEB1555),
                        overlayColor: const Color(0x29EB1555),
                        thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        overlayShape: const RoundSliderOverlayShape(overlayRadius: 30.0),
                      ),
                          child: Slider(
                            value: height.toDouble(),
                            min: 120.0,
                            max: 220.0,
                            onChanged: (double newValue) {
                              setState(() {
                                height = newValue.roundToDouble();
                              });
                            },
                     ),
                    ),
                  ]
                ),
              ),
            ],
          ),
             Row(
            children: [
                const Padding(
                padding: EdgeInsets.only(left: 35.0),
              ),
              CustomContainer2(
                160,
                200, 
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [ 
                  const Text( 
                   'WEIGHT',
                   style: kLabelTextStyle,
                  ),
                  Text( 
                    weight.toString(),
                    style: kNumberTextStyle,
                  ),
                  Row( 
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [ 
                      RoundIconButton(
                        icon: FontAwesomeIcons.minus,
                        onPressed: () {
                          setState(() {
                            weight--;
                          });
                        },
                      ),
                      const SizedBox( 
                        width: 10.0,
                      ),
                      RoundIconButton(
                        icon: FontAwesomeIcons.plus,
                        onPressed: () {
                          setState(() {
                            weight++;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
              CustomContainer2(
                160,
                200,
                Column( 
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [ 
                    const Text( 
                      'AGE',
                      style: kLabelTextStyle,
                    ),
                    Text( 
                      age.toString(),
                      style: kNumberTextStyle,
                    ),
                    Row( 
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [ 
                        RoundIconButton( 
                          icon: FontAwesomeIcons.minus,
                          onPressed: () {
                            setState(() {
                              age--;
                            });
                          },
                        ),
                        const SizedBox( 
                          width: 10.0,
                        ),
                        RoundIconButton( 
                          icon: FontAwesomeIcons.plus,
                          onPressed: () {
                            setState(() {
                              age++;
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.all(18),
          ),
          BottomButton(
           (){
              CalculatorBrain calc = CalculatorBrain(height.toInt(), weight.toInt());

             Navigator.push(
            context,
            MaterialPageRoute(
              // ignore: prefer_const_constructors
              builder: (context) => ResultsPage( 
                calc.calculateBMI(),
                calc.getResult(),
                calc.getInterpretation(),
              ),
             ),
            );
           },
           'CALCULATE'
          ),
        ],
      ),
    );
  }
}












