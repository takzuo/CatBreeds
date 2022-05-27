import 'package:flutter/material.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final myController = TextEditingController();

  Map<String, dynamic> lalist = [{"cosa": "perro", "otracosa": "gato" }] as Map<String, dynamic>;

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
          listCards()
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
  Widget listCards(){
    return Column(children: [
      Card(child: Text("Informacion del gato1")),
      Card(child: Text("Informacion del gato1")),
      Card(child: Text("Informacion del gato1")),
      Card(child: Text("Informacion del gato1")),
      Card(child: Text("Informacion del gato1")),
    ],);
  }

  @override
  void dispose() {
    // Limpia el controlador cuando el widget se elimine del árbol de widgets
    // Esto también elimina el listener _printLatestValue
    myController.dispose();
    super.dispose();
  }


}
