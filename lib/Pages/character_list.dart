import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rol_char_manager/Logic/API/api.dart';
import 'package:rol_char_manager/Logic/SQL/sql_lite.dart';
import 'package:rol_char_manager/Widgets/characer_card.dart';
import 'package:rol_char_manager/Widgets/generic/generic_app_card.dart';

import '../main.dart';

class CharacterListPage extends StatefulWidget {
  CharacterListPage({Key? key}) : super(key: key);

  @override
  _CharacterListPageState createState() => _CharacterListPageState();
}

class _CharacterListPageState extends State<CharacterListPage> {
  var isLoading = false;
  Future _UpdateBastard() async {
    if (update == true) {
      print("updating!");
      update = false;
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    if (initialize) {
      ///get character List

      //Character.InitialzeViewList();
      //Character.InitialzePlanelist(context);
      initialize = false;
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Characters!", style: TextStyle(color: Colors.white)),
        centerTitle: false,
        backgroundColor: Colors.black,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.download_sharp),
            onPressed: () async {
              await _loadFromApi();
              //ApiDataTrader.initialApiLoad();
              //DBProvider.db.getAllCharacters(characters);
            },
          ),
          IconButton(
            icon: const Icon(Icons.replay_rounded),
            onPressed: () async {
              await _loadFromSQL();
              //ApiDataTrader.initialApiLoad();
              //DBProvider.db.getAllCharacters(characters);
            },
          ),
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              Navigator.pushNamed(context, 'charAdd');
            },
          ),
          Container(
            width: 10,
          ),
          /*IconButton(
            icon: const Icon(Icons.restart_alt_outlined),
            onPressed: () {
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => Homepage2()),
                  ModalRoute.withName("/Home"));
            },
          ),*/
          Container(
            width: 10,
          )
        ],
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : _buildEmployeeListView(), //body: CharacterListGen(),
    );
  }

  _loadFromSQL() async {
    setState(() {
      isLoading = true;
    });

    // wait for 2 seconds to simulate loading of data
    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      isLoading = false;
    });
  }

  _loadFromApi() async {
    setState(() {
      isLoading = true;
    });

    //var apiProvider = ApiDataTrader();
    await ApiDataTrader.initialApiLoad();

    // wait for 2 seconds to simulate loading of data
    await Future.delayed(const Duration(seconds: 2));

    setState(() {
      isLoading = false;
    });
  }
  /*
   //list builder working! 
  _buildEmployeeListView() {
    return FutureBuilder(
      future: DBProvider.db.getAllCharacters(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return ListView.separated(
            separatorBuilder: (context, index) => const Divider(
              color: Colors.black12,
            ),
            itemCount: snapshot.data.length,
            itemBuilder: (BuildContext context, int index) {
              return ListTile(
                leading: Text(
                  "${index + 1}",
                  style: const TextStyle(fontSize: 20.0),
                ),
                title: Text(
                    "Name: ${snapshot.data[index].char_name} ${snapshot.data[index].char_sur_name} "),
                subtitle: Text('EMAIL: ${snapshot.data[index].char_avatar}'),
              );
            },
          );
        }
      },
    );
  }*/

  //list builder working!
  _buildEmployeeListView() {
    return FutureBuilder(
      future: DBProvider.db.getAllCharacters(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return ListView.separated(
            separatorBuilder: (context, index) => const Divider(
              color: Colors.black12,
            ),
            itemCount: snapshot.data.length,
            itemBuilder: (BuildContext context, int index) {
              return Dismissible(
                key: ObjectKey(snapshot.data[index]),
                child: GenericAppCard(
                    child: Column(
                  children: <Widget>[
                    CharacterStack(
                      char_name: snapshot.data[index].char_name,
                      char_sur_name: snapshot.data[index].char_sur_name,
                      char_species:
                          snapshot.data[index].char_species.toString(),
                      cahr_spec: '',
                      imgUrl: snapshot.data[index].char_avatar,
                    )
                  ],
                )),
                onDismissed: (direcion) {
                  setState(() {
                    int id = snapshot.data[index].id;
                    snapshot.data.removeAt(index);
                    //borrar registro sql
                    DBProvider.db.DeleteOneCharacter(id);
                  });
                },
              );
            },
          );
        }
      },
    );
  }
}

/*/

////>>>>>>>>>plane_list.dart
class CharacterListGen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CharacterListGenState();
}

class CharacterListGenState extends State {
  List<Character> show = characters;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: show.length,
        itemBuilder: (BuildContext context, int index) {
          return Dismissible(
            key: ObjectKey(show[index]),
            child: GenericAppCard(
                child: Column(
              children: <Widget>[CharacterStack(character: show[index])],
            )),
            onDismissed: (direcion) {
              setState(() {
                //remove from list
                //Character.RemoveFromView(show[index].name);-------------------------delete character
                //remove plane
                characters.removeAt(index);
              });
            },
          );
        });
  }
}
*/
