import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../components/icon_content.dart';
import '../components/card_reusable.dart';
import '../constants.dart';
import 'results.dart';
import '../components/bottom_button.dart';
import '../components/round_icon.dart';
import '../calc.dart';


enum Gender {
  male,
  female,
  }


class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Color maleCardColor = kInactiveCardColor;
  Color femaleCardColor = kInactiveCardColor;
  int height = 162;
  Gender selectedGender;
  int weight = 80;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        automaticallyImplyLeading: false,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
              child: Row(
                children: [
                  Expanded(
                      child: CardReusable(
                        colour: selectedGender == Gender.male?kActiveCardColor:kInactiveCardColor,
                        onPress: (){
                          setState((){
                            selectedGender = Gender.male;
                          }
                          );
                        },
                        cardChild: IconContent(
                          icon: FontAwesomeIcons.mars,
                          text: 'MALE',
                        ),
                      ),
                  ),
                  Expanded(
                      child: CardReusable(
                        onPress: (){
                          setState((){
                            selectedGender = Gender.female;
                          }
                          );
                        },
                        colour: selectedGender == Gender.female ? kActiveCardColor:kInactiveCardColor,
                        cardChild: IconContent(
                          icon: FontAwesomeIcons.venus,
                          text: 'FEMALE',
                        ),
                      ),
                  )
                ],
              )
          ),
          Expanded(
              child: CardReusable(
                colour: kActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'HEIGHT',
                      style: kTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text(
                          height.toString(),
                          style: kNumTextStyle ,
                        ),
                        Text(
                          'cm',
                          style: kTextStyle,
                        )
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        inactiveTrackColor: Color(0xff8d8e98),
                        activeTrackColor: Colors.white,
                        thumbColor: Color(0xffeb1555),
                        overlayColor: Color(0x29eb1555),
                        thumbShape:
                          RoundSliderThumbShape(
                            enabledThumbRadius: 15.0,
                          ),
                        overlayShape:
                          RoundSliderOverlayShape(
                            overlayRadius: 30.0,
                          ),


                      ),
                      child: Slider(
                          value: height.toDouble(),
                          min: 120,
                          max: 220,
                          onChanged: (double newValue){
                            setState((){
                              height = newValue.round();
                            }
                            );
                          },
                      ),
                    )
                  ]
                ),
              ),
          ),
          Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: CardReusable(
                      colour: kActiveCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                          'WEIGHT',
                          style: kTextStyle,
                        ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.baseline,
                            textBaseline: TextBaseline.alphabetic,
                            children: [
                              Text(
                                weight.toString(),
                                style: kNumTextStyle,
                              ),
                              Text(
                                'kg',
                                style: kTextStyle,
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPressed: (){
                                  setState((){
                                    weight++;
                                  }
                                  );
                                },
                              ),
                              SizedBox(width: 15,),
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: (){
                                  setState((){
                                    weight--;
                                  }
                                  );
                                },
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: CardReusable(
                      colour: kActiveCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'AGE',
                            style: kTextStyle,
                          ),
                          Text(
                            age.toString(),
                            style: kNumTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RoundIconButton(
                                  onPressed: (){
                                    setState((){
                                     age--;
                                    });
                                  },
                                icon: FontAwesomeIcons.minus,
                              ),
                              SizedBox(width: 15,),
                              RoundIconButton(
                                  onPressed: (){
                                    setState((){
                                     age++;
                                    });
                                  },
                                icon: FontAwesomeIcons.plus,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
          ),
          BottomButton(
            label: 'CALCULATE',
            onTapped: (){

              Calculation calc = Calculation(height: height,weight: weight);

              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context){
                        return ShowResults(

                            bmiResult: calc.calcBMI(),
                            bmiText: calc.getResult(),
                            bmiInterpretation: calc.getInterpretation()
                        );
                      }
                  )
              );
            },
          )
        ],
      )
    );
  }
}




