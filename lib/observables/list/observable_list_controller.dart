import 'package:cto_counter_bloc/aula_mobx/model/product_model.dart';
import 'package:mobx/mobx.dart';
part 'observable_list_controller.g.dart';

class ObservableListController = _ObservableListControllerBase with _$ObservableListController;

abstract class _ObservableListControllerBase with Store {
  @observable
  var products = <ProductModel>[].asObservable();

  @action
  void loadProducts() {
    var productsData = [
      ProductModel(name: 'Computador'),
      ProductModel(name: 'Celular'),
      ProductModel(name: 'Teclado'),
      ProductModel(name: 'Mouse'),
    ];

    products.addAll(productsData);
  }

  void addProduct() {
    products.add(ProductModel(name: 'Computador 2'));
  }

  void removeProduct() {
    products.removeAt(0);
  }
}
