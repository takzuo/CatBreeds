import 'dart:convert' as convert;
import 'dart:io';
import 'package:catbreeds/ui/card_cat.dart';
import 'package:catbreeds/ui/spinnerwidget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:catbreeds/models/cat_service.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final myController = TextEditingController();

  @override
  void initState() {
    super.initState();
    myController.addListener(_printLatestValue);
  }

  _printLatestValue() {
    print("Listener ${myController.text}");
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Center(child: Text("Catbreeds"))),
      body: Column(
        children: [
          searchBox(),
          listCards(context),
        ],
      ),);
  }

  Widget searchBox(){
    return Card(
           child:
           Padding(
             padding: const EdgeInsets.all(8.0),
             child: TextField(
               style: (TextStyle(color: Colors.black87)),
               controller: myController,
               decoration: InputDecoration(
                 border: OutlineInputBorder(),
                 suffixIcon: new Icon(Icons.search),
                 hintText: "Buscar raza...",
               ),),
           ),
    );
  }

  /*/
  TODO: Change for listView from API rest
   */
  Widget listCards(BuildContext context){
    return FutureBuilder(
        future: CatService().getCatById(),
        builder: (BuildContext context, AsyncSnapshot<List> snapshot){
          if(snapshot.hasData){
            return ListView.builder(
                itemCount: snapshot.data!.length,
                itemBuilder: (context, index){
                 var cat = snapshot.data![index];
                 return CardCat(cat: cat);
                }
            );
          }else{
            return SpinnerWidget();
          }
        },

    );
  }

  @override
  void dispose() {
    // Limpia el controlador cuando el widget se elimine del árbol de widgets
    // Esto también elimina el listener _printLatestValue
    myController.dispose();
    super.dispose();
  }


}
