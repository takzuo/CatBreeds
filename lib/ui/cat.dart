import 'package:flutter/material.dart';
import 'package:catbreeds/models/cat_model.dart';


class Cat extends StatelessWidget{

  CatModel cat;

  Cat({required this.cat}): super();

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(this.cat.name),
      ),
      body: ListView(
        padding: EdgeInsets.all(15),
        children: <Widget>[
          Image.network(this.cat.image[3]),
          Text(this.cat.description)
        ],
      ),
    );

  }

}