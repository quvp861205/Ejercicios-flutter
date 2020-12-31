import 'package:flutter/material.dart';
import 'package:platzi_trips_app/Place/ui/widgets/review_list.dart';
import '../widgets/description_place.dart';
import 'header_appbar.dart';

class HomeTrips extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView(
          children: [
            DescriptionPlace("Bahamas", 4, "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries"),
            new ReviewList()
          ]
        ),
        HeaderAppBar()
      ],
    );
  }

}