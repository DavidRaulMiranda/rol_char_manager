import 'package:flutter/cupertino.dart';
import 'package:dio/dio.dart';
import 'package:rol_char_manager/Logic/obj/career.dart';
import 'package:rol_char_manager/Logic/obj/character.dart';
import 'package:rol_char_manager/Logic/obj/species.dart';
import 'package:rol_char_manager/Logic/obj/spez.dart';
import 'package:rol_char_manager/data/constants.dart';

import '../SQL/sql_lite.dart';

class ApiDataTrader {
  /////////////////////////////////////////////////////////
  //                      load all from api into bbdd    //
  /////////////////////////////////////////////////////////
  static Future<void> initialApiLoad() async {
    getSpecials();
    getSpecies();
    getCarreers();
    getCharacter();

    //update lists
  }

  //Track API changes
  /////////////////////////////////////////////////////////
  //                      MAIN DATA                      //
  /////////////////////////////////////////////////////////
  //CHARACTER GET
  static Future<void> getCharacter() async {
    //var url = Constants.apiUrl + Constants.pullCharacter;
    Response response =
        await Dio().get("http://demo0563120.mockable.io/character");

    (response.data as List).map((character) {
      DBProvider.db.CreateCharacter(Character.fromJson(character));
    }).toList();
  }
  //CHARACTER PUSH

  /////////////////////////////////////////////////////////
  //                      GENERIC DATA                   //
  /////////////////////////////////////////////////////////
  //SPECIES GET
  static Future<void> getSpecies() async {
    //var url = Constants.apiUrl + Constants.pullSpecies;
    Response response =
        await Dio().get("http://demo0563120.mockable.io/species");

    (response.data as List).map((species) {
      DBProvider.db.CreateSpecies(Species.fromJson(species));
    }).toList();
  }
  //SPECIES PUSH

  //CARREERS GET
  static Future<void> getCarreers() async {
    //var url = Constants.apiUrl + Constants.pullCareer;
    Response response =
        await Dio().get("http://demo0563120.mockable.io/carreer");

    (response.data as List).map((career) {
      DBProvider.db.CreateCarreer(Career.fromJson(career));
    }).toList();
  }

  //SPECIALS GET
  static Future<void> getSpecials() async {
    // var url = Constants.apiUrl + Constants.pullSpecial;
    Response response = await Dio().get("http://demo0563120.mockable.io/spec");

    (response.data as List).map((spez) {
      DBProvider.db.CreateSpez(Spez.fromJson(spez));
    }).toList();
  }

  //push character data
  static Future<void> pushChar(Map map) async {
    // var url = Constants.apiUrl + Constants.pullSpecial;
    Dio().post("http://demo0563120.mockable.io/test", data: map);
  }
  //light character pull

  //light character push

  /////////////////////////////////////////////////////////
  //                      Iventory Master                //
  /////////////////////////////////////////////////////////

  /////////////////////////////////////////////////////////
  //                       Jobs Master                   //
  /////////////////////////////////////////////////////////

  /////////////////////////////////////////////////////////
  //                      Atachment master               //
  /////////////////////////////////////////////////////////

}
