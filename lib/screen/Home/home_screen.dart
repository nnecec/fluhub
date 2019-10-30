import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import './bloc/bloc.dart';

import './event_card.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _homeBloc = BlocProvider.of<HomeBloc>(context);

    return CupertinoPageScaffold(
      child: Container(
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
                    return BlocBuilder<HomeBloc, HomeState>(
                      builder: (BuildContext context, HomeState state) {
                        if (state is HomeStateEmpty) {
                          _homeBloc.add(EventsList(login: 'nnecec'));
                        }
                        if (state is HomeStateLoading) {
                          return CupertinoActivityIndicator();
                        }
                        if (state is HomeStateSuccess) {
                          return Container(
                            child: Column(
                              children: state.events
                                  .map<Widget>((event) => EventCard(event))
                                  .toList(),
                            ),
                          );
                        }

                        return Text('');
                      },
                    );
                  },
                  childCount: 1,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
