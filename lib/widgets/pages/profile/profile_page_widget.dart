import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:workposts_mobile/widgets/navigation_bar_widget.dart';

import '../../../configuration.dart';
import '../../../models/page_type.dart';

class ProfilePageWidget extends StatefulWidget {
  const ProfilePageWidget({super.key});

  @override
  State<ProfilePageWidget> createState() => _ProfilePageWidgetState();
}

class _ProfilePageWidgetState extends State<ProfilePageWidget> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Text('Profile', style: TextStyle(color: Configuration.primaryDarkColor)),
      bottomNavigationBar: NavigationBarWidget(pageType: PageType.profile)
    );
  }
}