import 'package:flutter/material.dart';


void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Home(),
  ));
}



class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  TextEditingController weightController = TextEditingController();
  TextEditingController heightController = TextEditingController();
  String calculo = "Informe seus dados.";

  void _resetFields(){
    weightController.text = "";
    heightController.text = "";
    setState(() {
      calculo = "Informe seus dados.";
    });

  }

  void _calculaIMC(){
    setState(() {
      if (weightController.text.length == 0){
        calculo = "Informe peso válido!";
        return;
      }
      if (heightController.text.length == 0){
        calculo = "Informe altura válida!";
        return;
      }

      double weight = double.parse(weightController.text);
      double height = double.parse(heightController.text)/100;



      double total = weight / (height * height);

      if (total < 18.6){
        calculo = "Abaixo do peso (${total.toStringAsPrecision(2)})";
      }
      if (total >= 18.6 && total < 24.9){
        calculo = "Peso ideal (${total.toStringAsPrecision(2)})";
      }
      if (total >= 24.9 && total < 29.9){
        calculo = "Levemente acima do peso (${total.toStringAsPrecision(2)})";
      }
      if (total >= 29.9 && total < 34.9){
        calculo = "Obesidade Grau 1 (${total.toStringAsPrecision(2)})";
      }
      if (total >= 34.9 && total < 39.9){
        calculo = "Obesidade Grau 2 (${total.toStringAsPrecision(2)})";
      }
      if (total >= 40 ){
        calculo = "Obesidade Grau 3 (${total.toStringAsPrecision(2)})";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Calculadora de IMC"),
          centerTitle: true,
          backgroundColor: Colors.green,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.refresh),
              onPressed: () {_resetFields();},
            )
          ],
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          padding: EdgeInsets.fromLTRB(10, 0, 10, 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Icon(
                Icons.person_outline,
                size: 120,
                color: Colors.green,
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Peso (kg)",
                    labelStyle: TextStyle(color: Colors.green)),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.green, fontSize: 25),
                controller: weightController,
              ),
              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                    labelText: "Altura (cm)",
                    labelStyle: TextStyle(color: Colors.green)),
                textAlign: TextAlign.center,
                style: TextStyle(color: Colors.green, fontSize: 25),
                controller: heightController,
              ),
              Padding(
                padding: EdgeInsets.all(10),
              ),
              Container(
                height: 50,
                child: RaisedButton(
                  onPressed: () {_calculaIMC();},
                  child: Text(
                    "Calcular",
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                  color: Colors.green,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
              ),
              Text(calculo,
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Colors.green, fontSize: 20))
            ],
          ),
        ));
  }
}
