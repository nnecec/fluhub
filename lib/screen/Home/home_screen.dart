import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import './bloc/bloc.dart';

import './event_card.dart';

class HomeScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    return BlocProvider(
      builder: (context) => HomeBloc(),
      child: HomeBlocScreen(),
    );
  }
}

class HomeBlocScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _homeBloc = BlocProvider.of<HomeBloc>(context);
    _homeBloc.dispatch(EventsList(login: 'nnecec'));

    return BlocProvider(
      builder: (context) => HomeBloc(),
      child: CupertinoPageScaffold(
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
                          if (state is HomeStateSuccess) {
                            print(state.events);
                            return Container(
                              child: Column(
                                children: state.events.map<Widget>((event) {
                                  return EventCard(
                                    event['actor'],
                                    event['type'],
                                    event['repo']['name'],
                                  );
                                }).toList(),
                              ),
                            );
                          }

                          return Text('loading...');
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
      ),
    );
  }
}
