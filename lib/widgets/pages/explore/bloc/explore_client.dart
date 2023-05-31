import '../../../../models/workpost.dart';
import '../../../../models/workpost_query.dart';

abstract class ExploreClient {
  Future<List<Workpost>> getWorkposts(WorkpostQuery query);
  Future<List<Workpost>> getMoreWorkposts(List<Workpost> current, WorkpostQuery query);
  static ExploreClient getClientFromValue(String value) {
    return FirebaseExploreClient();
  }
}

class FirebaseExploreClient extends ExploreClient {
  @override
  Future<List<Workpost>> getWorkposts(WorkpostQuery query) {
    // TODO: implement getWorkposts
    throw UnimplementedError();
  }
  
  @override
  Future<List<Workpost>> getMoreWorkposts(List<Workpost> current, WorkpostQuery query) {
    // TODO: implement getMoreWorkposts
    throw UnimplementedError();
  }

}