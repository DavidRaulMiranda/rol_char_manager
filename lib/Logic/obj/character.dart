import 'dart:convert';

List<Character> employeeFromJson(String str) =>
    List<Character>.from(json.decode(str).map((x) => Character.fromJson(x)));

String employeeToJson(List<Character> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Character {
  //varaible items
  int? id;
  String? char_name;
  String? char_sur_name;
  String? char_avatar;
  String? char_descr;
  int? char_species;
  int? cahr_spec;

  Character({
    this.id,
    this.char_name,
    this.char_sur_name,
    this.char_avatar,
    this.char_descr,
    this.char_species,
    this.cahr_spec,
  });
  Character.fromForm(
    this.id,
    this.char_name,
    this.char_sur_name,
    this.char_avatar,
    this.char_descr,
    this.char_species,
    this.cahr_spec,
  );
  factory Character.fromJson(Map<String, dynamic> json) => Character(
        //variable items
        id: json["id"],
        char_name: json["char_name"],
        char_sur_name: json["char_sur_name"],
        char_avatar: json["char_avatar"],
        char_descr: json["char_descr"],
        char_species: json["char_species"],
        cahr_spec: json["cahr_spec"],
      );

  Map<String, dynamic> toJson() => {
        //variable items
        "id": id,
        "char_name": char_name,
        "char_sur_name": char_sur_name,
        "char_avatar": char_avatar,
        "char_descr": char_descr,
        "char_species": char_species,
        "cahr_spec": cahr_spec,
      };
}
