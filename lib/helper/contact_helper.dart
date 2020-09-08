import 'package:sqflite/sqflite.dart';

final String idColumn = "idColumn";
final String nomeColumn = "nomeColumn";
final String sobrenomeColumn = "sobrenomeColumn";
final String emailColumn = "emailColumn";
final String telefoneColumn = "telefoneColumn";
final String imgColumn = "imgColumn";

class ContactHelper {}

class Contact {
  int id;
  String nome;
  String sobrenome;
  String email;
  String telefone;
  String img;

  Contact.fromMap(Map map) {
    id = map[idColumn];
    nome = map[nomeColumn];
    sobrenome = map[sobrenomeColumn];
    email = map[emailColumn];
    telefone = map[telefoneColumn];
    img = map[imgColumn];
  }

  Map toMap() {
    Map<String, dynamic> map = {
      nomeColumn: nome,
      sobrenomeColumn: sobrenome,
      emailColumn: email,
      telefoneColumn: telefone,
      imgColumn: img
    };
    if (id != null) {
      map[idColumn] = id;
    }
    return map;
  }

  @override
  String toString() {
    return "Contact(id: $id, nome: $nome, sobrenome $sobrenome, email: $email, telefone: $telefone, img: $img)";
  }
}
