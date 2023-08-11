import 'package:mobx/mobx.dart';
import 'package:semana_academica/helpers/extensions.dart';
import 'package:semana_academica/models/contato.dart';
import 'package:semana_academica/repositories/contato_repository.dart';
part 'contato_store.g.dart';

class ContatoStore = ContatoStoreBase with _$ContatoStore;

abstract class ContatoStoreBase with Store {
  @observable
  String? id;
  @action
  void setId(String value) => id = value;
  
  @observable
  String name = '';
  @action
  void setName(String value) => name = value;
  @computed
  bool get nameValid => name.isNotEmpty && name.length > 5;
  String? get nameError {
    if (nameValid) {
      return null;
    } else if (name.isEmpty) {
      return 'Campo Obrigatório';
    } else {
      return 'Nome inválido';
    }
  }

  @observable
  String phone = '';
  @action
  void setPhone(String value) => phone = value;
  @computed
  bool get phoneValid => phone.isNotEmpty && phone.length > 14;
  String? get phoneError {
    if (phoneValid) {
      return null;
    } else if (phone.isEmpty) {
      return 'Campo Obrigatório';
    } else {
      return 'Celular inválido';
    }
  }

  @observable
  String email = '';
  @action
  void setEmail(String value) => email = value;
  @computed
  bool get emailValid => email.isNotEmpty && email.isEmailValid();
  String? get emailError {
    if (emailValid) {
      return null;
    } else if (email.isEmpty) {
      return 'Campo Obrigatório';
    } else {
      return 'Email inválido';
    }
  }
  @observable
  String? notification;

  @observable
  bool loading = false;
  @action
  void setLoading(bool value) =>loading = value;

  @action
  Future<void> salvarContato() async {
    final contato = Contato(
      name: name,
      phone: phone,
      email: email
    );
    loading = true;
    try {
      var result = await ContatoRepository().salvarContato(contato);
      notification = '${result!.name} cadastrada com sucesso';
      await Future.delayed(const Duration(seconds: 2));
      notification = null;
    } catch (e) {
      notification = e.toString();
    }
    loading = false;    
  }

  @action
  Future<void> atualizarContato() async {
    final contato = Contato(
      id: id,
      name: name,
      phone: phone,
      email: email
    );
    loading = true;
    try {
      var result = await ContatoRepository().atualizarContato(contato);
      notification = '${result!.name} atualizado com sucesso';
      await Future.delayed(const Duration(seconds: 2));
      notification = null;
    } catch (e) {
      notification = e.toString();
    }
    loading = false;    
  }

  @action
  Future<void> deletarContato(String id) async {
    loading = true;
    try {
      var result = await ContatoRepository().deletarContato(id);
      notification = '$result deletado com sucesso';
      await Future.delayed(const Duration(seconds: 2));
      notification = null;
    } catch (e) {
      notification = e.toString();
    }
    loading = false;    
  }

  @observable
  List<Contato> contatosList = [];

  @action
  Future<void> buscarTodosContatos() async {
    contatosList = [];
    loading = true;
    try {
      notification = 'Buscando contatos';
      await Future.delayed(const Duration(seconds: 2));
      contatosList = await ContatoRepository().buscarTodosContatos();
      notification = null;
    } catch (e) {
      notification = e.toString();
    }
    loading = false;    
  }
}