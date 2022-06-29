import 'package:flutter/cupertino.dart';
import 'package:squadio_task/models/popular_person_model.dart';
import 'package:squadio_task/repository/popular_people_repo.dart';

class PopularsPaginationProvider with ChangeNotifier{
  int _pageNumber = 1;
  List<PopularPerson> populars =[];

  List<PopularPerson> get totalPopulars => [...populars];
  bool loadingMorePopulars = false;

  nextPage()
  {
    _pageNumber++;
  }

  fetchNextPagePopulars()
  async{
    loadingMorePopulars = true;
    try {
      populars.addAll(await PopularPeopleRepo.getPopularPeopleList(_pageNumber));
      nextPage();
    loadingMorePopulars = false; 
    notifyListeners();
    } catch (e) {
      loadingMorePopulars = false;  
      rethrow;
    }
  }

  
}