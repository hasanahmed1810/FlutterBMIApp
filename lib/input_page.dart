import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:learningflutter8/main.dart';
import 'reusable_card.dart';
import 'icon_content.dart';
import 'results_page.dart';
import 'bottom_button.dart';
import 'round_icon_button.dart';
import 'calculator_brain.dart';


const activeCardColor = Color(0xFF1D1E33);
const inactiveCardColor = Color(0xFF111328);
const bottomContainerColor = Color(0xFFEB1555);
const labelTextStyle = TextStyle(fontSize: 18, color: Color(0xFF8D8E98));
const numberTextStyle = TextStyle(fontSize: 40, fontWeight: FontWeight.w900);

enum Gender{
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Gender selectedGender;
  int height = 180;
  int weight = 60;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(child: Row(
            children: <Widget>[
              Expanded(child: ReusableCard(
                function: (){
                  setState(() {
                    selectedGender = Gender.male;
                  });
                },
                color: selectedGender == Gender.male ? activeCardColor : inactiveCardColor,
                cardChild: IconContent(
                  iconData: FontAwesomeIcons.mars,
                  label: 'MALE',
                ),
              )),
              Expanded(child: ReusableCard(
                function: (){
                  setState(() {
                    selectedGender = Gender.female;
                  });
                },
                color: selectedGender == Gender.female ? activeCardColor : inactiveCardColor,
                cardChild: IconContent(
                  iconData: FontAwesomeIcons.venus,
                  label: 'FEMALE',
                ),
              )),
            ],
          ),),
          Expanded(child: ReusableCard(
            color: activeCardColor,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 5,
                ),
                Text(
                  'HEIGHT',
                  style: labelTextStyle,
                ),
                SizedBox(
                  height: 2,
                ),
                Row(
                  textBaseline: TextBaseline.alphabetic,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.baseline,
                  children: [
                    Text(
                      height.toString(),
                      style: numberTextStyle,
                    ),
                    Text(
                      'cm',
                      style: labelTextStyle,
                    )
                  ],
                ),
                SliderTheme(
                  data: SliderTheme.of(context).copyWith(
                    activeTrackColor: Colors.white,
                    inactiveTrackColor: Color(0xFF8D8E98),
                    thumbColor: Color(0xFFEB1555),
                    overlayColor: Color(0x29EB1555),
                    thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15)
                  ),
                  child: Slider(
                    value: height.toDouble(),
                    min: 120,
                    max: 220,
                    onChanged: (double newValue){
                      setState(() {
                        height = newValue.toInt();
                      });
                    },
                  ),
                )
              ],
            ),
          )),
          Expanded(child: Row(
            children: <Widget>[
              Expanded(child: ReusableCard(
                color: activeCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'WEIGHT',
                      style: labelTextStyle,
                    ),
                    Text(
                      weight.toString(),
                      style: numberTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        RoundIconButton(
                            iconData: FontAwesomeIcons.minus,
                            onPressed: () {
                              setState(() {
                                weight--;
                              });
                            }
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        RoundIconButton(
                            iconData: FontAwesomeIcons.plus,
                            onPressed: () {
                              setState(() {
                                weight++;
                              });
                            }
                        )
                      ],
                    )
                  ],
                ),
              )),
              Expanded(child: ReusableCard(
                color: activeCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'AGE',
                      style: labelTextStyle,
                    ),
                    Text(
                      age.toString(),
                      style: numberTextStyle,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        RoundIconButton(
                            iconData: FontAwesomeIcons.minus,
                            onPressed: () {
                              setState(() {
                                age--;
                              });
                            }),
                        SizedBox(
                          width: 10,
                        ),
                        RoundIconButton(
                            iconData: FontAwesomeIcons.plus,
                            onPressed: () {
                              setState(() {
                                age++;
                              });
                            }
                        )
                      ],
                    )
                  ],
                )
              )),
            ],
          ),),
          BottomButton(
            buttonTitle: 'CALCULATE',
            onTap: () {
              CalculatorBrain calculator = CalculatorBrain(height: height, weight: weight);
              Navigator.push(context, MaterialPageRoute(builder: (context) => ResultsPage(
                bmiResult: calculator.calculateBMI(),
                resultText: calculator.getResult(),
                interpretation: calculator.getInterpretation(),
              )));
            },
          )
        ],
      )
    );
  }
}