import 'package:catbreeds/models/cat_model.dart';

class CatListResponse{

  CatListResponse();

  static List<CatModel> fromJsonList(List<dynamic> jsonList){
    List<CatModel> listCat = [];
    if(jsonList != null){
      for(var cat in jsonList){
        final cats = CatModel.fromJson(cat);
        listCat.add(cats);
      }
    }
    return listCat;

  }

}