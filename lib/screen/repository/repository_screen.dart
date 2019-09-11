import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:fluhub/widgets/repository_card.dart';

import './bloc/bloc.dart';

class RepositoryScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return RepositoryScreenState();
  }
}

class RepositoryScreenState extends State<RepositoryScreen> {
  RepositoryScreenState() {}

  @override
  Widget build(BuildContext context) {
    final _repositoryBloc = BlocProvider.of<RepositoryBloc>(context);

    final RepositoryArguments args = ModalRoute.of(context).settings.arguments;

    return CupertinoPageScaffold(
      child: Container(
        child: CustomScrollView(
          slivers: <Widget>[
            CupertinoSliverNavigationBar(
              previousPageTitle: 'Home',
              largeTitle: Text(args.name.split('/')[1]),
            ),
            SliverSafeArea(
              top: false,
              minimum: EdgeInsets.only(top: 8),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    return BlocBuilder<RepositoryBloc, RepositoryState>(
                      builder: (BuildContext context, RepositoryState state) {
                        if (state is RepositoryStateEmpty) {
                          _repositoryBloc
                              .dispatch(RepositoryDetail(name: args.name));
                        }
                        if (state is RepositoryStateSuccess) {
                          return Text('123');
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
