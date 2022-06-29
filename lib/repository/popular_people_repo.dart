import 'package:squadio_task/models/popular_person_details.dart';
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

  static Future<PopularDetails> getPopularDetails(int id) async {
    try {
      Map<String, dynamic> popularDetailsData =
          await PopularPeopleNetwork.getPopularPeronDetails(id);
      print(popularDetailsData);
      return PopularDetails.fromJson(popularDetailsData);
    } catch (e) {
      rethrow;
    }
  }

  static Future<List<String>> getPopularImages(int id) async {
    List<String> imagesPaths = [];
    try {
      Map<String, dynamic> imagesData =
          await PopularPeopleNetwork.getPopularPeronImages(id);
      for (var element in (imagesData['profiles'] as List)) {
        imagesPaths.add(element['file_path']);
      }
      return imagesPaths;
    } catch (e) {
      rethrow;
    }
  }
}
