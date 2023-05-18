import 'package:flutter/material.dart';
import 'package:workposts_mobile/widgets/pages/explore/explore_page_widget.dart';

void main() {
  runApp(const WorkpostsApp());
}

class WorkpostsApp extends StatelessWidget {
  const WorkpostsApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: ExplorePageWidget(),
    );
  }
}
