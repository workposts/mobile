import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workposts_mobile/bloc/app_bloc.dart';
import 'package:workposts_mobile/bloc/app_event.dart';
import 'package:workposts_mobile/bloc/app_state.dart';
import 'package:workposts_mobile/models/page_type.dart';

class MainPageWidget extends StatelessWidget {
  const MainPageWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppBloc, AppState>(builder: (context, state) {
      if (state is AppWorker) {
        return Stack(
          children: [
            Offstage(
              offstage: state.currentPage != PageType.explore,
              child: Navigator(
                onPopPage: (route, result) {
                  if (!route.didPop(result)) {
                    return false;
                  }
                  if (state.pages.length > 1) {
                    context.read<AppBloc>().add(const RemovePageEvent());
                  }
                  return true;
                },
                pages: state.pages[PageType.explore]!,
              ),
            ),
            Offstage(
              offstage: state.currentPage != PageType.manage,
              child: Navigator(
                onPopPage: (route, result) {
                  if (!route.didPop(result)) {
                    return false;
                  }
                  if (state.pages.length > 1) {
                    context.read<AppBloc>().add(const RemovePageEvent());
                  }
                  return true;
                },
                pages: state.pages[PageType.manage]!,
              ),
            ),
            Offstage(
              offstage: state.currentPage != PageType.profile,
              child: Navigator(
                onPopPage: (route, result) {
                  if (!route.didPop(result)) {
                    return false;
                  }
                  if (state.pages.length > 1) {
                    context.read<AppBloc>().add(const RemovePageEvent());
                  }
                  return true;
                },
                pages: state.pages[PageType.profile]!,
              ),
            ),
          ],
        );
      }
      return Container();
    });
  }
}