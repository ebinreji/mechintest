import 'dart:math';

import 'package:flutter/material.dart';

import 'modelclass.dart';

final List<Movies>movieList = List.generate(25,
        (index) => Movies(
        title: 'Movie $index',
        time: "${Random().nextInt(10)  +60} minutes"));
class Movieprovider extends ChangeNotifier{
  final List<Movies> movie =movieList;
  List<Movies>get movies=>movie;
final List<Movies>wishListMovie=[];
List<Movies>get movieWishList=>wishListMovie;

void addtoWishList(Movies movieFromMainPage){
  wishListMovie.add(movieFromMainPage);
  notifyListeners();
}
void removeFromWishList(Movies removedMovie){
  wishListMovie.remove(removedMovie);
  notifyListeners();
}
}
