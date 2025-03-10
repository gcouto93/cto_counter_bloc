// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contador_codege_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ContadorCodegeController on _ContadorCodegenControllerBase, Store {
  Computed<String>? _$saudacaoComputed;

  @override
  String get saudacao =>
      (_$saudacaoComputed ??= Computed<String>(() => super.saudacao,
              name: '_ContadorCodegenControllerBase.saudacao'))
          .value;

  late final _$contadorAtom =
      Atom(name: '_ContadorCodegenControllerBase.contador', context: context);

  @override
  int get contador {
    _$contadorAtom.reportRead();
    return super.contador;
  }

  @override
  set contador(int value) {
    _$contadorAtom.reportWrite(value, super.contador, () {
      super.contador = value;
    });
  }

  late final _$fullNameAtom =
      Atom(name: '_ContadorCodegenControllerBase.fullName', context: context);

  @override
  FullName get fullName {
    _$fullNameAtom.reportRead();
    return super.fullName;
  }

  @override
  set fullName(FullName value) {
    _$fullNameAtom.reportWrite(value, super.fullName, () {
      super.fullName = value;
    });
  }

  late final _$_ContadorCodegenControllerBaseActionController =
      ActionController(
          name: '_ContadorCodegenControllerBase', context: context);

  @override
  void incrementar() {
    final _$actionInfo = _$_ContadorCodegenControllerBaseActionController
        .startAction(name: '_ContadorCodegenControllerBase.incrementar');
    try {
      return super.incrementar();
    } finally {
      _$_ContadorCodegenControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void decrementar() {
    final _$actionInfo = _$_ContadorCodegenControllerBaseActionController
        .startAction(name: '_ContadorCodegenControllerBase.decrementar');
    try {
      return super.decrementar();
    } finally {
      _$_ContadorCodegenControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeName() {
    final _$actionInfo = _$_ContadorCodegenControllerBaseActionController
        .startAction(name: '_ContadorCodegenControllerBase.changeName');
    try {
      return super.changeName();
    } finally {
      _$_ContadorCodegenControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
contador: ${contador},
fullName: ${fullName},
saudacao: ${saudacao}
    ''';
  }
}
