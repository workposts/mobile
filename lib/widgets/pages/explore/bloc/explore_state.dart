import 'package:equatable/equatable.dart';
import 'package:workposts_mobile/models/workpost.dart';
import 'package:workposts_mobile/models/workpost_query.dart';

abstract class ExploreState extends Equatable {
  const ExploreState();

  @override
  List<Object> get props => [];
}

class ExploreInitial extends ExploreState {}

class ExploreLoading extends ExploreState {

  const ExploreLoading();

  @override
  List<Object> get props => [];
}

class ExploreLoaded extends ExploreState {
  final List<Workpost> workposts;
  final WorkpostQuery query;

  const ExploreLoaded({required this.workposts, required this.query});

  @override
  List<Object> get props => [workposts];
}

class ExploreError extends ExploreState {
  final String error;
  const ExploreError({required this.error});
}
