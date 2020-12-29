import 'package:flutter/material.dart';
import 'package:platzi_trips_app/review.dart';

class ReviewList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<Review> listReview = new List<Review>();

    listReview.add(new Review("assets/img/avatar.png",
        "Goergina LaFuerte",
        "1 review 5 photos",
        "The Rivers of Sri Lanka originate in the central highlands. From there they descend to the plains and empty into the sea. "
    ));

    listReview.add(new Review("assets/img/avatar.png",
        "Goergina LaFuerte",
        "1 review 5 photos",
        "The Rivers of Sri Lanka originate in the central highlands. From there they descend to the plains and empty into the sea. "
    ));

    listReview.add(new Review("assets/img/avatar.png",
        "Goergina LaFuerte",
        "1 review 5 photos",
        "The Rivers of Sri Lanka originate in the central highlands. From there they descend to the plains and empty into the sea. "
    ));

    return Column(
      children: listReview
    );
  }

}