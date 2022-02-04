import 'dart:convert';

List<Species> speciesFromJson(String str) =>
    List<Species>.from(json.decode(str).map((x) => Species.fromJson(x)));

String speciesToJson(List<Species> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Species {
  int? id;
  String? species_name;
  String? species_descr;
  int? wound_thre;
  int? strain_thre;
  int? initial_exp;

  Species(
      {this.id,
      this.species_name,
      this.species_descr,
      this.wound_thre,
      this.strain_thre,
      this.initial_exp});
  Species.fromForm(this.id, this.species_name, this.species_descr,
      this.wound_thre, this.strain_thre, this.initial_exp);
  factory Species.fromJson(Map<String, dynamic> json) => Species(
      //variable items
      id: json["id"],
      species_name: json["species_name"],
      species_descr: json["species_descr"],
      wound_thre: json["wound_thre"],
      strain_thre: json["strain_thre"],
      initial_exp: json["initial_exp"]);

  Map<String, dynamic> toJson() => {
        "id": id,
        "species_name": species_name,
        "species_descr": species_descr,
        "wound_thre": wound_thre,
        "strain_thre": strain_thre,
        "initial_exp": initial_exp
      };
}
