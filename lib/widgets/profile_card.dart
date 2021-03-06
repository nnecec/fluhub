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
    final CupertinoThemeData theme = CupertinoTheme.of(context);

    return Container(
      child: Row(
        children: [
          Image.network(
            avatarUrl,
            width: 100.0,
          ),
          DefaultTextStyle(
            style: TextStyle(
              color: theme.primaryColor,
              fontSize: 14.0,
            ),
            child: Container(
              width: MediaQuery.of(context).size.width - 200,
              padding: EdgeInsets.only(left: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    name,
                    style: TextStyle(
                      color: theme.primaryColor,
                      fontSize: 16.0,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 10.0),
                    child: Text(login),
                  ),
                  Text(bio),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
