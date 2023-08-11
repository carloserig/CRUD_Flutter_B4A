import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:semana_academica/components/error_box.dart';
import 'package:semana_academica/components/titulo_subtitulo.dart';
import 'package:semana_academica/models/contato.dart';
import 'package:semana_academica/stores/contato_store.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class ContatoEditarPage extends StatefulWidget {

  const ContatoEditarPage({ super.key });

  @override
  State<ContatoEditarPage> createState() => _ContatoEditarPageState();
}

class _ContatoEditarPageState extends State<ContatoEditarPage> {

  final contatoStore = ContatoStore();
  var contatoEditado = Contato(id: '', name: '', phone: '', email: '');
  
  var tecId = TextEditingController();
  var tecName = TextEditingController();
  var tecPhone = TextEditingController();
  var tecEmail = TextEditingController();

  void _setValues() {
    tecId.text = contatoEditado.id!;
    tecName.text = contatoEditado.name;
    tecPhone.text = contatoEditado.phone;
    tecEmail.text = contatoEditado.email;

    contatoStore.setId(tecId.text);
    contatoStore.setName(tecName.text);
    contatoStore.setPhone(tecPhone.text);
    contatoStore.setEmail(tecEmail.text);
  }

  @override
  void dispose() {
    tecId.dispose();
    tecName.dispose();
    tecPhone.dispose();
    tecEmail.dispose();
    super.dispose();
  }


  @override
  initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      var param = ModalRoute.of(context)?.settings.arguments as Contato;
      setState(() {
        contatoEditado = Contato(id: param.id, name: param.name, phone: param.phone, email: param.email);
        print('contato editado ==> $contatoEditado');
        _setValues();
      });
     });
  }

   @override
   Widget build(BuildContext context) {
       return Scaffold(
      appBar: AppBar(
        title: const Text('Edição de Contato'),
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
                          titulo: 'ID',
                          subtitulo: '* Somente leitura'),
                      TextField(
                          controller: tecId,
                          enabled: false,
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
                          titulo: 'Nome',
                          subtitulo: 'Digite o nome completo'),
                      TextField(
                          controller: tecName,
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
                          controller: tecPhone,
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
                          controller: tecEmail,
                          enabled: !contatoStore.loading,
                          cursorColor: Colors.blue,
                          maxLines: 1,
                          keyboardType: TextInputType.emailAddress,
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
                                  await contatoStore.atualizarContato();
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