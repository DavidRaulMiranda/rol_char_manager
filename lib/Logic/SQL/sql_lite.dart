//import 'dart:html';
//import 'dart:io';

import 'dart:io';

import 'package:path/path.dart';

import 'package:path_provider/path_provider.dart';
import 'package:rol_char_manager/Logic/obj/career.dart';
import 'package:rol_char_manager/Logic/obj/character.dart';
import 'package:rol_char_manager/Logic/obj/spez.dart';
import 'package:rol_char_manager/main.dart';
import 'package:sqflite/sqflite.dart';

import '../obj/species.dart';

class DBProvider {
  static Database? _database;
  static final DBProvider db = DBProvider._();

  DBProvider._();

  Future<Database?> get database async {
    // If database exists, return database
    if (_database != null) return _database;

    // If database don't exists, create one
    _database = await initDB();

    return _database;
  }

  // Create the database and the Employee table
  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(
        documentsDirectory.path, 'char_manager_v0_3.db'); //employee_manager.db

    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
//    CHARACTER
      await db.execute('CREATE TABLE Character('
          'id INTEGER PRIMARY KEY,'
          //  generic
          'char_name TEXT,'
          'char_sur_name TEXT,'
          'char_avatar TEXT,'
          'char_descr TEXT,'
          'char_species INTEGER,'
          'cahr_spec INTEGER,'
          'FOREIGN KEY (char_species) REFERENCES Species(id),'
          'FOREIGN KEY (cahr_spec) REFERENCES Spez(id)'
          ')');

//    SPECIES
      await db.execute('CREATE TABLE Species('
          'id INTEGER PRIMARY KEY,'
          'species_name TEXT,'
          'species_descr TEXT,'
          'wound_thre INTEGER,'
          'strain_thre INTEGER,'
          'initial_exp TEXT'
          // SPECIAL HABILITIES
          ')');
//    CAREEER
      await db.execute('CREATE TABLE Career('
          'id INTEGER PRIMARY KEY,'
          'career_name TEXT,'
          'career_descr TEXT,'
          'career_skills'
          ')');
//    SPECIALIZATION
      await db.execute('CREATE TABLE Spez('
          'id INTEGER PRIMARY KEY,'
          'id_career INTEGER,'
          'spez_name TEXT,'
          'spez_descr TEXT,'
          'spez_skills,'
          'FOREIGN KEY (id_career) REFERENCES Career(id)'
          ')');
    });
  }

  /////////////////////////////////////////////////////////
  //                      Create 1                        //
  /////////////////////////////////////////////////////////
  ///create char
  CreateCharacter(Character character) async {
    await DeleteAllCharacter();
    final db = await database;
    final res = await db?.insert('Character', character.toJson());
    return res;
  }

  ///create spez
  CreateSpez(Spez spez) async {
    await DeleteAllSpez();
    final db = await database;
    final res = await db?.insert('Spez', spez.toJson());
    return res;
  }

  ///create carreer
  CreateCarreer(Career career) async {
    await DeleteAllCareer();
    final db = await database;
    final res = await db?.insert('Career', career.toJson());
    return res;
  }

  ///create species
  CreateSpecies(Species species) async {
    await DeleteAllSpecies();
    final db = await database;
    final res = await db?.insert('Species', species.toJson());
    return res;
  }

  /////////////////////////////////////////////////////////
  //                      delete  all                   //
  /////////////////////////////////////////////////////////
  Future<int?> DeleteAllCharacter() async {
    final db = await database;
    final res = await db?.rawDelete('DELETE FROM Character');

    return res;
  }

  Future<int?> DeleteAllSpez() async {
    final db = await database;
    final res = await db?.rawDelete('DELETE FROM Spez');

    return res;
  }

  Future<int?> DeleteAllCareer() async {
    final db = await database;
    final res = await db?.rawDelete('DELETE FROM Career');

    return res;
  }

  Future<int?> DeleteAllSpecies() async {
    final db = await database;
    final res = await db?.rawDelete('DELETE FROM Species');

    return res;
  }

  /////////////////////////////////////////////////////////
  //                      delete  1                  //
  /////////////////////////////////////////////////////////
  Future<int?> DeleteOneCharacter(int id) async {
    final db = await database;
    final res = await db?.rawDelete('DELETE FROM Character WHERE id = ?', [id]);

    return res;
  }

  /////////////////////////////////////////////////////////
  //                      load 1                //
  /////////////////////////////////////////////////////////
  Future<int?> InsertCaracter(Character character) async {
    final db = await database;
    final res = await db?.insert('Character', character.toJson());
    return res;
  }

  /////////////////////////////////////////////////////////
  //                      Selects                        //
  /////////////////////////////////////////////////////////
  Future<List<Character?>> getAllCharacters() async {
    final db = await database;
    final res = await db?.rawQuery("SELECT * FROM Character");

    List<Character> list =
        res!.isNotEmpty ? res.map((c) => Character.fromJson(c)).toList() : [];
    return list;
  }

  Future<List<Species?>> getAllSpecies() async {
    final db = await database;
    final res = await db?.rawQuery("SELECT * FROM Species");

    List<Species> list =
        res!.isNotEmpty ? res.map((c) => Species.fromJson(c)).toList() : [];
    return list;
  }

  //is id free?

  //get speceis from id
  Future<Species?> getSpecies(int idSec) async {
    final db = await database;
    final res = await db
        ?.rawQuery("SELECT * FROM Character where id =" + idSec.toString());

    List<Species> list =
        res!.isNotEmpty ? res.map((c) => Species.fromJson(c)).toList() : [];
    Species? s;
    if (list.length > 0) {
      s = list[0];
    } else {
      s = null;
    }
    return s;
  }

  // get spec and carreer from id

  /*Future<List<Species?>> getAllSpecies() async {
    final db = await database;
    final res = await db?.rawQuery("SELECT * FROM Species");

    List<Species> list =
        res!.isNotEmpty ? res.map((c) => Species.fromJson(c)).toList() : [];
    update = true;
    return list;
  }
*/
  /////tests
  ///
  Future<String?> testMatrix() async {
    final db = await database;
    final res = await db?.rawQuery("SELECT * FROM Character");

    List<Character> list =
        res!.isNotEmpty ? res.map((c) => Character.fromJson(c)).toList() : [];
    update = true;
    return (res.toString());
  }

  ///////////////////////////////////////////////////////////////////7
  /// delete 1
  ////////////////////////////////////////////////////////////////////
}
