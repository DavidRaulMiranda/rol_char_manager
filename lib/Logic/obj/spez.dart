import 'dart:convert';

List<Spez> spezFromJson(String str) =>
    List<Spez>.from(json.decode(str).map((x) => Spez.fromJson(x)));

String spezToJson(List<Spez> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Spez {
  int? id;
  int? id_career;
  String? spez_name;
  String? spez_descr;
  List<int>? skills;

  Spez({
    this.id,
    this.id_career,
    this.spez_name,
    this.spez_descr,
    this.skills,
  });
  Spez.fromForm(
    this.id,
    this.id_career,
    this.spez_name,
    this.spez_descr,
    this.skills,
  );
  factory Spez.fromJson(Map<String, dynamic> json) => Spez(
        //variable items
        id: json["id"],
        id_career: json["id_career"],
        spez_name: json["spez_name"],
        spez_descr: json["spez_descr"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "id_career": id_career,
        "spez_name": spez_name,
        "spez_descr": spez_descr,
      };
}
