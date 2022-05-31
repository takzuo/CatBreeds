

import 'package:catbreeds/data/data_source/remote/breeds_api.dart';
import 'package:catbreeds/data/models/cat_model.dart';
import 'package:catbreeds/domain/repositories/breeds_repository.dart';
import 'package:catbreeds/domain/responses/response.dart';

class BreedsRepositoryImpl implements BreedsRepository{

  final BreedsApi _api;

  BreedsRepositoryImpl(this._api);

  @override
  Future<CatModel> get breedIndfo async{
    await Future.delayed(const Duration(seconds: 1));
    return breedIndfo;
  }


 @override
 Future<Response> callBreeds(){
    return _api.callBreedsAPI();
 }



  @override
  // TODO: implement catBreeds
  Future<Map<String, dynamic>> get catBreeds => throw UnimplementedError();


}