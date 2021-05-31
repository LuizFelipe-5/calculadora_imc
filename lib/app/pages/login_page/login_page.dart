import 'package:flutter/material.dart';
import 'package:imc/app/pages/calc_imc_page/calc_imc_page.dart';
import 'package:imc/app/shared/widgets/custom_button_widget.dart';
import 'package:imc/app/pages/login_page/widgets/custom_container_widget.dart';

class LoginPage extends StatelessWidget {
  static final String routeName = "/LoginPage";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              width: 150,
              child: Image.asset('assets/logo_home.png'),
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Seja bem vindo!',
                    style: TextStyle(fontSize: 31, color: Colors.white),
                  ),
                  Text(
                    'Calculadora IMC',
                    style: TextStyle(fontSize: 24, color: Colors.white),
                  ),
                ],
              ),
            ),
            Container(
              child: Column(
                children: [
                  CustomTextField(hintText: 'usuário'),
                  SizedBox(
                    height: 20,
                  ),
                  CustomTextField(
                    hintText: 'senha',
                    obscureText: true,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CustomButton(
                    buttonText: Text('ENTRAR'),
                    buttonColor: Theme.of(context).accentColor,
                    onPress: () {
                      Navigator.of(context).pushNamed(CalcImc.routeName);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
