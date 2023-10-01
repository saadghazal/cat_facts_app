part of 'cat_bloc.dart';

abstract class CatState extends Equatable {
  const CatState();
}

class FactLoadingState extends CatState {
  @override
  List<Object> get props => [];
}

class FactLoadedState extends CatState {
  Cat catFact;

  FactLoadedState({
    required this.catFact,
  });

  @override
  List<Object> get props => [catFact];
}

class FailedToLoadFactState extends CatState {
  Error error;

  @override
  List<Object> get props => [error];

  FailedToLoadFactState({
    required this.error,
  });
}
