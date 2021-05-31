import 'package:flutter/material.dart';
import 'package:imc/app/shared/widgets/custom_button_widget.dart';

class CalcImc extends StatefulWidget {
  static final String routeName = '/CalcImc';

  @override
  _CalcImcState createState() => _CalcImcState();
}

class _CalcImcState extends State<CalcImc> {
  var _heightController = TextEditingController();
  var _weightController = TextEditingController();

  String _result = "";

  void _clearFields() {
    _heightController.clear();
    _weightController.clear();
    _result = "";
  }

  void _calculate() {
    setState(() {
      double weight = double.parse(_weightController.text);
      double height = double.parse(_heightController.text) / 100;
      double imc = weight / (height * height);
      if (imc < 18.6) {
        _result = "Abaixo do Peso (${imc.toStringAsPrecision(4)})";
      } else if (imc >= 18.6 && imc < 24.9) {
        _result = "Peso Ideal (${imc.toStringAsPrecision(4)})";
      } else if (imc >= 24.9 && imc < 29.9) {
        _result = "Levemente Acima do Peso (${imc.toStringAsPrecision(4)})";
      } else if (imc >= 29.9 && imc < 34.9) {
        _result = "Obesidade Grau I (${imc.toStringAsPrecision(4)})";
      } else if (imc >= 34.9 && imc < 39.9) {
        _result = "Obesidade Grau II (${imc.toStringAsPrecision(4)})";
      } else if (imc >= 40) {
        _result = "Obesidade Grau III (${imc.toStringAsPrecision(4)})";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Image.asset('assets/images/logo_ioasys.png'),
            ),
            Text(
              'Calculadora IMC',
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              _clearFields();
              setState(() {});
            },
            icon: Icon(Icons.refresh),
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text('Drawer Header'),
            ),
            ListTile(
              title: Text('Item 1'),
              onTap: () {
                Navigator.of(context).pushNamed(CalcImc.routeName);
              },
            ),
            ListTile(
              title: Text('Item 2'),
              onTap: () {
                // Navigator.of(context).pushNamed(ToDoList.routeName);
              },
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 36.0),
        child: Container(
          child: Column(
            children: [
              Image.asset('assets/avatar.png'),
              const SizedBox(
                height: 47,
              ),
              TextField(
                keyboardType: TextInputType.number,
                controller: _weightController,
                decoration: InputDecoration(
                  labelText: 'Peso (kg)',
                ),
              ),
              TextField(
                keyboardType: TextInputType.number,
                controller: _heightController,
                decoration: InputDecoration(
                  labelText: 'Altura (kg)',
                ),
              ),
              const SizedBox(
                height: 33.5,
              ),
              CustomButton(
                buttonText: Text('Calcular'),
                buttonColor: Theme.of(context).primaryColor,
                onPress: () {
                  _calculate();
                  setState(() {});
                },
              ),
              const SizedBox(
                height: 36,
              ),
              Text(_result),
            ],
          ),
        ),
      ),
    );
  }
}
