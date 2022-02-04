import 'package:flutter/material.dart';
import 'package:rol_char_manager/Logic/API/api.dart';
import 'package:rol_char_manager/Logic/SQL/sql_lite.dart';
import 'package:rol_char_manager/Logic/obj/character.dart';

import 'Pages/add_caharacter/caharacter.add.dart';
import 'Pages/add_caharacter/character_add_gen_inf.dart';
import 'Pages/character_list.dart';
import 'Pages/test_page.dart';
import 'data/constants.dart';

void main() => runApp(MyApp());
//DBProvider dbp = ;
List<Character> characters = [];
bool initialize = true;
bool update = false;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Constants.appName,
      initialRoute: 'charList',
      routes: {
        //'addchar': (BuildContext context) => CharacterAdd(),
        //'deta': (BuildContext context) => PeliculaDetalle(),
        'test': (BuildContext context) => MdMenu(),
        'charList': (BuildContext context) => CharacterListPage(),
        'charAdd': (BuildContext context) => CharacterAddPage(),
        //'charDetail': (BuildContext context) => CharacterDetailPage(),
      },
    );
  }
}
