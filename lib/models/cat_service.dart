import 'package:catbreeds/models/cat_model.dart';
import 'package:catbreeds/models/cat_response.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class CatService{

  final String API_url = "https://api.thecatapi.com/v1/breeds";
  final String API_key = "bda53789-d59e-46cd-9bc4-2936630fde39";

  Future<List<CatModel>> getCatById() async{
    //add &language=es
    //var url = API_url + "?api_key=" + API_key;
    var url = API_url;
    final response = await http.get(Uri.parse(url));

    if(response.statusCode == 200){
      final responseJSON = json.decode(response.body);
      final CatById = CatListResponse.fromJsonList(responseJSON);
      print(response.body);
      return CatById;
    }
    print(response.body);
    return<CatModel>[];

  }

}