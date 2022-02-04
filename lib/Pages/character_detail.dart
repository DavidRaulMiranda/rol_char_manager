import 'package:flutter/material.dart';
import 'package:rol_char_manager/Logic/API/api.dart';
import 'package:rol_char_manager/Logic/obj/character.dart';
import 'package:rol_char_manager/Widgets/characer_card.dart';

class characterSelect extends StatefulWidget {
  characterSelect({Key? key}) : super(key: key);
  //default

  //moded

  @override
  _characterSelectState createState() => _characterSelectState();
}

class _characterSelectState extends State<characterSelect> {
  _characterSelectState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Characters'),
          backgroundColor: Colors.redAccent,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.update),
              onPressed: () {},
            )
          ],
        ),
        body: Container(
          child: Column(
            children: [
              //default

              //inverted
            ],
          ),
        ));
  }
}
