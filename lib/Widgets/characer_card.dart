import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rol_char_manager/Logic/obj/character.dart';
import 'package:rol_char_manager/Logic/obj/species.dart';
import 'package:rol_char_manager/Widgets/generic/geeric_image_holder.dart';

class CharacterStack extends StatefulWidget {
  final String char_name;
  final String char_sur_name;
  late String char_species;
  final String cahr_spec;

  final String imgUrl;

  CharacterStack({
    Key? key,
    required this.char_name,
    required this.char_sur_name,
    required this.cahr_spec,
    required this.imgUrl,
    required this.char_species,
  }) : super(key: key);

  get widg_img => ImageHolder(imgUrl: imgUrl, height: 110, width: 110);

  @override
  _CharacterStackState createState() =>
      _CharacterStackState(char_name, char_sur_name, char_species, cahr_spec);
}

class _CharacterStackState extends State<CharacterStack> {
  @override
  String char_name;
  String char_sur_name;
  String char_species;
  String cahr_spec;
  _CharacterStackState(
    this.char_name,
    this.char_sur_name,
    this.char_species,
    this.cahr_spec,
  );

  @override
  Widget build(BuildContext context) {
    //String pl_name;

    return InkWell(
        //detectar click
        /*
        onTap: () {
          Navigator.pushNamed(context, 'charDetail');
        },*/
        child: Row(children: [
      //left container image
      //image is a stack

      Container(child: widget.widg_img, margin: new EdgeInsets.only(right: 20)),

      Container(
          //margin: const EdgeInsets.only(left: 70),
          width: 168,
          height: 115,

          //color: Colors.blue,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text("Name: " + char_name,
                  textDirection: TextDirection.ltr,
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.bold)),
              Text("Surname: " + char_sur_name,
                  textDirection: TextDirection.ltr,
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.bold)),
              Text("Species: " + char_species,
                  textDirection: TextDirection.ltr,
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.bold)),
              Text("Carreer: " + cahr_spec,
                  textDirection: TextDirection.ltr,
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.bold)),
              Text("Specialization: " + cahr_spec,
                  textDirection: TextDirection.ltr,
                  style: const TextStyle(
                      fontSize: 15, fontWeight: FontWeight.bold)),
            ],
          )),
    ]));
  }
}
