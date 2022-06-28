import 'package:flutter/material.dart';
import 'package:squadio_task/models/popular_person_model.dart';

class PopularPersonImageScreen extends StatelessWidget {
  const PopularPersonImageScreen({ Key? key , required this.popularPerson}) : super(key: key);
  final PopularPerson popularPerson;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(popularPerson.name),
        actions: [
          IconButton(onPressed: (){}, icon: const Icon(Icons.file_download_rounded))
        ],
      ),
      body: Image.network(
        'https://image.tmdb.org/t/p/original${popularPerson.profilePath}',
        fit: BoxFit.cover,
        height: double.infinity,
        width: double.infinity,
        alignment: Alignment.center,
      ),
    );
  }
}