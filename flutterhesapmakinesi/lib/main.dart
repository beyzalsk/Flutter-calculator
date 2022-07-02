import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
  debugShowCheckedModeBanner: false,
  home: HomeApp(),
));

class HomeApp extends StatefulWidget {
  @override
  _HomeAppState createState() => _HomeAppState();

}

class _HomeAppState extends State<HomeApp> {
  String output = "0";

  String cikis= "0";
  double sayi1 = 0;
  double sayi2 = 0;
  String operand = "";

  buttonPressed(String buttonhep){
    print(buttonhep);
    if(buttonhep == "C"){
      cikis = "0";
      sayi1 = 0;
      sayi2 = 0;
      operand = "";
    }else if(buttonhep == "+" || buttonhep == "-" || buttonhep =="*" || buttonhep == "/"){
      sayi1 = double.parse(output);
      operand = buttonhep;
      cikis = "0";
      output = output + buttonhep;
    }else if(buttonhep == ","){
      if(cikis.contains(",")){
        print("Already exist");
        return;
      }else{
        cikis = cikis + buttonhep;
      }
    }else if(buttonhep == "="){
      sayi2 = double.parse(output);
      if(operand == "+"){
        cikis = (sayi2 + sayi1).toString();

      }
      if(operand == "-"){
        cikis = (sayi1 - sayi2).toString();

      }
      if(operand == "*"){
        cikis = (sayi2 * sayi1).toString();

      }
      if(operand == "/"){
        cikis= (sayi1 / sayi2).toString();

      }
      sayi1 = 0;
      sayi2 = 0;
    }else{
      cikis = cikis+buttonhep;
    }

    setState(() {
      output = double.parse(cikis).toStringAsFixed(1);
    });
  }

  Widget buildButton(String ButtonVal){
    return new Expanded(
        child: Container(
          padding: EdgeInsets.all(0.0),
          margin: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            color: Colors.deepOrange[200],
            boxShadow: [
              BoxShadow(

                  offset: Offset(1.0,1.0),
                  blurRadius: 9.0,
                  spreadRadius: 1.0
              ),
              BoxShadow(
                  color: Colors.transparent,
                  offset: Offset(-2.0,-2.0),
                  blurRadius: 9.0,
                  spreadRadius: 1.0
              ),
            ],
          ),
          child: MaterialButton(
            padding: EdgeInsets.all(20.0),
            child: Text(ButtonVal, style: TextStyle(
                fontSize: 25.0
            ),),
            onPressed: ()=>
                buttonPressed(ButtonVal)
            ,
          ),
        )
    );

  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: Container(
            child: Column(
              children: <Widget>[
                Container(
                    alignment: Alignment.centerRight,
                    padding: EdgeInsets.symmetric(horizontal:12.0,vertical: 50.0),
                    child: Text(output, style: TextStyle(
                        fontSize: 50.0
                    ),)
                ),
                Expanded(
                  child: Divider(),
                ),
                Column(
                  children: <Widget>[
                    Row(
                      children: <Widget>[
                        buildButton("C"),
                        buildButton(","),
                        buildButton("<"),
                        buildButton("+")
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        buildButton("1"),
                        buildButton("2"),
                        buildButton("3"),
                        buildButton("-")
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        buildButton("4"),
                        buildButton("5"),
                        buildButton("6"),
                        buildButton("*")
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        buildButton("7"),
                        buildButton("8"),
                        buildButton("9"),
                        buildButton("/")
                      ],
                    ),
                    Row(
                      children: <Widget>[
                        buildButton("0"),
                        buildButton("="),
                      ],
                    )
                  ],
                ),
              ],
            ),
          )
      ),
    );
  }
}