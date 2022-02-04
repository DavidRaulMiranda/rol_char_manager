import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rol_char_manager/Logic/regex.dart';
import 'package:rol_char_manager/data/constants.dart';

class ValidatorTextfield extends StatefulWidget {
  final bool alowEmpty;
  final bool alowRegex;
  final int wordCap;
  final String regexFilter;
  final String textPrompt;
  String data = "";
  bool isValid = true;

  ValidatorTextfield(
      {Key? key,
      required this.alowEmpty,
      required this.alowRegex,
      required this.wordCap,
      required this.regexFilter,
      required this.textPrompt})
      : super(key: key);

  @override
  // ignore: no_logic_in_create_state
  _ValidatorTextfieldState createState() => _ValidatorTextfieldState(
        alowEmpty,
        alowRegex,
        wordCap,
        regexFilter,
        textPrompt,
        data,
        isValid,
      );
}

class _ValidatorTextfieldState extends State<ValidatorTextfield> {
  TextEditingController nameController = TextEditingController();
  LibRegex regex = LibRegex();
  bool alowEmpty;
  bool alowRegex;
  int wordCap;
  String regexFilter;
  String textPrompt;
  String data = "";
  bool isValid = true;
  int wordCount = 0;
  String maxWordCount = "";
  String bottomText = "";
  _ValidatorTextfieldState(this.alowEmpty, this.alowRegex, this.wordCap,
      this.regexFilter, this.textPrompt, this.data, this.isValid);

  void textCount(int wordCount, int worCap) {
    if (wordCap == -1) {
      bottomText = "";
    } else {
      bottomText = wordCount.toString() +
          "/" +
          wordCap.toString(); //'${widget.plane.rating}/10'
    }
  }

  void ValidateOperation(String text) {
    isValid = true;
    if (alowEmpty && nameController.text.length == 0) {
      isValid = false;
    }
    if (alowRegex && !regex.rRegexMatchOp(text, regexFilter)) {
      isValid = false;
    }
  }

  void limitString(String text) {
    if (wordCap != -1 && text.length > wordCap) {
      String cut = text.substring(0, wordCap);
      nameController.text = cut;
    }
  }

  void updateCounter(int textLength) {
    wordCount = textLength;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Padding(
        padding: const EdgeInsets.only(bottom: 8.0),
        child: TextField(
          onChanged: (text) {
            setState(() {
              limitString(text);
              textCount(nameController.text.length, wordCap);
              nameController.selection = TextSelection.fromPosition(
                  TextPosition(offset: nameController.text.length));
            });
          },

          onSubmitted: (text) {
            ValidateOperation(text);
          },
          controller: nameController,
          style: const TextStyle(decoration: TextDecoration.none),
          //onChanged: (v) => nameController.text = v,
          decoration: InputDecoration(
            labelText: textPrompt,
            labelStyle: TextStyle(color: Colors.black),
          ),
        ),
      ),
      Padding(
          padding: const EdgeInsets.all(16.0),
          child: Container(
            child: Text(bottomText,
                textDirection: TextDirection.ltr,
                style:
                    const TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
          ))
    ]);
  }
}
