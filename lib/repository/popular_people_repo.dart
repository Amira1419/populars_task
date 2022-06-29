import 'package:squadio_task/models/popular_person_model.dart';
import 'package:squadio_task/network/popular_people.dart';

class PopularPeopleRepo {
  static Future<List<PopularPerson>> getPopularPeopleList(
      int pageNumber) async {
    try {
      Map<String, dynamic> newPageData =
          await PopularPeopleNetwork.getPagePopularPeople(pageNumber);
      return (newPageData['results'] as List)
          .whereType<Map<String, dynamic>>()
          .map((e) => PopularPerson.fromJson(e))
          .toList();
    } catch (e) {
      rethrow;
    }
  }
}
