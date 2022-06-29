import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:squadio_task/models/popular_person_model.dart';
import 'package:squadio_task/providers/popular_details_provider.dart';
import 'package:squadio_task/ui/screens/popular_person_details.dart';
import 'package:squadio_task/ui/screens/popular_person_image.dart';

class PopularPersonCard extends StatelessWidget {
  const PopularPersonCard({Key? key, required this.popularPerson})
      : super(key: key);
  final PopularPerson popularPerson;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Card(
        margin: const EdgeInsets.symmetric(horizontal: 8,vertical: 4),
        color: Colors.white,

        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  InkWell(
                    onTap: (){
                      Navigator.of(context).push(MaterialPageRoute(builder: (context)=> PopularPersonImageScreen(popularPerson: popularPerson)));
                    },
                    child: CircleAvatar(
                      child: popularPerson.profilePath == null?const Icon(Icons.person,color: Colors.white,):Container(),
                      
                      backgroundColor: Colors.grey.shade200,
                      backgroundImage: popularPerson.profilePath==null?null: NetworkImage('https://image.tmdb.org/t/p/w500${popularPerson.profilePath}'),
                        radius: 40 ,
                        // borderRadius: const BorderRadius.all(Radius.circular(8)),
                    ),
                  ),
                  const SizedBox(width: 8),

                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(popularPerson.name,style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.lightBlue.shade900),
                        ),
                      Container(
                        padding: const EdgeInsets.all(4),
                        child: Text(popularPerson.department ,style: TextStyle(
                        fontSize: 10,
                        color: Colors.lightBlue.shade900),
                        ),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade200,
                          borderRadius: BorderRadius.circular(16),
                        ),
                      )   
                    ],
                  )
                ],
              ),
              IconButton(onPressed: (){
                Provider.of<PopularDetailsProvider>(context,listen: false).setPopularId(popularPerson.id);
                Navigator.of(context).push(MaterialPageRoute(builder: (_) => const PopularPersonDetailsScreen()));
              }, icon: Icon(Icons.arrow_forward_ios,color: Colors.lightBlue.shade900,))
            ],
          ),
          
        ),
      ),
    );
  }
}
