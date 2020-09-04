

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hero_app/hero_model.dart';
import 'package:hero_app/heroes_controller.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  _buildList(){

    HeroesController hC = Provider.of<HeroesController>(context);

    return ListView.builder(
      itemCount: hC.heroes.length,
      itemBuilder: (context, index){
        return _buildItems(hC.heroes[index]);
      },
    );
  }

  _buildItems(HeroModel hero){
    
    HeroesController hC = Provider.of<HeroesController>(context);
    
    return ListTile(
      onTap: (){
        hC.chackFav(hero);
      },
      title: Text(hero.name),
      trailing: 
      hero.fav ? Icon(Icons.star, color: Colors.yellow,) : Icon(Icons.star_border)
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Heroes"),
        leading: Consumer<HeroesController>(builder: (context, hC, widget){
          return Center(
            child: 
            Text("${hC.heroes.where((i) => i.fav).length}",
            style: TextStyle(fontSize:  18),),
          );
        }),
      ),
      body: Consumer<HeroesController>(
        builder: (
          context, hC, widget){
            return _buildList();
      },),
    );
  }
}