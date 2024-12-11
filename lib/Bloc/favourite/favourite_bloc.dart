import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../model/favourite_item_model.dart';
import '../../repository/favourite_repository.dart';

part 'favourite_event.dart';

part 'favourite_state.dart';

class FavouriteBloc extends Bloc<FavouriteEvent, FavouriteInitial> {
  List<FavouriteItemModel> favList = [];
  List<FavouriteItemModel> tempFavList = [];
  FavouriteRepository favouriteRepository;

  FavouriteBloc(this.favouriteRepository) : super(const FavouriteInitial()) {
    on<FetchFavItemList>(_fetchList);
    on<FavouriteItemEvent>(_addFavouriteItem);
    on<SelectItemEvent>(_selectItem);
    on<UnSelectItemEvent>(_unselectItem);
    on<DeleteItemEvent>(_deleteItem);
  }

  void _fetchList(
      FetchFavItemList event, Emitter<FavouriteInitial> emit) async {
    favList = await favouriteRepository.fetchItem();
    emit(state.copyWith(
        favItemList: List.from(favList), listStatus: ListStatus.success));
  }

  void _addFavouriteItem(
      FavouriteItemEvent event, Emitter<FavouriteInitial> emit) async {
    final index =
        favList.indexWhere((element) => element.id == event.itemModel.id);
    if (event.itemModel.isFavourite) {
      if (tempFavList.contains(favList[index])) {
        tempFavList.remove(favList[index]);
        tempFavList.add(event.itemModel);
      }
    } else {
      if (tempFavList.contains(favList[index])) {
        tempFavList.remove(favList[index]);
        tempFavList.add(event.itemModel);
      }
    }
    favList[index] = event.itemModel;
    emit(state.copyWith(favItemList: List.from(favList), tempFavItemList: List.from(tempFavList)));
  }

  void _selectItem(
      SelectItemEvent event, Emitter<FavouriteInitial> emit) async {
    tempFavList.add(event.itemModel);
    emit(state.copyWith(tempFavItemList: List.from(tempFavList)));
  }

  void _unselectItem(
      UnSelectItemEvent event, Emitter<FavouriteInitial> emit) async {
    tempFavList.remove(event.itemModel);
    emit(state.copyWith(tempFavItemList: List.from(tempFavList)));
  }

  _deleteItem(DeleteItemEvent event, Emitter<FavouriteInitial> emit) {
    for (int i = 0; i < tempFavList.length; i++) {
      favList.remove(tempFavList[i]);
    }
    tempFavList.clear();
    emit(state.copyWith(
        favItemList: List.from(favList),
        tempFavItemList: List.from(tempFavList)));
  }
}
