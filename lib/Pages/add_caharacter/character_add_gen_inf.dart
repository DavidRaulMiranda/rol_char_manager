import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rol_char_manager/Logic/obj/character.dart';
import 'package:rol_char_manager/Widgets/generic/validator_textfield.dart';
import 'package:rol_char_manager/data/constants.dart';

class CharacterAdd extends StatefulWidget {
  CharacterAdd({Key? key}) : super(key: key);
  @override
  _CharacterAdd createState() => _CharacterAdd();
}

class _CharacterAdd extends State<CharacterAdd> {
  _CharacterAdd();

  get nameController => null;

  get child => null;

  @override
  Widget build(BuildContext context) {
    //LogicCharaterAdd log = new LogicCharaterAdd();

    List<Character> Listchar;
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(Constants.newPc),
          backgroundColor: Colors.redAccent,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.cancel),
              onPressed: () {},
            )
          ],
        ),
        body: Column(
          children: [
            Padding(
                padding: const EdgeInsets.all(10.0),
                child: ValidatorTextfield(
                    alowEmpty: false,
                    alowRegex: false,
                    regexFilter: '',
                    textPrompt: 'Name',
                    wordCap: 20)),
            Padding(
                padding: const EdgeInsets.all(10.0),
                child: ValidatorTextfield(
                    alowEmpty: false,
                    alowRegex: false,
                    regexFilter: '',
                    textPrompt: 'Surname',
                    wordCap: 20)),
            Padding(
                padding: const EdgeInsets.all(10.0),
                child: ValidatorTextfield(
                    alowEmpty: true,
                    alowRegex: false,
                    regexFilter: '',
                    textPrompt: 'Description',
                    wordCap: 200)),
            //species combo
            // job combo
            // spec combo
            Padding(
                padding: const EdgeInsets.all(16.0),
                // ignore: unnecessary_new
                child: new Builder(builder: (context) {
                  return ElevatedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, 'test');
                      print("dflt");
                    },
                    child: Text('SUBMMIT'),
                  );
                }))
          ],
        ));
  }

  CreateCharacter() {}
}
/*'firstName TEXT,'
          'lastName TEXT,'
          'avatar TEXT,'
          'descripion TEXT,'
          'species INTEGER,'
          'spec INTEGER,' */