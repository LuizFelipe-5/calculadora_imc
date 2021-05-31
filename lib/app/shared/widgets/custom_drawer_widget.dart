import 'package:flutter/material.dart';
import 'package:imc/app/pages/calc_imc_page/calc_imc_page.dart';
import 'package:imc/app/pages/to_do_list_page/to_do_list_page.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  'assets/avatar.png',
                ),
                Text(
                  'Usuario',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.accessibility_new,
              color: Theme.of(context).primaryColor,
            ),
            title: Text('Calculadora de IMC'),
            onTap: () {
              Navigator.of(context).pushNamed(CalcImc.routeName);
            },
          ),
          ListTile(
            leading: Icon(
              Icons.checklist,
              color: Theme.of(context).primaryColor,
            ),
            title: Text('Lista de Tarefas'),
            onTap: () {
              Navigator.of(context).pushNamed(ToDoList.routeName);
            },
          ),
        ],
      ),
    );
  }
}
