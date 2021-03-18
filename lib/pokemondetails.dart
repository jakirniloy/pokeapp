import 'package:flutter/material.dart';
import 'package:pokeapp/pokemon.dart';
class pokedetails extends StatelessWidget {

  final Pokemon pokemon;

  pokedetails({this.pokemon});

  bodyedit(BuildContext context)=>Stack(
    children: [
      Positioned(
        height: MediaQuery.of(context).size.height/1.5,
        width: MediaQuery.of(context).size.width -20,
        left: 10.00,
        top: MediaQuery.of(context).size.height*0.1,

        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.00),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: 60.00,
              ),

              Text(pokemon.name,
                style: TextStyle(fontSize:30.00,fontWeight: FontWeight.bold, ),
              ),
             Text("Height: ${ pokemon.height}"),
              Text("Weight: ${ pokemon.weight}"),
              Text("Types", style: TextStyle(fontSize:20.00,fontWeight: FontWeight.bold, )),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children:pokemon.type.map((t) => FilterChip(
                   backgroundColor: Colors.amber,
                    label: Text(t), onSelected: (b){})).toList(),
              ),
              Text("Weakness", style: TextStyle(fontSize:20.00,fontWeight: FontWeight.bold, )),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children:pokemon.weaknesses.map((t) => FilterChip(
                   backgroundColor: Colors.red,
                    label: Text(t), onSelected: (b){})).toList(),
              ),
           Text("Next Evolution", style: TextStyle(fontSize:20.00,fontWeight: FontWeight.bold, )),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                //children:pokemon.nextEvolution.map((n) => FilterChip(label: Text(n.name), onSelected: (b){})).toList(),

                children: pokemon.nextEvolution == null
                    ? <Widget>[Text("This is the final form")]
                    : pokemon.nextEvolution
                    .map((n) => FilterChip(
                  backgroundColor: Colors.green,
                  label: Text(
                    n.name,
                    style: TextStyle(color: Colors.white),
                  ),
                  onSelected: (b) {},
                ))
                    .toList(),
              ),

            ],
          ),
        ),
      ),
      Align(
        alignment: Alignment.topCenter,
        child:Hero(tag: pokemon.img,child:Container(
          height: 200.00,
          width: 200.00,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(pokemon.img),
            ),
          ),
        ),)
      )
    ],
  );


  @override

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent,
      appBar: AppBar(
        elevation: 0.00,
        title: Center(child: Text(pokemon.name)),
        backgroundColor:Colors.blueAccent,
      ),
      body: bodyedit(context),
    );
  }
}
