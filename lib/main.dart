import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pokeapp/pokemon.dart';
import 'package:pokeapp/pokemondetails.dart';

void main() {
  runApp(MaterialApp(
    title: "Poke App",
    home: HomePage(),
    debugShowCheckedModeBanner: false,
  ));
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();

}

class _HomePageState extends State<HomePage> {

var url =
    "https://raw.githubusercontent.com/Biuni/PokemonGO-Pokedex/master/pokedex.json";
      PokeHub pokemonHub;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    fetchData();
  }

  fetchData() async {
    var res = await http.get(url);
    var decodedJSON = jsonDecode(res.body);
    pokemonHub = PokeHub.fromJson(decodedJSON);
    print(pokemonHub.toJson());
    setState(() {});
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text("Poke App")),
       // backgroundColor: Colors.cyan,
      ),
      body :pokemonHub == null
          ? Center(child: CircularProgressIndicator())
          :GridView.count(crossAxisCount: 2,
      children: pokemonHub.pokemon.map((poke) => Padding(
        padding: const EdgeInsets.all(2.0),
        child: InkWell(
          onTap: (){
      Navigator.push(context,MaterialPageRoute(builder: (context)=> pokedetails(
        pokemon: poke,
      )) );
          },
          child: Hero(
            tag: poke.img,
            child: Card(
              elevation: 3.0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    height: 100.0,
                    width: 100.0,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(poke.img),
                      ),
                    ),

                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(poke.name,
                        style: TextStyle(fontSize: 20.00,fontWeight:FontWeight.bold)),
                  ),
                ],
              ),

            ),
          ),
        ),
      )).toList(),

      ),

      drawer: Drawer(
        child: ListView(
          padding: const EdgeInsets.all(0),
          children: <Widget>[
            UserAccountsDrawerHeader(
              accountName: Text("Jakir Hossain Niloy"),
              accountEmail: Text("mdjakirhossen13@gmail.com"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                    "http://3.bp.blogspot.com/-P_qMx1hPnBM/YEpv_kbsiqI/AAAAAAAA2p0/mJ1TPJR4gKgZB3UhYQmZF5W4UjR9usYPwCK4BGAYYCw/s1600/52286661_2792678240957593_1876677421592215552_o.jpg"),
              ),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text("Jakir Hossain Niloy"),
              subtitle: Text("Practicing Flutter Project"),
              trailing: Icon(Icons.edit),
              onTap: () {},
            ),
            ListTile(
              leading: Icon(Icons.email),
              title: Text("Email"),
              subtitle: Text("mdjakirhossen13@gmail.com"),
              trailing: Icon(Icons.edit),
              onTap: () {},
            )
          ],
        ),

      ),

      floatingActionButton: FloatingActionButton(onPressed: () {

      },

        //backgroundColor: Colors.cyan,
        child: Icon(Icons.refresh),
      ),

    );

  }
}



