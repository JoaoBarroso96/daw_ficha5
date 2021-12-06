import 'package:ficha1/utilities/calculate_imc.dart';
import 'package:flutter/material.dart';

class IMCRoute extends StatefulWidget {
  @override
  _IMCRoute createState() => new _IMCRoute();
}

class _IMCRoute extends State<IMCRoute> {
  var _formKey = GlobalKey<FormState>();
  TextEditingController weightController = TextEditingController();
  TextEditingController sizeController = TextEditingController();
  double imc = 0;
  bool visible = false;

  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(16.0),
                child: TextFormField(
                  validator: (value) {
                    var alturacm = int.parse(value.toString());
                    if (alturacm < 10) {
                      return 'Altura menor que 10';
                    }

                    return null;
                  },
                  controller: sizeController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    icon: const Icon(Icons.person),
                    hintText: 'Coloque a sua altura em cm',
                    labelText: 'Altura',
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: TextFormField(
                  controller: weightController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    icon: const Icon(Icons.person),
                    hintText: 'Coloque o seu peso (KG)',
                    labelText: 'Peso',
                  ),
                ),
              ),
              SizedBox(height: 15.0),
              ElevatedButton(
                onPressed: _sendForm,
                child: Text('Calcular'),
              )
            ],
          ),
        ),
        SizedBox(height: 50.0),
        Visibility(
          child: Center(
            child: Column(
              children: <Widget>[Text("IMC:"), Text(imc.toString())],
            ),
          ),
          visible: visible,
        )
      ],
    );
  }

  _sendForm() {
    if (_formKey.currentState!.validate()) {
      CalculateIMC calculateIMC = new CalculateIMC();

      double imcCalculate =
          calculateIMC.calculate(weightController.text, sizeController.text);

      setState(() {
        imc = imcCalculate;
        visible = true;
      });
    }
  }
}
