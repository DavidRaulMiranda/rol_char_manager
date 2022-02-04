import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rol_char_manager/Logic/API/api.dart';
import 'package:rol_char_manager/Logic/SQL/sql_lite.dart';
import 'package:rol_char_manager/Logic/obj/character.dart';
import 'package:rol_char_manager/Logic/obj/species.dart';
import 'package:rol_char_manager/Widgets/characer_card.dart';
import 'package:rol_char_manager/Widgets/generic/generic_app_card.dart';
import 'package:rol_char_manager/main.dart';

class CharacterAddPage extends StatefulWidget {
  CharacterAddPage({Key? key}) : super(key: key);

  //Future<List<Species?>> species = DBProvider.db.getAllSpecies();
  //Future<String?> FillComboBox() async {
  //final db = await database;
  //final res = await db?.rawDelete('DELETE FROM Character');

  //return res;
  //}

  @override
  _CharacterAddPageState createState() => _CharacterAddPageState();
}

class _CharacterAddPageState extends State<CharacterAddPage> {
  get isLoading => null;
  //Future<List<Character?>> char = DBProvider.db.getAllCharacters();
  TextEditingController name = new TextEditingController();
  TextEditingController surname = new TextEditingController();
  TextEditingController desc = new TextEditingController();
  TextEditingController url = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    var dropdownValue;
    return Scaffold(
        appBar: AppBar(
          title: const Text("Character Creation!!",
              style: TextStyle(color: Colors.white)),
          centerTitle: true,
          backgroundColor: Colors.black,
        ),
        body: SingleChildScrollView(
            child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextField(
              controller: name,
              style: const TextStyle(decoration: TextDecoration.none),
              //onChanged: (v) => nameController.text = v,
              decoration: const InputDecoration(
                labelText: "name",
                labelStyle: TextStyle(color: Colors.black),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextField(
              controller: surname,
              style: const TextStyle(decoration: TextDecoration.none),
              //onChanged: (v) => nameController.text = v,
              decoration: const InputDecoration(
                labelText: "surname",
                labelStyle: TextStyle(color: Colors.black),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextField(
              controller: desc,
              style: const TextStyle(decoration: TextDecoration.none),
              //onChanged: (v) => nameController.text = v,
              decoration: const InputDecoration(
                labelText: "description",
                labelStyle: TextStyle(color: Colors.black),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: TextField(
              controller: url,
              style: const TextStyle(decoration: TextDecoration.none),
              //onChanged: (v) => nameController.text = v,
              decoration: const InputDecoration(
                labelText: "url",
                labelStyle: TextStyle(color: Colors.black),
              ),
            ),
          ),
          /*
          Padding(
              padding: const EdgeInsets.all(20),
              child: DropdownButton<String>(
                value: dropdownValue,
                icon: const Icon(Icons.arrow_downward),
                elevation: 16,
                style: const TextStyle(color: Colors.deepPurple),
                underline: Container(
                  height: 2,
                  color: Colors.deepPurpleAccent,
                ),
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownValue = newValue!;
                  });
                },
                
                items: <String>['One', 'Two', 'Free', 'Four']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              )),
          Padding(
              padding: const EdgeInsets.all(20),
              child: DropdownButton<String>(
                value: dropdownValue,
                icon: const Icon(Icons.arrow_downward),
                elevation: 16,
                style: const TextStyle(color: Colors.deepPurple),
                underline: Container(
                  height: 2,
                  color: Colors.deepPurpleAccent,
                ),
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownValue = newValue!;
                  });
                },
                items: <String>['One', 'Two', 'Free', 'Four']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              )),
          Padding(
              padding: const EdgeInsets.all(20),
              child: DropdownButton<String>(
                value: dropdownValue,
                icon: const Icon(Icons.arrow_downward),
                elevation: 16,
                style: const TextStyle(color: Colors.deepPurple),
                underline: Container(
                  height: 2,
                  color: Colors.deepPurpleAccent,
                ),
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownValue = newValue!;
                  });
                },
                items: <String>['One', 'Two', 'Free', 'Four']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
              )),*/
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Builder(
              builder: (context) {
                return ElevatedButton(
                  onPressed: () async => CreateChar(context),
                  child: const Text('Create Character'),
                );
              },
            ),
          )
        ])));
  }

  Future<List<Character?>> _getList() {
    return Future.value(DBProvider.db.getAllCharacters());
  }

  void CreateChar(BuildContext context) async {
    Future<List<Character?>> _futureOfList = _getList();
    List<Character?> char = await _futureOfList;
    if (name.text.isNotEmpty && surname.text.isNotEmpty) {
      int newid = 0;
      bool escape = false, found = false;
      for (var i = 1; i < 100 && escape == false; i++) {
        found = false;
        for (var item in char) {
          if (item != null && item.id == i) {
            found = true;
          }
        }
        if (found == false) {
          escape = true;
          newid = i;
        }
      }
      if (newid != 0) {
        Character newChar = new Character();
        newChar.id = newid;
        newChar.char_name = name.text;
        newChar.char_sur_name = surname.text;
        newChar.char_descr = desc.text;
        newChar.char_avatar = url.text;
        newChar.cahr_spec = 1;
        newChar.char_species = 1;

        DBProvider.db.InsertCaracter(newChar);
        Map map = newChar.toJson();
        ApiDataTrader.pushChar(map);

        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          backgroundColor: Colors.redAccent,
          content: Text('creation of character succesfull!'),
        ));
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        backgroundColor: Colors.redAccent,
        content: Text('Name, surname and all combo boxes must be filed!'),
      ));
    }
  }
}
