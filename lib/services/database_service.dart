import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class DatabaseService {
  static Database? _database;

  // Step 1: Get DB path and open/create DB
  static Future<Database> initDB() async {
    if (_database != null) return _database!;

    final docsDir = await getApplicationDocumentsDirectory();
    final path = join(docsDir.path, 'feedback.db');

    _database = await openDatabase(
      path,
      version: 1,
      onCreate: (db, _) async {
        await db.execute('''
          CREATE TABLE feedback (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            userName TEXT,
            deviceModel TEXT,
            androidVersion TEXT,
            description TEXT,
            imagePath TEXT
          )
        ''');
      },
    );

    return _database!;
  }

  // Step 2: Insert feedback data into DB
  static Future<void> insertFeedback(
    String userName,
    String deviceModel,
    String androidVersion,
    String description,
    String imagePath,
  ) async {
    final db = await initDB();

    await db.insert('feedback', {
      'userName': userName,
      'deviceModel': deviceModel,
      'androidVersion': androidVersion,
      'description': description,
      'imagePath': imagePath,
    });

    print('✅ Feedback inserted!');
  }

  // Step 3: Print all feedbacks to the console (VS Code)
  static Future<void> printAllFeedbacks() async {
    final db = await initDB();
    final List<Map<String, dynamic>> rows = await db.query('feedback');

    print("📦 STORED FEEDBACK DATA:");
    for (var row in rows) {
      print(row);
    }
    print("✅ END OF FEEDBACK DATA\n");
  }
}
