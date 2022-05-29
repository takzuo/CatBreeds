import 'package:catbreeds/ui/cat.dart';
import 'package:flutter/material.dart';
import 'package:catbreeds/models/cat_model.dart';

class CardCat extends StatelessWidget{
  CatModel cat;
  CardCat({required this.cat});
  
  @override
  Widget build(BuildContext context){
    return ListTile(
      title: Text(this.cat.name),
      subtitle: Text(this.cat.origin),
      //trailing: Image.network(this.cat.image[3]),
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder:
        (context) => Cat (cat: this.cat)));
      },
    );
  }
  
}
