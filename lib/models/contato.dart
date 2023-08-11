import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

class Contato {
  String? id;
  String name = '';
  String phone = '';
  String email = '';
  
  Contato({
    this.id,
    required this.name,
    required this.phone,
    required this.email,
  });

  Contato.fromParse(ParseObject object) {
    id = object.objectId;
    name = object.get<String>('name')!;
    phone = object.get<String>('phone')!;
    email = object.get<String>('email')!;
  }

  @override
  String toString() {
    return 'Contato(id: $id, name: $name, phone: $phone, email: $email)';
  }
}
