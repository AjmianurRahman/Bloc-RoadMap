part of 'favourite_bloc.dart';



enum ListStatus { loading, success, failure }

 class FavouriteInitial extends Equatable {
  final List<FavouriteItemModel> favItemList;
  final List<FavouriteItemModel> tempFavItemList;
  final ListStatus listStatus;

  const FavouriteInitial(
      {this.favItemList = const [],this.tempFavItemList = const [], this.listStatus = ListStatus.loading});

  FavouriteInitial copyWith(
      {List<FavouriteItemModel>? favItemList,List<FavouriteItemModel>? tempFavItemList, ListStatus? listStatus}) {
    return FavouriteInitial(
        favItemList: favItemList ?? this.favItemList,
        tempFavItemList: tempFavItemList ?? this.tempFavItemList,
        listStatus: listStatus ?? this.listStatus);
  }

  @override
  List<Object> get props => [favItemList, listStatus,tempFavItemList];
}
