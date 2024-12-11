part of 'favourite_bloc.dart';

sealed class FavouriteEvent extends Equatable {
  const FavouriteEvent();

  @override
  List<Object> get props => [];
}

class FetchFavItemList extends FavouriteEvent{}

class FavouriteItemEvent extends FavouriteEvent{
  FavouriteItemModel itemModel;
  FavouriteItemEvent({required this.itemModel});

  @override
  List<Object> get props => [itemModel];

}
class SelectItemEvent extends FavouriteEvent{
  FavouriteItemModel itemModel;
  SelectItemEvent({required this.itemModel});

  @override
  List<Object> get props => [itemModel];
}
class UnSelectItemEvent extends FavouriteEvent{
  FavouriteItemModel itemModel;
  UnSelectItemEvent({required this.itemModel});

  @override
  List<Object> get props => [itemModel];
}

class DeleteItemEvent extends FavouriteEvent{

}
