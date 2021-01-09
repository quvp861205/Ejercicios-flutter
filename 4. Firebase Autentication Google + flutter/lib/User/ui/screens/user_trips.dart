import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:platzi_trips_app/User/bloc/bloc_user.dart';
import 'package:platzi_trips_app/User/ui/screens/profile_header.dart';
import 'package:platzi_trips_app/User/ui/widgets/profile_places_list.dart';
import 'package:platzi_trips_app/User/ui/widgets/profile_background.dart';


class ProfileTrips extends StatelessWidget {
  UserBloc userBloc;

  @override
  Widget build(BuildContext context) {

    userBloc = BlocProvider.of<UserBloc>(context);


    return BlocProvider(child: Stack(
      children: <Widget>[
        ProfileBackground(),
        ListView(
          children: <Widget>[
            ProfileHeader(),
            ProfilePlacesList()

          ],
        ),
      ],
    ));
  }
}


