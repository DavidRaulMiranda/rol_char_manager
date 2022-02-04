import 'package:flutter/material.dart';
import 'package:rol_char_manager/Logic/API/api.dart';
import 'package:rol_char_manager/Logic/SQL/sql_lite.dart';

class MdMenu extends StatefulWidget {
  MdMenu({Key? key}) : super(key: key);
  //default

  //moded

  @override
  _MdMenuState createState() => _MdMenuState();
}

class _MdMenuState extends State<MdMenu> {
  _MdMenuState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('TEST MODE'),
          backgroundColor: Colors.redAccent,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.update),
              onPressed: () {},
            )
          ],
        ),
        body: Container(
          width: 300,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              //default
              Container(
                child: FlatButton(
                  color: Colors.red,
                  splashColor: Colors.black12,
                  onPressed: () {
                    Navigator.pushNamed(context, 'addchar');
                    print("dflt");
                  },
                  child: Text("ADD CAHAR"),
                ),
                // margin: EdgeInsets.only(top: 30),
              ),

              //inverted
              Container(
                child: FlatButton(
                  color: Colors.red,
                  splashColor: Colors.black12,
                  onPressed: () {
                    ApiDataTrader.initialApiLoad();
                  },
                  child: Text("getPartyStatus() "),
                ),
                margin: EdgeInsets.only(top: 30),
              ),
              Container(
                child: FlatButton(
                  color: Colors.red,
                  splashColor: Colors.black12,
                  onPressed: () {
                    Navigator.pushNamed(context, 'addchar');
                    print("dflt");
                  },
                  child: Text("adddddd"),
                ),
                margin: EdgeInsets.only(top: 30),
              ),

              Container(
                child: FlatButton(
                  color: Colors.red,
                  splashColor: Colors.black12,
                  onPressed: () async {
                    //PeliculasProvider p = PeliculasProvider();
                    // ignore: unused_local_variable

                    //DBProvider dbp = new DBProvider();
                  },
                  child: Text("query to matrix"),
                ),
                margin: EdgeInsets.only(top: 30),
              )
            ],
          ),
        ));
  }
}
