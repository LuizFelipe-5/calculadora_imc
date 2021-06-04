import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:imc/app/controllers/currency_price_controller.dart';
import 'package:imc/app/shared/widgets/custom_drawer_widget.dart';
import 'package:imc/app/shared/widgets/custom_loading_indicator_widget.dart';

import 'widgets/currency_converter_textfield_widget.dart';

class CurrencyConverter extends StatefulWidget {
  static final String routeName = '/CurrencyConverter';

  @override
  _CurrencyConverterState createState() => _CurrencyConverterState();
}

class _CurrencyConverterState extends State<CurrencyConverter> {
  final controller = CurrencyPriceController();

  @override
  void initState() {
    super.initState();

    controller.getPrices().then((value) {
      setState(() {
        controller.currencyPrice = value;
      });
    }).catchError((error) {
      print(error);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(right: 16.0),
              child: Image.asset('assets/images/logo_ioasys.png'),
            ),
            Text(
              'Conversor de Moedas',
              style: TextStyle(fontSize: 14),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
            child: Column(
              children: [
                Icon(
                  Icons.attach_money,
                  size: 200,
                  color: Theme.of(context).primaryColor,
                ),
                CurrencyConverterTextField(
                  controller: controller.realController,
                  label: 'Reais',
                  prefix: 'R\$',
                  onChanged: controller.onRealChanged,
                ),
                Divider(),
                CurrencyConverterTextField(
                  onChanged: controller.onDollarChanged,
                  controller: controller.dollarController,
                  label: 'Dólares',
                  prefix: 'US\$',
                ),
                Divider(),
                CurrencyConverterTextField(
                  onChanged: controller.onEuroChanged,
                  controller: controller.euroController,
                  label: 'Euro',
                  prefix: '€',
                ),
                Offstage(
                  offstage: controller.currencyPrice != null,
                  child: CustomLoadingIndicator(),
                )
              ],
            ),
          ),
        ),
      ),
      drawer: CustomDrawer(),
    );
  }
}
