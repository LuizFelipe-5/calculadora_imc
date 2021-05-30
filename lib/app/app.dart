import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:imc/app/pages/calc_imc_page/calc_imc_page.dart';
import 'package:imc/app/pages/login_page/login_page.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculadora IMC',
      theme: ThemeData(
        primarySwatch: Colors.red,
        primaryColor: Color(0xffC1007E),
        accentColor: Colors.black,
        textTheme: GoogleFonts.poppinsTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      initialRoute: LoginPage.routeName,
      routes: {
        LoginPage.routeName: (context) => LoginPage(),
        CalcImc.routeName: (context) => CalcImc(),
      },
    );
  }
}
