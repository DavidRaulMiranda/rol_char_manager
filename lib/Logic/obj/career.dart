import 'dart:convert';

List<Career> speciesFromJson(String str) =>
    List<Career>.from(json.decode(str).map((x) => Career.fromJson(x)));

String speciesToJson(List<Career> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Career {
  int? id;
  String? career_name;
  String? career_descr;
  List<int>? skills;

  Career({
    this.id,
    this.career_name,
    this.career_descr,
  });
  Career.fromForm(this.id, this.career_name, this.career_descr, this.skills);
  factory Career.fromJson(Map<String, dynamic> json) => Career(
        //variable items
        id: json["id"],
        career_name: json["career_name"],
        career_descr: json["career_descr"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "career_name": career_name,
        "career_descr": career_descr,
      };
}
