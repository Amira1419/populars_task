import 'package:flutter/material.dart';
import 'package:squadio_task/models/popular_person_model.dart';

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
            children: [
              ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(8)),
                  child: Image.network(
                      'https://image.tmdb.org/t/p/w500${popularPerson.profilePath}')),
              const SizedBox(width: 8),
              Text(popularPerson.name,style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
                color: Colors.lightBlue.shade900),
                )
            ],
          ),
        ),
      ),
    );
  }
}
