import 'dart:convert';
import 'package:fluhub/screen/Home/event_card.dart';
import 'package:fluhub/store/reducers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_redux/flutter_redux.dart';
import './redux/action.dart';
import '../../utils/githubV3_client.dart';

class Home extends StatefulWidget {
  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: FutureBuilder(
        future: v3.get('/users/nnecec/received_events'),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            final events = List.from(snapshot.data);
            return Container(
              decoration: BoxDecoration(
                color: CupertinoColors.extraLightBackgroundGray,
              ),
              child: CustomScrollView(
                slivers: <Widget>[
                  CupertinoSliverNavigationBar(
                    largeTitle: Text('News'),
                  ),
                  SliverSafeArea(
                    top: false,
                    minimum: EdgeInsets.only(top: 8),
                    sliver: SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          if (index < events.length) {
                            final event = events[index];
                            final user = event['actor'];
                            final action = event['type'];
                            final title = event['repo']['name'];
                            return EventCard(user, action, title);
                          }
                          return null;
                        },
                      ),
                    ),
                  ),
                ],
              ),
            );
          }
          return Text('loading...');
        },
      ),
    );
  }
}
