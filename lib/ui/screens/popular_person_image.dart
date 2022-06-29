import 'package:flutter/material.dart';
import 'package:squadio_task/models/popular_person_model.dart';
import 'package:squadio_task/network/save_image_network.dart';

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
          IconButton(onPressed: ()async{
            ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Downloading...')));
            bool isSuccess = await SaveImageNetwork.saveImage('https://image.tmdb.org/t/p/original${popularPerson.profilePath}');
            if(isSuccess)
            {
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Image Downloaded Successfully')));
            }else{
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Image Downloading Faild')));
            }

          }, icon: const Icon(Icons.file_download_rounded))
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