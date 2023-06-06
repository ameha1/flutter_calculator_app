import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(

    home: Home(),

));


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);


  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  String DisplayText = "";
  bool count = true;

  String outputText = "0";
  String prevOperator = "";
  double prevNumber = 0;
  bool hasDecimal = false;


  void onButtonPressed(String buttonText){

    if(buttonText == "C"){
      outputText = "0";
      prevOperator = "";
      prevNumber = 0;
      hasDecimal = false;
    }else if (buttonText == "+" || buttonText == "-" || buttonText == "x" || buttonText == "/" || buttonText == "%"){
      prevOperator = buttonText;
      prevNumber = double.parse(outputText);
      outputText = "0";
      hasDecimal = false;
    }else if (buttonText == "="){
      double currentNumber = double.parse(outputText);
      double result = 0;
      switch (prevOperator){
        case "+":
          result = prevNumber + currentNumber;
          break;
        case "-":
          result = prevNumber - currentNumber;
          break;
        case "x":
          result = prevNumber * currentNumber;
          break;
        case "/":
          result = prevNumber / currentNumber;
          break;
        case "%":
          result = prevNumber % currentNumber;
          break;
      }
      outputText = result.toString();
      prevOperator = "";
      prevNumber = result;
      hasDecimal = outputText.contains(".");
      print(currentNumber);
      print(prevNumber);
      print(result);
    }else if(buttonText == "."){
      if(!hasDecimal){
        outputText+=".";
        hasDecimal = true;
      }
      else{
        if(outputText == "0"){
          outputText = buttonText;
        }
        else{
          outputText += buttonText;
        }
      }
      setState(() {});
    }

  }




  Widget _buildButton(String buttonText) {
    return SizedBox.fromSize(
      child:FloatingActionButton(
        onPressed: (){

          setState((){
            if(DisplayText == '0'){
              DisplayText = '';
            }
              if(buttonText == '( )'){
                DisplayText = '';
              }else{

              DisplayText += buttonText;
              onButtonPressed(DisplayText);}

          });
        },
        backgroundColor: Colors.black12,

        child: Text(buttonText,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25.0,
          ),
        ),
      ),
    );
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
    appBar: AppBar(
    title: Text('Calculator'),
    centerTitle: true,
      elevation: 0.0,
      backgroundColor: Colors.grey[900],
    ),

    body:Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        Text( '$DisplayText',
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 35.0,
          color: Colors.white,
        ),
        ),

    Container(margin: EdgeInsets.all(5.0),child:
              Row(

                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[

                  FloatingActionButton(
                    onPressed: (){
                      setState(() {
                        onButtonPressed('C');
                        DisplayText = '0';
                      });

                    },
                    backgroundColor: Colors.lightGreenAccent,
                    child: const Text("AC",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25.0,
                        )),
                  ),

                  _buildButton('( )'),

                  _buildButton('%'),

                  FloatingActionButton(
                    onPressed: (){
                      setState(() {
                        outputText = DisplayText;
                        onButtonPressed("+");
                        DisplayText = outputText;

                      });
                    },
                    child: const Icon(Icons.add),
                    backgroundColor: Colors.lightBlueAccent,
                  ),
                ],
              ),
    ),



      Container(margin: EdgeInsets.all(5.0), child:
          Row(

              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: <Widget>[



              _buildButton('7'),


              _buildButton('8'),


              _buildButton('9'),


              FloatingActionButton(
                onPressed: (){
                  outputText = DisplayText;
                  onButtonPressed("-");
                  DisplayText = outputText;
                },
                child: const Icon(Icons.horizontal_rule),
                backgroundColor: Colors.lightBlueAccent,
              ),
          ]
          )
    ),

        Container(margin: EdgeInsets.all(5.0),child:
        Row(

            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[

              _buildButton('4'),

              _buildButton('5'),

              _buildButton('6'),

              FloatingActionButton(
                onPressed: (){
                  setState(() {
                    outputText = DisplayText;
                    onButtonPressed("x");
                    DisplayText = outputText;
                  });

                },
                child: Icon(Icons.close),
                backgroundColor: Colors.lightBlueAccent,
              ),
            ]
        ),
        ),

        Container(padding: EdgeInsets.all(5.0),child:
            Row(

                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[

                 _buildButton('1'),

                  _buildButton('2'),

                  _buildButton('3'),

                  FloatingActionButton(
                    onPressed: (){
                      setState(() {
                        outputText = DisplayText;
                        onButtonPressed("/");
                        DisplayText = outputText;
                      });

                    },
                    backgroundColor: Colors.lightBlueAccent,
                    child: const Text("/",
                    style: TextStyle(
                    fontWeight: FontWeight.bold,
                      fontSize: 25.0,
        ),),
                  ),
                ]
            ),
        ),

                   Container(padding: EdgeInsets.all(5.0),

                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                          children: <Widget>[

                            _buildButton('0'),

                            _buildButton('.'),

                            FloatingActionButton(
                              onPressed: (){
                                setState(() {

                                  DisplayText = DisplayText.substring(0, DisplayText.length - 1);

                                  if(DisplayText == ''){
                                    DisplayText = '0';
                                  }

                                });
                              },
                              child: const Icon(Icons.navigate_before),
                              backgroundColor: Colors.black12,

                            ),
                            FloatingActionButton(
                              onPressed: (){
                                setState(() {

                                  outputText = DisplayText;

                                  onButtonPressed("=");

                                  DisplayText = outputText;
                                });

                              },
                              backgroundColor: Colors.lightBlueAccent,
                              child: const Text("=",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25.0,
                                  )),
                            )
                          ],
                        ),
                      ),

    ]
    ),
);

  }
}


