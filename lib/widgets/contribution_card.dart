import 'package:flutter/cupertino.dart';
import '../utils/color.dart';

class ContributionCalendar {
  int totalContributions;
  // List weeks;
}

class ContributionCard extends StatelessWidget {
  Map contributionCalendar;

  ContributionCard(contributionCalendar) {
    this.contributionCalendar = contributionCalendar;
  }

  @override
  Widget build(BuildContext context) {
    int totalCount = contributionCalendar['totalContributions'];
    List weeks = contributionCalendar['weeks'];
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            '$totalCount contributions in the last year',
            style:
                TextStyle(fontSize: 12.0, color: CupertinoColors.inactiveGray),
          ),
          SingleChildScrollView(
            padding: EdgeInsets.only(top: 10.0),
            scrollDirection: Axis.horizontal,
            reverse: true,
            child: renderCubeBox(weeks),
          )
        ],
      ),
    );
  }

  Widget renderCubeBox(List weeks) {
    final List<Widget> children = weeks.map<Widget>((week) {
      final days = week['contributionDays'];
      return Column(
        children: days.map<Widget>((day) {
          return SizedBox(
            width: 16.0,
            height: 16.0,
            child: Container(
              margin: EdgeInsets.all(1.0),
              child: DecoratedBox(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(3.0),
                  ),
                  color: HexColor(day['color']),
                ),
              ),
            ),
          );
        }).toList(),
      );
    }).toList();
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: children,
    );
  }
}
