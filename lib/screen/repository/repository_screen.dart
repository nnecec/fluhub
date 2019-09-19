import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:fluhub/widgets/repository_card.dart';
import 'package:fluhub/widgets/markdown_card.dart';

import './bloc/bloc.dart';

import './repository_information.dart';
import './repository_summary.dart';

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
    _repositoryBloc.dispatch(RepositoryDetail(name: args.name));

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
                        if (state is RepositoryStateLoading) {
                          return CupertinoActivityIndicator();
                        }
                        if (state is RepositoryStateSuccess) {
                          print(state.repository);
                          final repository = state.repository['repository'];
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.max,
                            children: <Widget>[
                              RepositoryInformation(repository),
                              RepositorySummary(repository),
                              // Container(
                              //   child: MarkdownCard(data: repository['defaultBranchRef']['target']['repository']['readme']['text']),
                              // ),
                            ],
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
