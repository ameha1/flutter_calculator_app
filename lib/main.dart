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
    }else if (buttonText == "+" || buttonText == "-" || buttonText == "x" || buttonText == "/"){
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
                        DisplayText = outputText;
                      });

                    },
                    backgroundColor: Colors.lightGreenAccent,
                    child: const Text("AC",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25.0,
                        )),
                  ),
                  FloatingActionButton(
                    onPressed: (){},
                    backgroundColor: Colors.lightBlueAccent,
                    child: const Text("( )",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25.0,
                        )),
                  ),
                  FloatingActionButton(
                    onPressed: (){
                      setState(() {
                        onButtonPressed("%");
                        DisplayText = outputText;
                      });

                    },
                    backgroundColor: Colors.lightBlueAccent,
                    child: const Text("%",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25.0,
                        )),
                  ),
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


              FloatingActionButton(
                  onPressed: (){

                    setState((){

                      DisplayText += "7";
                      onButtonPressed(DisplayText);

                    });
                  },
                backgroundColor: Colors.black12,
                  child: const Text('7',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0,
                        ),
              ),
              ),
              FloatingActionButton(
                  onPressed: (){

                    setState(() {

                      DisplayText += "8";
                      onButtonPressed(DisplayText);
                    });
                  },
                backgroundColor: Colors.black12,
                  child: const Text('8',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0,)
              ),
              ),
              FloatingActionButton(
                onPressed: (){

                  setState(() {

                    DisplayText += "9";
                    onButtonPressed(DisplayText);
                  });
                },
                backgroundColor: Colors.black12,
                child: const Text('9',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0,),
              ),
              ),
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

              FloatingActionButton(
                  onPressed: (){

                    setState(() {

                      DisplayText += '4';
                      onButtonPressed(DisplayText);
                    });
                  },
                backgroundColor: Colors.black12,
                  child: const Text("4",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0,)
              ),
              ),
              FloatingActionButton(
                  onPressed: (){

                    setState(() {

                      DisplayText += "5";
                      onButtonPressed(DisplayText);
                    });
                  },
                backgroundColor: Colors.black12,
                  child: const Text("5",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0,
                  )
              ),
              ),
              FloatingActionButton(
                onPressed: (){

                  setState(() {

                    DisplayText += "6";
                    onButtonPressed(DisplayText);
                  });
                },
                backgroundColor: Colors.black12,
                child: const Text("6",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25.0,),
              ),
              ),
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

                  FloatingActionButton(
                    onPressed: (){

                      setState(() {
                        DisplayText = "1";
                        DisplayText += "1";
                        onButtonPressed(DisplayText);
                      });
                    },
                    backgroundColor: Colors.black12,
                    child: const Text("1",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0,)
    ),
                    ),


                  FloatingActionButton(
                      onPressed: (){

                        setState(() {

                          DisplayText += "2";
                          onButtonPressed(DisplayText);
                        });
                      },
                    backgroundColor: Colors.black12,
                      child: const Text("2",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25.0,)
                  ),
                  ),
                  FloatingActionButton(
                    onPressed: (){

                      setState(() {
                        DisplayText += "3";
                        onButtonPressed(DisplayText);
                      });
                    },
                    backgroundColor: Colors.black12,
                    child: const Text("3",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25.0,)
                    ),
                  ),

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
                            FloatingActionButton(
                              onPressed: (){

                                setState(() {

                                  DisplayText += "0";
                                  onButtonPressed(DisplayText);
                                });
                              },
                              backgroundColor: Colors.black12,
                              child: const Text("0",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25.0,)
                              ),
                            ),
                            FloatingActionButton(
                              onPressed: (){
                                setState(() {
                                  onButtonPressed(DisplayText);
                                  DisplayText = outputText;
                                  onButtonPressed(DisplayText);
                                });

                              },
                              backgroundColor: Colors.black12,
                              child: const Text(".",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 25.0,)
                              ),
                            ),
                            FloatingActionButton(
                              onPressed: (){
                                setState(() {
                                  //numberValue = '0';
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


