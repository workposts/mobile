import 'package:flutter/material.dart';
import 'package:workposts_mobile/widgets/navigation_bar_widget.dart';

import '../../../configuration.dart';
import '../../../models/page_type.dart';

class ExplorePageWidget extends StatefulWidget {
  const ExplorePageWidget({super.key});

  @override
  State<ExplorePageWidget> createState() => _ExplorePageWidgetState();
}

class _ExplorePageWidgetState extends State<ExplorePageWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
          decoration:
              const BoxDecoration(color: Configuration.primaryDarkColor),
        ),
        bottomNavigationBar:
            const NavigationBarWidget(pageType: PageType.explore));
  }
}
