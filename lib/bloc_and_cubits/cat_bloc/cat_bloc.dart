import 'package:bloc/bloc.dart';
import 'package:cat_facts/data/data_provider.dart';
import 'package:equatable/equatable.dart';

import '../../models/cat.dart';

part 'cat_event.dart';
part 'cat_state.dart';

class CatBloc extends Bloc<CatEvent, CatState> {
  final _dateProvider = DataProvider();
  CatBloc() : super(FactLoadingState()) {
    on<CatEvent>((event, emit) async {
      if (event is LoadFactEvent) {
        emit(FactLoadingState());
      }
      try {
        final catFacts = await _dateProvider.getCatFact();
        emit(FactLoadedState(catFact: catFacts));
      } catch (e) {
        emit(FailedToLoadFactState(error: e as Error));
      }
    });
  }
}
