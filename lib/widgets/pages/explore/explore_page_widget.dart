import 'package:flutter/material.dart';
import 'package:workposts_mobile/widgets/navigation_bar_widget.dart';
import 'package:workposts_mobile/widgets/pages/explore/filter_button_widget.dart';
import 'package:workposts_mobile/widgets/pages/explore/search_bar_widget.dart';

import '../../../configuration.dart';
import '../../../models/page_type.dart';

class ExplorePageWidget extends StatefulWidget {
  const ExplorePageWidget({super.key});

  @override
  State<ExplorePageWidget> createState() => _ExplorePageWidgetState();
}

class _ExplorePageWidgetState extends State<ExplorePageWidget> {
  var search = false;
  @override
  Widget build(BuildContext context) {
    double navigationWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        body: Container(
            width: navigationWidth,
            decoration:
                const BoxDecoration(color: Configuration.primaryDarkColor),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    margin: EdgeInsets.only(
                        top: 75,
                        left: navigationWidth * 0.05,
                        right: navigationWidth * 0.05),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SearchBarWidget(toggleSearch: _toggleSearch),
                        if (!search) const FilterButtonWidget()
                      ],
                    ))
              ],
            )),
        bottomNavigationBar:
            const NavigationBarWidget(pageType: PageType.explore));
  }

  void _toggleSearch() {
    setState(() {
      search = !search;
    });
  }

}
