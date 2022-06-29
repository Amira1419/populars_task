import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:squadio_task/providers/populars_pagination_provider.dart';
import 'package:squadio_task/ui/widgets/popular_person_card.dart';

class PagedPopularList extends StatelessWidget {
  PagedPopularList({ Key? key }) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    var paginationProvider = Provider.of<PopularsPaginationProvider>(context,listen: false);
    return FutureBuilder(
      future: paginationProvider.fetchNextPagePopulars(),
      builder:(_,snapshot)
      {
        // there will be 2 cases : function return error or function return with data -> empty or not
        if(snapshot.connectionState == ConnectionState.waiting)
        {
          return const Center(
              child:CircularProgressIndicator()
            );
        }

        else if(paginationProvider.totalPopulars.isEmpty)
        {
          
            return const Center(
              child:Text('No Data')
            );
        }
        else if (paginationProvider.totalPopulars.isNotEmpty){   // data is not empty
            
            return Consumer<PopularsPaginationProvider>(
              builder: (ctx, paginationProviderData,child){
                return ListView.builder(
                itemBuilder:(__,index) {
                  if(index == paginationProviderData.totalPopulars.length-1)
                  {
                    paginationProviderData.fetchNextPagePopulars();
                  }
                  return PopularPersonCard(popularPerson: paginationProviderData.totalPopulars[index],);
                },
                itemCount: paginationProviderData.totalPopulars.length,
                );
              },
 
            );
          
        }else{
          return const Center(
              child:Text('Something Went Wrong')
            );
        }
        
      } 
      );
  }
}