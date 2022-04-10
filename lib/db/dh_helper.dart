import 'package:productapp_batch7/models/product_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as path;

class DBSQLiteHelper{
  //create a table here
  //table Column name and DataType
  static final String _CREATE_TABLE_PRODUCT='''create table $TABLE_PRODUCT(
  $COL_PRODUCT_ID integer primary key autoincrement,
  $COL_PRODUCT_NAME text not null,
  $COL_PRODUCT_DESCRIPTION text not null,
  $COL_PRODUCT_FORMATTED_DATE text not null,
  $COL_PRODUCT_PRICE real not null,
  $COL_PRODUCT_RATING real not null,
  $COL_PRODUCT_TIMESTAMP integer not null,
  $COL_PRODUCT_MONTH integer not null,
  $COL_PRODUCT_YEAR integer not null,
  $COL_PRODUCT_FAV integer not null,
  $COL_PRODUCT_IMAGE text not null)''';
  static Future<Database?> _open() async{
    final root = await getDatabasesPath();
    final dbPath= path.join(root, 'product.db');
    return openDatabase(dbPath,version: 1,onCreate: (db, version)async{
      await db.execute(_CREATE_TABLE_PRODUCT);
    });
  }
  static Future<int?> insertNewProduct(Product productObj) async{
    final dbobj = await _open();
   return dbobj!.insert(TABLE_PRODUCT, productObj.toMap());
  }


}