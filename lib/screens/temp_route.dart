import 'package:flutter/material.dart';

class TempRoute extends StatefulWidget {
  @override
  _TempRoute createState() => new _TempRoute();
}

class _TempRoute extends State<TempRoute> {
  var _formKey = GlobalKey<FormState>();
  TextEditingController tempController = TextEditingController();
  double tempConvert = 0;
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
                  controller: tempController,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    icon: const Icon(Icons.person),
                    hintText: 'Coloque a temperatura em Cº',
                    labelText: 'Temp',
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
              children: <Widget>[Text("Temp:"), Text(tempConvert.toString())],
            ),
          ),
          visible: visible,
        )
      ],
    );
  }

  _sendForm() {
    double auxTemp = double.parse(tempController.text) * 1.8 + 32;

    setState(() {
      tempConvert = auxTemp;
      visible = true;
    });
  }
}
