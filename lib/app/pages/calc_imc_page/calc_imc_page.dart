import 'package:flutter/material.dart';
import 'package:imc/app/pages/to_do_list_page/to_do_list_page.dart';

class CalcImc extends StatelessWidget {
  static final String routeName = '/CalcImc';
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
    );
  }
}
