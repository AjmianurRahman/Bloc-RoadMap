

import 'package:block_roadmap/model/favourite_item_model.dart';

class FavouriteRepository {

  Future<List<FavouriteItemModel>> fetchItem() async{
    await Future.delayed(const Duration(seconds: 2));
    return List.of(_generaateList(10));
  }
  
  List<FavouriteItemModel> _generaateList(int length){
    return List.generate(length, (index)=> FavouriteItemModel(id: index.toString(), value: 'Item $index'));
  }

}

