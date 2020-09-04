import 'package:flutter/cupertino.dart';
import 'package:hero_app/hero_model.dart';

class HeroesController extends ChangeNotifier{
  List<HeroModel> heroes = [
    HeroModel(name: "Ezio Auditore"),
    HeroModel(name: "Connor Kenway"),
    HeroModel(name: "Simon Lewis"),
    HeroModel(name: "Luke Skywalker"),
    HeroModel(name: "Anakin Skywalker"),
    HeroModel(name: "All Might"),
    HeroModel(name: "Vysenia Targaryen"),
    HeroModel(name: "Arrow"),
    HeroModel(name: "Black Canary"),
  ];

  chackFav(HeroModel hero){
    hero.fav = !hero.fav;
    notifyListeners();
  }
}