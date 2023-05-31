import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:workposts_mobile/configuration.dart';
import 'package:workposts_mobile/widgets/navigation_bar_widget.dart';

import '../../../models/page_type.dart';

class ManagePageWidget extends StatefulWidget {
  const ManagePageWidget({super.key});

  @override
  State<ManagePageWidget> createState() => _ManagePageWidgetState();
}

class _ManagePageWidgetState extends State<ManagePageWidget> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text('Manage', style: TextStyle(color: Configuration.primaryDarkColor)),
      bottomNavigationBar: NavigationBarWidget(pageType: PageType.manage)
    );
  }
}