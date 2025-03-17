import 'package:cto_counter_bloc/aula_mobx/contador_imc/imc_controller.dart';
import 'package:cto_counter_bloc/widgets/imc_gauge.dart';
import 'package:currency_text_input_formatter/currency_text_input_formatter.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';

class ImcPage extends StatefulWidget {
  const ImcPage({super.key});

  @override
  State<ImcPage> createState() => _ImcPageState();
}

class _ImcPageState extends State<ImcPage> {
  final controller = ImcController();
  final pesoEC = TextEditingController();
  final alturaEC = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final reactionDisposer = <ReactionDisposer>[];

  @override
  void initState() {
    final reasctionErrorDisposer = reaction<bool>((_) => controller.hasError, (hasError) {
      if (hasError) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text(controller.error!),
        ));
      }
    });
    super.initState();
    reactionDisposer.add(reasctionErrorDisposer);
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    reactionDisposer.forEach((reactionDisposer) => reactionDisposer());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('IMC PAGE'),
      ),
      body: SingleChildScrollView(
        child: Form(
            key: formKey,
            child: Column(
              children: [
                Observer(builder: (_) {
                  return ImcGauge(imc: controller.imc);
                }),
                TextFormField(
                  controller: pesoEC,
                  decoration: const InputDecoration(label: Text('Peso')),
                  inputFormatters: [
                    CurrencyTextInputFormatter.currency(
                      locale: 'pt_BR',
                      symbol: '',
                      turnOffGrouping: true,
                      decimalDigits: 2,
                    ),
                  ],
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Peso é obrigatório';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: alturaEC,
                  decoration: const InputDecoration(label: Text('Altura')),
                  validator: (String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Altura é obrigatório';
                    }
                    return null;
                  },
                  inputFormatters: [
                    CurrencyTextInputFormatter.currency(
                      locale: 'pt_BR',
                      symbol: '',
                      turnOffGrouping: true,
                      decimalDigits: 2,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      var formatter = NumberFormat.currency(
                        locale: 'pt_BR',
                        symbol: '',
                        decimalDigits: 2,
                      );
                      final peso = formatter.parse(pesoEC.text) as double;
                      final altura = formatter.parse(alturaEC.text) as double;
                      final imc = peso / (altura * altura);
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        content: Text('Seu IMC é: $imc'),
                      ));
                      controller.calcularImc(peso: peso, altura: altura);
                    }
                  },
                  child: const Text('Calcular'),
                ),
              ],
            )),
      ),
    );
  }
}
