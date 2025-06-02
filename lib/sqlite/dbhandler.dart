
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:quize/Models/userModel.dart';

class DBHandler {
  

 


  String createTable='''
    CREATE TABLE user(
      firstName TEXT,
      lastName TEXT,
      userName TEXT PRIMARY KEY,
      email TEXT,
      password TEXT
    )''';

    

  Future<Database> initDB() async {

    final databasePath=await getDatabasesPath();
    final path=join(databasePath,"Authenticate.db");
    
    return openDatabase(path,version: 1,onCreate: (db, version)async{

      await db.execute(createTable);



    });

    


  }

  Future<int> signUp(UserModel U) async{

    Database db=await initDB();

    return await db.insert(
            "user",
             U.toMap(),
            
    );





  }
  Future<bool> login(UserModel u)async{
    Database db=await initDB();

    var res=await db.rawQuery('''SELECT *FROM user WHERE username="${u.userName}" AND password="${u.password}"''');

    if(res.isNotEmpty){
      return true;

    }
    else{

      return false;
    }


  }


}