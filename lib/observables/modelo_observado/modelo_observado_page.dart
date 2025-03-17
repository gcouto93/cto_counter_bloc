import 'package:cto_counter_bloc/observables/list/observable_list_controller.dart';
import 'package:cto_counter_bloc/observables/modelo_observado/modelo_observado_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ModeloObservadoPage extends StatefulWidget {
  const ModeloObservadoPage({super.key});

  @override
  State<ModeloObservadoPage> createState() => _ModeloObservadoPageState();
}

class _ModeloObservadoPageState extends State<ModeloObservadoPage> {
  final controller = ModeloObservadoController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Modelo Observado Page'),
        ),
        body: Center(
            child: Column(
          children: [
            Expanded(
              child: Observer(builder: (_) {
                return ListView.builder(
                  itemCount: controller.products.length,
                  itemBuilder: (context, index) {
                    final productStore = controller.products[index];
                    return Observer(builder: (_) {
                      return CheckboxListTile(
                        title: Text(productStore.product.name),
                        value: productStore.selected,
                        onChanged: (value) {
                          controller.selectedProduct(index);
                        },
                      );
                    });
                  },
                );
              }),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                    onPressed: () {
                      controller.addProduct();
                    },
                    child: Text('Adicionar item')),
                TextButton(
                    onPressed: () {
                      controller.removeProduct();
                    },
                    child: Text('Remover item')),
                TextButton(
                    onPressed: () {
                      controller.loadProducts();
                    },
                    child: Text('Carregar')),
              ],
            ),
          ],
        )));
  }
}
