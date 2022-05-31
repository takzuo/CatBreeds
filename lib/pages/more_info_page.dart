import 'package:catbreeds/constants.dart';
import 'package:flutter/material.dart';

class MoreInfoPage extends StatelessWidget {
  const MoreInfoPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          //toolbarHeight: 400,
          title: Center(
              child: Column(
            children: [
              Text(
                collectionB?.name.toUpperCase() ?? "",
                style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
              ),
            ],
          )),
        ),
        body: Container(
          child: (Column(
            children: [
              imageContainer(context),
              infoContainer(context),
            ],
          )),
        ));
  }

  Widget imageContainer(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 300,
        color: Colors.transparent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FadeInImage.assetNetwork(
                width: MediaQuery.of(context).size.width - 30,
                placeholder: 'assets/images/splashl.png',
                image: collectionB!.image!.url)
            //Image.network(collectionB?.image?.url ?? ),
          ],
        ),
      ),
    );
  }

  Widget infoContainer(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          height: MediaQuery.of(context).size.width - 30,
          color: Colors.white30,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListView(
              children: <Widget>[
                Card(
                    color: Colors.white38,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Description: ${collectionB?.description ?? " "}",
                        style: TextStyle(color: Colors.black87, fontSize: 16),
                      ),
                    )),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    "Country:  ${collectionB?.countryCode} - ${collectionB?.origin}",
                    style: TextStyle(color: Colors.black87, fontSize: 16),
                  ),
                ),
                theText("Alt Names", collectionB?.altNames, ""),
                theText("Temperament", collectionB?.temperament, ""),
                theText("Weight metric", collectionB?.weight.metric, "Kg"),
                theText("Weight imperial", collectionB?.weight.imperial, "lb"),
                theText("Lifespan", collectionB?.lifeSpan, "year"),
                barGraph("Indoor", collectionB?.indoor.toDouble() ?? 0),
                barGraph("Lap", collectionB?.lap.toDouble() ?? 0),
                barGraph(
                    "Adaptability", collectionB?.adaptability.toDouble() ?? 0),
                barGraph("Affection level",
                    collectionB?.affectionLevel.toDouble() ?? 0),
                barGraph("Child Friendly",
                    collectionB?.childFriendly.toDouble() ?? 0),
                barGraph(
                    "Dog Friendly", collectionB?.dogFriendly.toDouble() ?? 0),
                barGraph(
                    "Energy level", collectionB?.energyLevel.toDouble() ?? 0),
                barGraph("Grooming", collectionB?.grooming.toDouble() ?? 0),
                barGraph(
                    "Health issues", collectionB?.healthIssues.toDouble() ?? 0),
                barGraph(
                    "Intelligence", collectionB?.intelligence.toDouble() ?? 0),
                barGraph("Shedding level",
                    collectionB?.sheddingLevel.toDouble() ?? 0),
                barGraph(
                    "Social needs", collectionB?.socialNeeds.toDouble() ?? 0),
                barGraph("Stranger friendly",
                    collectionB?.strangerFriendly.toDouble() ?? 0),
                barGraph(
                    "Vocalisation", collectionB?.vocalisation.toDouble() ?? 0),
                barGraph(
                    "Experimental", collectionB?.experimental.toDouble() ?? 0),
                barGraph("Hairless", collectionB?.hairless.toDouble() ?? 0),
                barGraph("Natural", collectionB?.natural.toDouble() ?? 0),
                barGraph("Rare", collectionB?.rare.toDouble() ?? 0),
                barGraph("Rex", collectionB?.rex.toDouble() ?? 0),
                barGraph("Suppressed tail", collectionB?.rex.toDouble() ?? 0),
                barGraph("Short legs", collectionB?.shortLegs.toDouble() ?? 0),
                barGraph("Hypoallergenic",
                    collectionB?.hypoallergenic.toDouble() ?? 0),
              ],
            ),
          )),
    );
  }

  Widget barGraph(String name, double cant) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "$name",
                style: TextStyle(fontSize: 16, color: Colors.black87),
              ),
              Text(
                "$cant",
                style: TextStyle(fontSize: 16, color: Colors.black87),
              ),
            ],
          ),
          LinearProgressIndicator(
            value: (cant / 10),
            color: Colors.blue,
            backgroundColor: Colors.black12,
            minHeight: 30,
          ),
        ],
      ),
    );
  }

  Widget theText(String title, variable, String end) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Text(
        "$title:  ${variable} $end",
        style: TextStyle(color: Colors.black87, fontSize: 16),
      ),
    );
  }
}
