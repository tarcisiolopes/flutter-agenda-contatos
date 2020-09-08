import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

final String contactTable = "contactTable";
final String idColumn = "idColumn";
final String nomeColumn = "nomeColumn";
final String sobrenomeColumn = "sobrenomeColumn";
final String emailColumn = "emailColumn";
final String telefoneColumn = "telefoneColumn";
final String imgColumn = "imgColumn";

class ContactHelper {
  static final ContactHelper _instance = ContactHelper.internal();

  factory ContactHelper() => _instance;

  ContactHelper.internal();

  Database _db;

  Future<Database> get db async {
    if (_db != null) {
      return db;
    } else {
      _db = await initDb();
      return _db;
    }
  }

  Future<Database> initDb() async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, "contacts.db");

    return openDatabase(path, version: 1,
        onCreate: (Database db, int newerVersion) async {
      await db.execute(
          "CREATE TABLE $contactTable($idColumn INTEGER PRIMARY KEY, $nomeColumn TEXT, $sobrenomeColumn TEXT, $emailColumn TEXT, $telefoneColumn TEXT, $imgColumn TEXT)");
    });
  }
}

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
