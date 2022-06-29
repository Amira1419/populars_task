import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:squadio_task/providers/popular_details_provider.dart';

class PopularPersonDetailsScreen extends StatefulWidget {
  const PopularPersonDetailsScreen({Key? key}) : super(key: key);

  @override
  State<PopularPersonDetailsScreen> createState() =>
      _PopularPersonDetailsScreenState();
}

class _PopularPersonDetailsScreenState
    extends State<PopularPersonDetailsScreen> {
  @override
  void initState() {
    // TODO: implement initState
    Provider.of<PopularDetailsProvider>(context, listen: false)
        .getPopularDetails();
    Provider.of<PopularDetailsProvider>(context, listen: false)
        .getPopularImages();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var detailsProvider = Provider.of<PopularDetailsProvider>(context);
    return detailsProvider.loading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Scaffold(
            appBar: AppBar(
              title: Text(detailsProvider.popularDetails.name),
            ),
            body: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      child: ClipRRect(
                        child: Image.network(
                            'https://image.tmdb.org/t/p/w500${detailsProvider.popularPersonDetails.profilePath}'),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Center(
                      child: Text(
                        detailsProvider.popularPersonDetails.name,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.lightBlue.shade900,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Center(
                      child: Text(
                        detailsProvider.popularPersonDetails.department,
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.lightBlue.shade900,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text("Birth",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.lightBlue.shade900)),
                    Text(
                      detailsProvider.popularPersonDetails.birthDay +
                          ' at ' +
                          detailsProvider.popularPersonDetails.placeOfBirth,
                      style:
                          TextStyle(fontSize: 12, color: Colors.grey.shade600),
                    ),
                    if (detailsProvider.popularPersonDetails.deathDay != null)
                      Column(
                        children: [
                          const SizedBox(
                            height: 16,
                          ),
                          Text("Death",
                              style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.lightBlue.shade900)),
                          Text(
                            detailsProvider.popularDetails.deathDay!,
                            style: TextStyle(
                                fontSize: 12, color: Colors.grey.shade600),
                          ),
                        ],
                      ),
                    const SizedBox(
                      height: 16,
                    ),
                    Text("Bio",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.lightBlue.shade900)),
                    Text(detailsProvider.popularDetails.biography,
                        style: TextStyle(
                            fontSize: 12, color: Colors.grey.shade600)),
                    const SizedBox(
                      height: 16,
                    ),

                    Text("More Images",
                        style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.lightBlue.shade900)),
                    GridView.builder(
                      shrinkWrap: true,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                        ),
                        itemCount: detailsProvider.popularPersonImagesCount,
                        itemBuilder: (BuildContext context, int index) {
                          return Image.network('https://image.tmdb.org/t/p/w500${detailsProvider.popularPersonImages[index]}');
                        }),
                  ],
                ),
              ),
            ),
          );
  }
}
