// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'modelo_observado_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ModeloObservadoController on _ModeloObservadoControllerBase, Store {
  late final _$productsAtom =
      Atom(name: '_ModeloObservadoControllerBase.products', context: context);

  @override
  ObservableList<ProductStore> get products {
    _$productsAtom.reportRead();
    return super.products;
  }

  @override
  set products(ObservableList<ProductStore> value) {
    _$productsAtom.reportWrite(value, super.products, () {
      super.products = value;
    });
  }

  late final _$_ModeloObservadoControllerBaseActionController =
      ActionController(
          name: '_ModeloObservadoControllerBase', context: context);

  @override
  void loadProducts() {
    final _$actionInfo = _$_ModeloObservadoControllerBaseActionController
        .startAction(name: '_ModeloObservadoControllerBase.loadProducts');
    try {
      return super.loadProducts();
    } finally {
      _$_ModeloObservadoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void selectedProduct(int index) {
    final _$actionInfo = _$_ModeloObservadoControllerBaseActionController
        .startAction(name: '_ModeloObservadoControllerBase.selectedProduct');
    try {
      return super.selectedProduct(index);
    } finally {
      _$_ModeloObservadoControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
products: ${products}
    ''';
  }
}
