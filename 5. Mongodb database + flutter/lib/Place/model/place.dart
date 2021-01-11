import 'package:flutter/material.dart';
import 'package:platzi_trips_app/User/model/user.dart';

class Place {
  String id;
  String name;
  String description;
  String uriImage;
  int likes;
  String userOwner;

  toJson() {
    return {
      "id": this.id,
      "name": this.name,
      "description": this.description,
      "uriImage": this.uriImage,
      "likes": this.likes,
      "userOwner": this.userOwner
    };
  }

  Place({
    Key key,
    @required this.name,
    @required this.description,
    @required this.uriImage,
    @required this.likes
  });
}