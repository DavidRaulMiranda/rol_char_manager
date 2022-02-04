import 'dart:convert';

List<Career> speciesFromJson(String str) =>
    List<Career>.from(json.decode(str).map((x) => Career.fromJson(x)));

String speciesToJson(List<Career> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Career {
  int? id;
  int? caractId;
  String? caractName;
  String? caractDescr;

  Career({this.id, this.caractId, this.caractName, this.caractDescr});
  Career.fromForm(this.id, this.caractId, this.caractName, this.caractDescr);
  factory Career.fromJson(Map<String, dynamic> json) => Career(
        //variable items
        id: json["id"],
        caractId: json["caractId"],
        caractName: json["caractName"],
        caractDescr: json["caractDescr"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "caractId": caractId,
        "skill_name": caractName,
        "speciesDescr": caractDescr,
      };
}
