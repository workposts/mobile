import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:workposts_mobile/models/page_type.dart';

abstract class AppEvent extends Equatable {
  const AppEvent();

  @override
  List<Object> get props => [];
}

class InitializePagesEvent extends AppEvent {
  const InitializePagesEvent();
  @override
  List<Object> get props => [];
}

class AddPageEvent extends AppEvent {
  final Page addedPage;
  const AddPageEvent({required this.addedPage});
  @override
  List<Object> get props => [addedPage];
}

class RemovePageEvent extends AppEvent {
  const RemovePageEvent();
  @override
  List<Object> get props => [];
}

class ChangePageEvent extends AppEvent {
  final PageType newPage;
  const ChangePageEvent({required this.newPage});
  @override
  List<Object> get props => [newPage];
}