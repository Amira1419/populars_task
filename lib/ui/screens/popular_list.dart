import 'package:flutter/material.dart';
import 'package:squadio_task/ui/widgets/paged_popular_list.dart';


class PopularListScreen extends StatelessWidget {
  const PopularListScreen({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FAMOUS'),
      ),
      body: PagedPopularList(),
    );
  }
}