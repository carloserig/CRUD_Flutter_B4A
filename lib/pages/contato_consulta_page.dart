import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:semana_academica/stores/contato_store.dart';

class ContatoConsultaPage extends StatefulWidget {

  const ContatoConsultaPage({ super.key });

  @override
  State<ContatoConsultaPage> createState() => _ContatoConsultaPageState();
}

class _ContatoConsultaPageState extends State<ContatoConsultaPage> {

  final contatoStore = ContatoStore();
  
   @override
   Widget build(BuildContext context) {
    return FutureBuilder(
      future: contatoStore.buscarTodosContatos(),
      builder: ((context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Consulta dos Contatos'),
            ),
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Observer(builder: (_) {
                return Container(
                  child: ListView.builder(
                    itemCount: contatoStore.contatosList.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        child: Card(
                          elevation: 2,
                          shadowColor: Colors.grey,
                          child: Container(
                            padding: EdgeInsets.all(8),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Text(contatoStore.contatosList[index].name,
                                      style: TextStyle(fontSize: 16.0,
                                        fontWeight: FontWeight.w700,),),
                                ),
                              ],
                            ),
                          ),
                        ),
                        onLongPress: () async {
                          await _AlertExcluir(context, index);
                        },
                        onTap: () async {
                          print('contato antes de ir ==> ${contatoStore.contatosList[index]}');
                          await Navigator.of(context).pushNamed('/editar', arguments: contatoStore.contatosList[index]);
                          await contatoStore.buscarTodosContatos();
                        },
                      );
                    },
                  ),
                );
              }),
            ),
            floatingActionButton: FloatingActionButton.extended(
              onPressed: () async {
                await Navigator.of(context).pushNamed('/novo');
                await contatoStore.buscarTodosContatos();
              },
              label: const Text('Novo'),
              icon: const Icon(Icons.save),
              backgroundColor: Colors.blue,
            ),
          );
        } else if (snapshot.hasError) {
          return Scaffold(
            body: Center(
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Erro ao obter dados'),
                    ElevatedButton(
                        onPressed: () {
                          contatoStore.buscarTodosContatos();
                        },
                        child: const Text('Tentar novamente'))
                  ],
                ),
              ),
            ),
          );
        } else {
          return Container(
            color: Colors.blue,
            child: Center(
              child: CircularProgressIndicator(
                color: Colors.white,
              ),
            ),
          );
        }
      }),
    );
  }

  Future<void> _AlertExcluir(BuildContext context, int index) async {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Tem certeza que deseja excluir o registro?'),
            content: SingleChildScrollView(
              child: ListBody(
                children: [
                  Center(),
                ],
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Observer(builder: (_) {
                  return ElevatedButton(
                    child: contatoStore.loading
                        ? Padding(
                            padding:
                                const EdgeInsets.only(top: 20.0, bottom: 20.0),
                            child: const CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation(Colors.white),
                            ),
                          )
                        : Padding(
                            padding:
                                const EdgeInsets.only(top: 20.0, bottom: 20.0),
                            child: const Text(
                              'Excluir',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ),
                    onPressed: () async {
                      await contatoStore.deletarContato(
                          contatoStore.contatosList[index].id.toString());
                      Navigator.pop(context);
                      await contatoStore.buscarTodosContatos();
                    },
                  );
                }),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Observer(builder: (_) {
                  return ElevatedButton(
                    child: Padding(
                            padding:
                                const EdgeInsets.only(top: 20.0, bottom: 20.0),
                            child: const Text(
                              'Cancelar',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ),
                    onPressed: () async {
                      Navigator.pop(context);
                    },
                  );
                }),
              ),
            ],
          );
        });
  }
}