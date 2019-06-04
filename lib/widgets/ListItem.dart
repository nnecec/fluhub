import 'package:flutter/cupertino.dart';

class ListItem extends StatelessWidget {
  const ListItem({
    this.name,
    this.place,
    this.date,
    this.called,
  });

  final String name;
  final String place;
  final String date;
  final bool called;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: CupertinoColors.white,
      height: 60.0,
      padding: const EdgeInsets.only(top: 9.0),
      child: Row(
        children: <Widget>[
          Container(
            width: 38.0,
            margin: EdgeInsets.only(top: 10),
            child: called
                ? const Align(
                    alignment: Alignment.topCenter,
                    child: Icon(
                      CupertinoIcons.phone_solid,
                      color: CupertinoColors.inactiveGray,
                      size: 28.0,
                    ),
                  )
                : null,
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: Color(0xFFBCBBC1), width: 0.0),
                ),
              ),
              padding:
                  const EdgeInsets.only(left: 1.0, bottom: 9.0, right: 10.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          name,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            letterSpacing: -0.18,
                          ),
                        ),
                        Text(
                          place,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(
                            fontSize: 15.0,
                            letterSpacing: -0.24,
                            color: CupertinoColors.inactiveGray,
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    date,
                    style: const TextStyle(
                      color: CupertinoColors.inactiveGray,
                      fontSize: 15.0,
                      letterSpacing: -0.41,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 9.0),
                    child: Icon(CupertinoIcons.info,
                        color: CupertinoColors.activeBlue),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
