import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:workposts_mobile/models/page_type.dart';

abstract class AppState extends Equatable {
  const AppState();

  @override
  List<Object> get props => [];
}

class AppInitial extends AppState {}

class AppWorker extends AppState {
  final PageType currentPage;
  final Map<PageType, List<Page>> pages;

  const AppWorker({required this.currentPage, required this.pages});

  @override
  List<Object> get props => [currentPage, pages];
}

class AppHost extends AppState {

}