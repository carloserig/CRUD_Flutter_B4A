import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';
import 'package:semana_academica/models/contato.dart';

class ContatoRepository {
  
  Future<Contato?> salvarContato(Contato contato) async {
    try {
      final contatoObject = ParseObject('Contato'); 
      contatoObject.set<String>('name', contato.name);
      contatoObject.set<String>('phone', contato.phone);
      contatoObject.set<String>('email', contato.email);

      final response = await contatoObject.save();
      if(response.success) {
        return Contato.fromParse(response.result);
      } else {
        return Future.error('Erro ao salvar Contato: ${response.error}');
      }
    } catch (e) {
      return Future.error('Erro ao tentar salvar Contato');
    }

  }

  Future<Contato?> atualizarContato(Contato contato) async {
    try {
      final contatoObject = ParseObject('Contato')
      ..objectId = contato.id
      ..set<String>('name', contato.name)
      ..set<String>('phone', contato.phone)
      ..set<String>('email', contato.email);
 
      final response = await contatoObject.save();

      if(response.success) {
        return Contato.fromParse(response.result);
      } else {
        return Future.error('Erro ao atualizar Contato: ${response.error}');
      }
    } catch (e) {
      return Future.error('Erro ao tentar atualizar Contato');
    }
  }

  Future<String> deletarContato(String id) async {
    try {
      final contatoObject = ParseObject('Contato')
      ..objectId = id;

      final response = await contatoObject.delete();

      if(response.success) {
        return 'Contato excluído com sucesso';
      } else {
        return 'Erro ao excluir Contato';
      }
    } catch (e) {
      return 'Erro ao tentar excluir o Contato';
    }

  }

  Future<List<Contato>> buscarTodosContatos() async {
    try {
      final queryContato = QueryBuilder<ParseObject>(ParseObject('Contato'));
      final response = await queryContato.query();
        if(response.success && response.result != null) {
          return response.results!
          .map((c) => Contato.fromParse(c)).toList();
        }
        else {
          return [];
        }  
    } catch (e) {
      return Future.error('Erro ao buscar Contatos');
    }
  }  
}
