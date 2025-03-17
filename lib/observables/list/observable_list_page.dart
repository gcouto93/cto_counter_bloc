import 'package:cto_counter_bloc/observables/list/observable_list_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ObservableListPage extends StatefulWidget {
  const ObservableListPage({super.key});

  @override
  State<ObservableListPage> createState() => _ObservableListPageState();
}

class _ObservableListPageState extends State<ObservableListPage> {
  final controller = ObservableListController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Observable List Page'),
        ),
        body: Center(
            child: Column(
          children: [
            Expanded(
              child: Observer(builder: (_) {
                return ListView.builder(
                  itemCount: controller.products.length,
                  itemBuilder: (context, index) {
                    final productName = controller.products[index].name;
                    return CheckboxListTile(
                      title: Text(productName),
                      value: false,
                      onChanged: (value) {},
                    );
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
