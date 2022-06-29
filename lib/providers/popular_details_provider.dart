import 'package:flutter/cupertino.dart';
import 'package:squadio_task/models/popular_person_details.dart';
import 'package:squadio_task/repository/popular_people_repo.dart';

class PopularDetailsProvider with ChangeNotifier{
 late int popularId;
 late PopularDetails popularDetails;
 bool loading = false;

 // setting this value once open any popular entry in order to get the popular details

 setPopularId(int id){
   popularId = id;
 }
 PopularDetails get popularPersonDetails => popularDetails;

 getPopularDetails() async
 {
   loading= true;
   popularDetails = await PopularPeopleRepo.getPopularDetails(popularId);
   loading = false;
   notifyListeners();
 }



}