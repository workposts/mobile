import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workposts_mobile/widgets/navigation_bar_widget.dart';
import 'package:workposts_mobile/widgets/pages/explore/bloc/explore_bloc.dart';
import 'package:workposts_mobile/widgets/pages/explore/filter_button_widget.dart';
import 'package:workposts_mobile/widgets/pages/explore/search_bar_widget.dart';
import 'package:workposts_mobile/widgets/pages/explore/workpost_preview_loading_widget.dart';

import '../../../configuration.dart';
import '../../../models/page_type.dart';
import 'bloc/explore_state.dart';

class ExplorePageWidget extends StatefulWidget {
  const ExplorePageWidget({super.key});

  @override
  State<ExplorePageWidget> createState() => _ExplorePageWidgetState();
}

class _ExplorePageWidgetState extends State<ExplorePageWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  var search = false;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 100));
  }

  @override
  Widget build(BuildContext context) {
    double navigationWidth = MediaQuery.of(context).size.width;
    return BlocBuilder<ExploreBloc, ExploreState>(
      builder: (context, state) {
        return Scaffold(
            body: Container(
                width: navigationWidth,
                decoration:
                    const BoxDecoration(color: Configuration.primaryDarkColor),
                child: SafeArea(child: LayoutBuilder(builder:
                    (BuildContext context, BoxConstraints constraints) {
                  return Container(
                    height: constraints.maxHeight,
                    margin: EdgeInsets.only(
                        left: navigationWidth * 0.05,
                        right: navigationWidth * 0.05),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SearchBarWidget(toggleSearch: _toggleSearch),
                            if (!search)
                              ScaleTransition(
                                scale: Tween<double>(begin: 1.0, end: 0)
                                    .animate(_controller),
                                child: const FilterButtonWidget(),
                              )
                          ],
                        ),
                        const SizedBox(height: 10),
                        Expanded(
                            child: RefreshIndicator(
                          backgroundColor: Configuration.accentColor,
                          color: Configuration.primaryDarkColor,
                          onRefresh: () async {
                            // Replace this delay with the code to be executed during refresh
                            // and return a Future when code finishes execution.
                            return Future<void>.delayed(
                                const Duration(seconds: 3));
                          },
                          child: ListView.separated(
                              padding: const EdgeInsets.symmetric(vertical: 10),
                              itemBuilder: (context, _) {
                                return state is ExploreLoading
                                    ? const WorkpostPreviewLoadingWidget()
                                    : Container();
                              },
                              separatorBuilder: (context, _) {
                                return const SizedBox(height: 30);
                              },
                              itemCount: 2),
                        ))
                      ],
                    ),
                  );
                }))),
            bottomNavigationBar:
                const NavigationBarWidget(pageType: PageType.explore));
      },
    );
  }

  void _toggleSearch() {
    setState(() {
      search = !search;
      if (search) {
        _controller.forward();
      } else {
        _controller.reverse();
      }
    });
  }
}
