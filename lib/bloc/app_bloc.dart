import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workposts_mobile/bloc/app_event.dart';
import 'package:workposts_mobile/bloc/app_state.dart';
import 'package:workposts_mobile/models/page_type.dart';
import 'package:workposts_mobile/widgets/pages/explore/bloc/explore_bloc.dart';
import 'package:workposts_mobile/widgets/pages/explore/explore_page_widget.dart';
import 'package:workposts_mobile/widgets/pages/manage/manage_page_widget.dart';
import 'package:workposts_mobile/widgets/pages/profile/profile_page_widget.dart';

import '../models/workpost_query.dart';
import '../widgets/pages/explore/bloc/explore_event.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(AppInitial()) {
    on<InitializePagesEvent>((event, emit) async {
      if (state is AppInitial) {
        emit(AppWorker(
            currentPage: PageType.explore, pages: _buildInitialPages()));
      }
    });
    on<ChangePageEvent>((event, emit) async {
      if (state is AppWorker) {
        AppWorker worker = state as AppWorker;
        emit(AppWorker(currentPage: event.newPage, pages: worker.pages));
      }
    });
    on<AddPageEvent>((event, emit) {
      if (state is AppWorker) {
        AppWorker worker = state as AppWorker;
        Map<PageType, List<Page>> pages = worker.pages;
        pages[worker.currentPage]?.add(event.addedPage);
        emit(AppWorker(currentPage: worker.currentPage, pages: pages));
      }
    });
    on<RemovePageEvent>((event, emit) {
      if (state is AppWorker) {
        AppWorker worker = state as AppWorker;
        Map<PageType, List<Page>> pages = worker.pages;
        pages[worker.currentPage]?.removeLast();
        emit(AppWorker(currentPage: worker.currentPage, pages: pages));
      }
    });
  }

  Map<PageType, List<Page>> _buildInitialPages() {
    Map<PageType, List<Page>> pages = {};
    Widget exploreWidget = BlocProvider(
      create: (context) => ExploreBloc()
        ..add(QueryExploreEvent(
            query: WorkpostQuery(
                search: 'test',
                amenities: [],
                openForNextHours: -1,
                milesAway: 20,
                minimumPrice: -1,
                maximumPrice: -1,
                minimumRating: -1))),
      child: const ExplorePageWidget(),
    );
    Widget manageWidget = const ManagePageWidget();
    Widget profileWidget = const ProfilePageWidget();
    pages[PageType.explore] = [_buildPageFromWidget(exploreWidget, PageType.explore)];
    pages[PageType.manage] = [_buildPageFromWidget(manageWidget, PageType.manage)];
    pages[PageType.profile] = [_buildPageFromWidget(profileWidget, PageType.profile)];
    return pages;
  }

  MaterialPage _buildPageFromWidget(Widget widget, PageType page) {
    return MaterialPage(
      child: widget,
      key: ValueKey('$page')
    );
  }
}
