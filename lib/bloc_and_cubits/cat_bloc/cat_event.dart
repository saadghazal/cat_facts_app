part of 'cat_bloc.dart';

abstract class CatEvent extends Equatable {
  const CatEvent();
}

class LoadFactEvent extends CatEvent {
  @override
  List<Object> get props => [];
}
