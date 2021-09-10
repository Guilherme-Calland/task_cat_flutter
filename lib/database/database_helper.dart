import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _databaseHelper = DatabaseHelper._internal();

  factory DatabaseHelper(){
    return _databaseHelper;
  }

  DatabaseHelper._internal();

  Database? _database;

  get database async {
    if(_database == null){
      _database = await _initializeDatabase();
    }

    return _database;
  }

  _initializeDatabase() async {
    final path = await getDatabasesPath();
    final file = join(path, 'taskcat_.db');
    final db = await openDatabase(file, version: 1, onCreate: _onCreate);
    return db;
  }

  _onCreate(Database db, int version) async {
    String sql = 'CREATE TABLE tasks('
        'id INTEGER PRIMARY KEY AUTOINCREMENT,'
        'name VARCHAR'
        ')';
    await db.execute(sql);
  }

  create(Map data) async {
    final db = await database;
    int? result = await db.insert('tasks', data);
    return result;
  }

  read() async{
    final db = await database;
    String sql = 'SELECT * FROM tasks ORDER BY id';
    List rawData = await db.rawQuery(sql);
    return rawData;
  }

  update(Map task) async {
    final db = await database;
    int result = await db.update(
      'tasks',
      task,
      where: 'id = ?',
      whereArgs: [task['id']],
    );
    return result;
  }

  delete(int id) async {
    final db = await database;
    int result = await db.delete(
      'tasks',
      where: 'id = ?',
      whereArgs: [id],
    );
    return result;
  }
}