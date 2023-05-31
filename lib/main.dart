import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:workposts_mobile/bloc/app_bloc.dart';
import 'package:workposts_mobile/bloc/app_event.dart';
import 'package:workposts_mobile/widgets/pages/main_page_widget.dart';

void main() {
  runApp(const WorkpostsApp());
}

class WorkpostsApp extends StatelessWidget {
  const WorkpostsApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocProvider(
        create: (context) => AppBloc()
          ..add(const InitializePagesEvent()),
        child: const MainPageWidget(),
      ),
    );
  }
}
