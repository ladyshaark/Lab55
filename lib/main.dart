import 'dart:js_util';

import 'package:flutter/material.dart';

class MyForm extends StatefulWidget {
  const MyForm({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => MyFormState();
}

class MyFormState extends State {
  final _formKey = GlobalKey<FormState>();
  int _width = 0;
  int _height = 0;
  int _area = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      child: Form(
        key: _formKey,
        child: Column(children: <Widget>[
          const Text(
            'Ширина(мм): ',
            style: TextStyle(fontSize: 20.0),
          ),
          TextFormField(validator: (value) {
            if (value!.isEmpty) return 'Пожалуйста введите ширину';
            try {
              _width = int.parse(value);
            } catch (e) {
              _width = 0;
              return e.toString();
            }
          }),
          const SizedBox(height: 20.0),
          const Text(
            'Высота(мм): ',
            style: TextStyle(fontSize: 20.0),
          ),
          TextFormField(validator: (value) {
            if (value!.isEmpty) return 'Пожалуйста введите высоту';
            try {
              _height = int.parse(value);
            } catch (e) {
              _height = 0;
              return e.toString();
            }
          }),
          const SizedBox(height: 20.0),
          RaisedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                setState(() {
                  if (_width is int && _height is int) _area = _width * _height;
                });
              }
            },
            child: const Text('Вычислить'),
            color: Colors.blue,
            textColor: Colors.white,
          ),
          const SizedBox(height: 50.0),
          Text(
            _area == 0
                ? 'Задайте параметры'
                : 'S = $_width * $_height = $_area (мм2)',
            style: const TextStyle(fontSize: 30.0),
          )
        ]),
      ),
    );
  }
}

void main() => runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
        appBar: AppBar(title: const Text('Калькулятор площади')),
        body: const MyForm())));
