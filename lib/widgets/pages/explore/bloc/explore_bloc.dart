import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workposts_mobile/widgets/pages/explore/bloc/explore_state.dart';

import 'explore_event.dart';

class ExploreBloc extends Bloc<ExploreEvent, ExploreState> {
  ExploreBloc() : super(ExploreInitial()) {
    on<QueryExploreEvent>((event, emit) async {
      emit(const ExploreLoading());
      await Future<void>.delayed(const Duration(seconds: 2));
      emit(ExploreLoaded(workposts: const [], query: event.query));
    });
    on<ExpandExploreEvent>((event, emit) {
      
    });
    on<RefreshExploreEvent>((event, emit) {
      
    });
    on<SelectExploreEvent>((event, emit) {
      
    });
  }
}