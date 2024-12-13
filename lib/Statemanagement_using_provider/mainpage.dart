import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import 'mainpage1.dart';
import 'movie_provider.dart';
void main() {
  runApp(ChangeNotifierProvider<Movieprovider>(
    create: (BuildContext context) => Movieprovider(),
    child: MaterialApp(
      home: Movie(),
      debugShowCheckedModeBanner: false,
    ),
  ));
}
class  Movie extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    var wishmovies = context.watch<Movieprovider>().wishListMovie;
    var movies = context.watch<Movieprovider>().movies;
    return Scaffold(
appBar: AppBar(title: Text("Movies"),
backgroundColor: Colors.blue,),
      body:Column(
        children: [
          ElevatedButton.icon(onPressed: ()=> Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => WishListScreen())),
              icon: const Icon(Icons.favorite_border),
              label: Text("Goto WishList ${wishmovies.length}")),
          Expanded(child: ListView.builder(itemCount: movies.length,itemBuilder: (context,index){
final currentMovies=movies[index];
return Card(
  child: ListTile(
title: Text(currentMovies.title),
    subtitle: Text(currentMovies.time!),
    trailing: IconButton( icon: Icon(Icons.favorite,color: wishmovies.contains(currentMovies)
        ? Colors.red
        : Colors.black26), onPressed: () {
      if(!wishmovies.contains(currentMovies)){
        context
            .read<Movieprovider>()
        .addtoWishList(currentMovies);
      }
      else{
        context
        .read<Movieprovider>()
            .removeFromWishList(currentMovies);
      }
    },),
  ),
);

          }))
        ],
      ) ,
    );
  }
}
