import 'package:workposts_mobile/models/workpost.dart';
import 'package:workposts_mobile/models/workpost_query.dart';
import 'package:workposts_mobile/widgets/pages/explore/bloc/explore_client.dart';

class ExploreRepository {
  final ExploreClient client;
  ExploreRepository({required this.client});

  Future<List<Workpost>> getWorkposts(WorkpostQuery query) async {
    return await client.getWorkposts(query);
  }

  Future<List<Workpost>> getMoreWorkposts(List<Workpost> current, WorkpostQuery query) async {
    return await client.getMoreWorkposts(current, query);
  }

}