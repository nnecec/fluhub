import 'package:fluhub/screen/Home/event_card.dart';
import 'package:flutter/cupertino.dart';
import '../../utils/githubV3_client.dart';

class HomeScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: FutureBuilder(
        future: v3.get('/users/nnecec/received_events'),
        builder: (BuildContext context, AsyncSnapshot<dynamic> snapshot) {
          if (snapshot.hasData) {
            final events = List.from(snapshot.data);
            return Container(
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
