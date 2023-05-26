// search, filter, expand, refresh, select
import 'package:equatable/equatable.dart';
import 'package:workposts_mobile/models/workpost_query.dart';

abstract class ExploreEvent extends Equatable {
  const ExploreEvent();

  @override
  List<Object> get props => [];
}

class QueryExploreEvent extends ExploreEvent {
  final WorkpostQuery query;
  const QueryExploreEvent({required this.query});
  @override
  List<Object> get props => [query];
}

class ExpandExploreEvent extends ExploreEvent {}

class RefreshExploreEvent extends ExploreEvent {}

class SelectExploreEvent extends ExploreEvent {}
