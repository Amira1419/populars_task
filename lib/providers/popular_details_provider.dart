import 'package:flutter/cupertino.dart';
import 'package:squadio_task/models/popular_person_details.dart';
import 'package:squadio_task/repository/popular_people_repo.dart';

class PopularDetailsProvider with ChangeNotifier{
 late int popularId;
 late PopularDetails popularDetails;
 bool loading = false;
 List<String> images = [];

 // setting this value once open any popular entry in order to get the popular details

 setPopularId(int id){
   popularId = id;
 }
 PopularDetails get popularPersonDetails => popularDetails;
 List<String> get popularPersonImages => [...images];

int get popularPersonImagesCount => images.length;


 getPopularDetails() async
 {
   loading= true;
   try {
    popularDetails = await PopularPeopleRepo.getPopularDetails(popularId);
       loading = false;
   notifyListeners();
   } catch (e){
     rethrow;
   }

 }

 getPopularImages() async 
 {
   try {
      var imagesPaths = await PopularPeopleRepo.getPopularImages(popularId);
      if(imagesPaths.isNotEmpty)
      {
        images = imagesPaths;
      }
      notifyListeners();

   } catch (e) {
     rethrow;
   }

 }



}