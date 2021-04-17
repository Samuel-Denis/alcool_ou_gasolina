import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  var _result = "";
  TextEditingController _textEditingControllerAlcool = TextEditingController();
  TextEditingController _textEditingControllerGasolina = TextEditingController();

  void _calcular(){
    double alcool = double.tryParse(_textEditingControllerAlcool.text);
    double gasolina = double.tryParse(_textEditingControllerGasolina.text);

    if ( alcool == null || gasolina == null){
      setState(() {
        _result = "Número inválido, digite números maiores que 0 e utilize (.)";
      });
    }else{ if ((alcool/gasolina) >= 0.7 ){
      setState(() {
        _result = "Compensa utilizar GASOLINA";
      });
    }else
      setState(() {
        _result = "Compensa utilizar Alcool";
      });

    setState(() {
      _textEditingControllerGasolina.text = "";
      _textEditingControllerAlcool.text = "";
    });
  }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Álcool ou Gasolina",
        ),
        backgroundColor: Colors.indigo,
      ),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.all(32),
            child: Column(
             crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[

                Padding(
                  padding: EdgeInsets.only(bottom: 32),
                  child: Image.asset("images/logo.png"),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 32),
                  child: Text("Saiba qual a melhor opção par abastecer seu carro",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        color: Colors.indigo
                    ),
                  ),
                ),
                TextFormField(
                  controller: _textEditingControllerAlcool,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Preço Alcool ex: 1.59",
                    labelStyle: TextStyle(
                      color: Colors.indigo,
                      fontSize: 25,
                    ),
                  ),
                  style: TextStyle(
                    fontSize: 27,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                TextFormField(
                  controller: _textEditingControllerGasolina,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Preço Gadolina ex: 3.49",
                    labelStyle: TextStyle(
                      color: Colors.indigo,
                      fontSize: 25,
                    ),

                  ),
                  style: TextStyle(
                    fontSize: 27,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 32),

                  child:  RaisedButton(
                    color: Colors.indigo,
                      textColor: Colors.white,
                      child: Text("Calcular",
                        style: TextStyle(
                            fontSize: 25,
                        ),
                      ),
                      onPressed: _calcular,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Text(_result,
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                    color: Colors.indigo
                  ),
                  ),
                )
              ],
            ),
          )
        ],
      )
    );
  }
}
