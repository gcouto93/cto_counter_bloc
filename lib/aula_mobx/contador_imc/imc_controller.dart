import 'dart:math';

import 'package:mobx/mobx.dart';
part 'imc_controller.g.dart';

class ImcController = _ImcControllerBase with _$ImcController;

abstract class _ImcControllerBase with Store {
  @observable
  var imc = 0.0;

  @observable
  String? error;

  @computed
  bool get hasError => error != null;

  @action
  Future<void> calcularImc({required double peso, required double altura}) async {
    try {
      imc = 0.0;
      error = null;
      if (peso == 0 || altura == 0) {
        error = 'Peso e altura devem ser maiores que zero';
        return;
      }
      await Future.delayed(const Duration(seconds: 1));
      imc = peso / pow(altura, 2);
      if (imc > 30) {
        throw Exception('Obesidade');
      }
    } on Exception catch (e) {
      error = 'Erro ao calcular IMC: $e';
    }
  }
}
