import 'package:catbreeds/constants.dart';
import 'package:catbreeds/data/data_source/remote/breeds_api.dart';
import 'package:catbreeds/data/helpers/http.dart';
import 'package:catbreeds/data/models/cat_model.dart' as cat;
import 'package:catbreeds/data/repositories_impl/breeds_repository_impl.dart';
import 'package:catbreeds/domain/repositories/breeds_repository.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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
    final http = Http(baseUrl: 'https://api.thecatapi.com/v1');
    final BreedsRepository breed = BreedsRepositoryImpl(BreedsApi(http));
    breed.callBreeds();
    getCatsData();
    myController.addListener(_printLatestValue);
  }

  List<cat.CatModel> cats = [];
  int currentPage = 1;

  Future<bool> getCatsData() async {
    final Uri uri = Uri.parse("https://api.thecatapi.com/v1/breeds/");
    final response = await http.get(uri);
    if (response.statusCode == 200) {
      final result = cat.catModelFromJson(response.body);
      cats = result;
      setState(() {});
      return true;
    } else {
      return false;
    }
  }

  _printLatestValue() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Column(
          children: [
            const Center(child: Text("Catbreeds")),
            searchBox(),
          ],
        ),
        toolbarHeight: 140,
      ),
      body: listCards(context),
    );
  }

  Widget searchBox() {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextField(
          style: (TextStyle(color: Colors.black87)),
          controller: myController,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            suffixIcon: Icon(Icons.search),
            hintText: "Search breed...",
          ),
        ),
      ),
    );
  }

  Widget listCards(BuildContext context) {
    return ListView.separated(
        itemBuilder: (context, index) {
          final collection = cats[index];

          if (collection.name
              .toLowerCase()
              .contains(myController.text.toLowerCase())) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 4,
                child: Container(
                  height: 300,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 18.0, vertical: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              collection.name,
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            GestureDetector(
                                onTap: () {
                                  collectionB = collection;
                                  Navigator.pushNamed(context, "/moreinfopage");
                                },
                                child: Text(
                                  "More..",
                                  style: TextStyle(color: Colors.black),
                                )),
                          ],
                        ),
                      ),
                      Container(
                          color: Colors.blueGrey,
                          height: 200,
                          width: 300,
                          child: FadeInImage.assetNetwork(
                              width: MediaQuery.of(context).size.width - 30,
                              placeholder: 'assets/images/splashl.png',
                              image: collection.image!.url)),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 18.0, vertical: 10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Origin : ${collection.origin}",
                              style: TextStyle(color: Colors.black),
                            ),
                            Text(
                              "Intelligence : ${collection.intelligence.toString()}",
                              style: TextStyle(color: Colors.black),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          } else {
            return Card();
          }
        },
        separatorBuilder: (context, index) => Divider(),
        itemCount: cats.length);
  }

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }
}
