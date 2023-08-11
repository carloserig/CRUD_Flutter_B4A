import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:semana_academica/components/error_box.dart';
import 'package:semana_academica/components/titulo_subtitulo.dart';
import 'package:semana_academica/stores/contato_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ContatoPage extends StatefulWidget {

  const ContatoPage({ super.key });

  @override
  State<ContatoPage> createState() => _ContatoPageState();
}

class _ContatoPageState extends State<ContatoPage> {

  final contatoStore = ContatoStore();

   @override
   Widget build(BuildContext context) {
       return Scaffold(
      appBar: AppBar(
        title: const Text('Novo Contato'),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: SingleChildScrollView(
            child: Observer(
              builder: (_) {
                return Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ErrorBox(
                        message: contatoStore.notification,
                      ),
                      TituloSubtitulo(
                          titulo: 'Nome',
                          subtitulo: 'Digite o nome completo'),
                      TextField(
                          enabled: !contatoStore.loading,
                          cursorColor: Colors.blue,
                          maxLines: 1,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            isDense: true,
                            errorText: contatoStore.nameError,
                          ),
                          onChanged: (value) {
                            contatoStore.setName(value);
                          }),
                      TituloSubtitulo(
                          titulo: 'Celular',
                          subtitulo: 'Informe o nº Celular'),
                      TextField(
                          enabled: !contatoStore.loading,
                          cursorColor: Colors.blue,
                          maxLines: 1,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(),
                              isDense: true,
                              hintText: '(99) 99999-9999',
                              errorText: contatoStore.phoneError),
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            TelefoneInputFormatter(),
                          ],
                          onChanged: (value) {
                            contatoStore.setPhone(value);
                          }),
                      TituloSubtitulo(
                          titulo: 'E-mail',
                          subtitulo: 'Informe o melhor e-mail'),
                      TextField(
                          enabled: !contatoStore.loading,
                          cursorColor: Colors.blue,
                          maxLines: 1,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            isDense: true,
                            errorText: contatoStore.emailError,
                          ),
                          onChanged: (value) {
                            contatoStore.setEmail(value);
                          }),
                      Padding(
                        padding: const EdgeInsets.only(left: 3, top: 20),
                        child: ElevatedButton(
                            child: contatoStore.loading
                                ? Padding(
                                    padding: const EdgeInsets.only(
                                        top: 16.0, bottom: 16.0),
                                    child: const CircularProgressIndicator(
                                      valueColor:
                                          AlwaysStoppedAnimation(Colors.white),
                                    ),
                                  )
                                : Padding(
                                    padding: const EdgeInsets.only(
                                        top: 16.0, bottom: 16.0),
                                    child: const Text(
                                      'Salvar Alterações',
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                            onPressed: () async {
                              if(contatoStore.nameValid && contatoStore.phoneValid 
                                 && contatoStore.emailValid) {
                                  await contatoStore.salvarContato();
                                  Navigator.pop(context);

                              } else {
                                contatoStore.notification = 'Dados do formulário inconsistentes!';
                                await Future.delayed(const Duration(seconds: 2));
                              }
                              
                            }),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}