

 import 'package:equatable/equatable.dart';

abstract class PostEvent extends Equatable {
  const PostEvent();

  @override
  List<Object> get props => [];
}

class PostFetched extends PostEvent{}

//ju bi text enter huga ham is event ke through block ko send karenge 
class SearchItem extends PostEvent{
  final String stSearch;
  const SearchItem(this.stSearch);

}