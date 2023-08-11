import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';
import 'package:semana_academica/pages/contato_consulta_page.dart';
import 'package:semana_academica/pages/contato_editar_page..dart';
import 'package:semana_academica/pages/contato_page.dart';

Future<void> main() async {

  WidgetsFlutterBinding.ensureInitialized();
  const keyApplicationId = 'BpYLhEjmNBTPpxTbn6gfjIsZqUMCPR2YwuYXGe3f';
  const keyClientKey = 'NW8XFiZHWaIykjsD2F56b4RXRmdu7fxloWZ2Y0bG';
  const keyParseServerUrl = 'https://parseapi.back4app.com';

  await Parse().initialize(keyApplicationId, keyParseServerUrl,
      clientKey: keyClientKey, debug: true);
      
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/':(_) => const ContatoConsultaPage(),
        '/novo':(_) => const ContatoPage(), 
        '/editar':(_) => const ContatoEditarPage(),
      },
    );
  }
}
