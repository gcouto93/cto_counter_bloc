import 'package:cto_counter_bloc/aula_mobx/model/product_model.dart';
import 'package:cto_counter_bloc/observables/modelo_observado/model/product_store.dart';
import 'package:mobx/mobx.dart';
part 'modelo_observado_controller.g.dart';

class ModeloObservadoController = _ModeloObservadoControllerBase with _$ModeloObservadoController;

abstract class _ModeloObservadoControllerBase with Store {
  @observable
  var products = <ProductStore>[].asObservable();

  @action
  void loadProducts() {
    var productsData = [
      ProductStore(product: ProductModel(name: 'Computador'), selected: false),
      ProductStore(product: ProductModel(name: 'Celular'), selected: false),
      ProductStore(product: ProductModel(name: 'Teclado'), selected: false),
      ProductStore(product: ProductModel(name: 'Mouse'), selected: false),
    ];

    products.addAll(productsData);
  }

  void addProduct() {
    products.add(ProductStore(product: ProductModel(name: 'Computador 2'), selected: false));
  }

  void removeProduct() {
    products.removeAt(0);
  }

  @action
  void selectedProduct(int index) {
    var productSelected = products[index].selected;
    products[index].selected = !productSelected;
  }
}
