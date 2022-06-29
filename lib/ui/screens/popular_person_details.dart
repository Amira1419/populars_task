import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:squadio_task/providers/popular_details_provider.dart';

class PopularPersonDetailsScreen extends StatefulWidget {
  const PopularPersonDetailsScreen({ Key? key }) : super(key: key);

  @override
  State<PopularPersonDetailsScreen> createState() => _PopularPersonDetailsScreenState();
}

class _PopularPersonDetailsScreenState extends State<PopularPersonDetailsScreen> {
  @override
  void initState() {
    // TODO: implement initState
    Provider.of<PopularDetailsProvider>(context,listen: false).getPopularDetails();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    var detailsProvider = Provider.of<PopularDetailsProvider>(context);
    return detailsProvider.loading?
    const Center(
      child: CircularProgressIndicator(),
    ):
     Scaffold(
       body: Text(detailsProvider.popularPersonDetails.name),
      
    );
  }
}