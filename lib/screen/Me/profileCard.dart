import 'package:flutter/cupertino.dart';

class ProfileCard extends StatelessWidget {
  String avatarUrl;
  String bio;
  String name;
  String login;
  String status;

  ProfileCard(profile) {
    avatarUrl = profile['avatarUrl'];
    bio = profile['bio'];
    name = profile['name'];
    login = profile['login'];
    status = profile['status']['emoji'] + profile['status']['message'];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(children: [
        Image.network(
          avatarUrl,
          width: 100.0,
        ),
        DefaultTextStyle(
          textAlign: TextAlign.center,
          style: TextStyle(
            color: CupertinoColors.black,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(name),
              Text(
                login,
                style: TextStyle(
                  color: CupertinoColors.inactiveGray,
                  fontSize: 14.0,
                ),
              ),
              Text(bio),
            ],
          ),
        )
      ]),
    );
  }
}
