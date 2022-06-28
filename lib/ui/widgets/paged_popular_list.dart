import 'package:flutter/material.dart';
import 'package:squadio_task/models/popular_person_model.dart';
import 'package:squadio_task/repository/popular_people_repo.dart';
import 'package:squadio_task/ui/widgets/popular_person_card.dart';

class PagedPopularList extends StatelessWidget {
  PagedPopularList({ Key? key }) : super(key: key);
  
  int _pageNumber = 1;   // used in finite scrolling


  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: PopularPeopleRepo.getPopularPeopleList(_pageNumber),
      builder:(_,AsyncSnapshot<List<PopularPerson>> snapshot)
      {
        // there will be 2 cases : function return error or function return with data -> empty or not
        if(snapshot.connectionState == ConnectionState.waiting)
        {
          return const Center(
              child:CircularProgressIndicator()
            );
        }

        else if(snapshot.hasData)
        {
          if(snapshot.data!.isEmpty)
          {
            return const Center(
              child:Text('No Data')
            );
          }else{   // data is not empty
            return ListView.builder(
              itemBuilder:(__,index) => PopularPersonCard(popularPerson: snapshot.data![index],),
              itemCount: snapshot.data!.length,
              );
          }
        }else{
          return const Center(
              child:Text('Something Went Wrong')
            );
        }
        
      } 
      );
  }
}