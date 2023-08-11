// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contato_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ContatoStore on ContatoStoreBase, Store {
  Computed<bool>? _$nameValidComputed;

  @override
  bool get nameValid =>
      (_$nameValidComputed ??= Computed<bool>(() => super.nameValid,
              name: 'ContatoStoreBase.nameValid'))
          .value;
  Computed<bool>? _$phoneValidComputed;

  @override
  bool get phoneValid =>
      (_$phoneValidComputed ??= Computed<bool>(() => super.phoneValid,
              name: 'ContatoStoreBase.phoneValid'))
          .value;
  Computed<bool>? _$emailValidComputed;

  @override
  bool get emailValid =>
      (_$emailValidComputed ??= Computed<bool>(() => super.emailValid,
              name: 'ContatoStoreBase.emailValid'))
          .value;

  late final _$idAtom = Atom(name: 'ContatoStoreBase.id', context: context);

  @override
  String? get id {
    _$idAtom.reportRead();
    return super.id;
  }

  @override
  set id(String? value) {
    _$idAtom.reportWrite(value, super.id, () {
      super.id = value;
    });
  }

  late final _$nameAtom = Atom(name: 'ContatoStoreBase.name', context: context);

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  late final _$phoneAtom =
      Atom(name: 'ContatoStoreBase.phone', context: context);

  @override
  String get phone {
    _$phoneAtom.reportRead();
    return super.phone;
  }

  @override
  set phone(String value) {
    _$phoneAtom.reportWrite(value, super.phone, () {
      super.phone = value;
    });
  }

  late final _$emailAtom =
      Atom(name: 'ContatoStoreBase.email', context: context);

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  late final _$notificationAtom =
      Atom(name: 'ContatoStoreBase.notification', context: context);

  @override
  String? get notification {
    _$notificationAtom.reportRead();
    return super.notification;
  }

  @override
  set notification(String? value) {
    _$notificationAtom.reportWrite(value, super.notification, () {
      super.notification = value;
    });
  }

  late final _$loadingAtom =
      Atom(name: 'ContatoStoreBase.loading', context: context);

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  late final _$contatosListAtom =
      Atom(name: 'ContatoStoreBase.contatosList', context: context);

  @override
  List<Contato> get contatosList {
    _$contatosListAtom.reportRead();
    return super.contatosList;
  }

  @override
  set contatosList(List<Contato> value) {
    _$contatosListAtom.reportWrite(value, super.contatosList, () {
      super.contatosList = value;
    });
  }

  late final _$salvarContatoAsyncAction =
      AsyncAction('ContatoStoreBase.salvarContato', context: context);

  @override
  Future<void> salvarContato() {
    return _$salvarContatoAsyncAction.run(() => super.salvarContato());
  }

  late final _$atualizarContatoAsyncAction =
      AsyncAction('ContatoStoreBase.atualizarContato', context: context);

  @override
  Future<void> atualizarContato() {
    return _$atualizarContatoAsyncAction.run(() => super.atualizarContato());
  }

  late final _$deletarContatoAsyncAction =
      AsyncAction('ContatoStoreBase.deletarContato', context: context);

  @override
  Future<void> deletarContato(String id) {
    return _$deletarContatoAsyncAction.run(() => super.deletarContato(id));
  }

  late final _$buscarTodosContatosAsyncAction =
      AsyncAction('ContatoStoreBase.buscarTodosContatos', context: context);

  @override
  Future<void> buscarTodosContatos() {
    return _$buscarTodosContatosAsyncAction
        .run(() => super.buscarTodosContatos());
  }

  late final _$ContatoStoreBaseActionController =
      ActionController(name: 'ContatoStoreBase', context: context);

  @override
  void setId(String value) {
    final _$actionInfo = _$ContatoStoreBaseActionController.startAction(
        name: 'ContatoStoreBase.setId');
    try {
      return super.setId(value);
    } finally {
      _$ContatoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setName(String value) {
    final _$actionInfo = _$ContatoStoreBaseActionController.startAction(
        name: 'ContatoStoreBase.setName');
    try {
      return super.setName(value);
    } finally {
      _$ContatoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPhone(String value) {
    final _$actionInfo = _$ContatoStoreBaseActionController.startAction(
        name: 'ContatoStoreBase.setPhone');
    try {
      return super.setPhone(value);
    } finally {
      _$ContatoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEmail(String value) {
    final _$actionInfo = _$ContatoStoreBaseActionController.startAction(
        name: 'ContatoStoreBase.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$ContatoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLoading(bool value) {
    final _$actionInfo = _$ContatoStoreBaseActionController.startAction(
        name: 'ContatoStoreBase.setLoading');
    try {
      return super.setLoading(value);
    } finally {
      _$ContatoStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
id: ${id},
name: ${name},
phone: ${phone},
email: ${email},
notification: ${notification},
loading: ${loading},
contatosList: ${contatosList},
nameValid: ${nameValid},
phoneValid: ${phoneValid},
emailValid: ${emailValid}
    ''';
  }
}
