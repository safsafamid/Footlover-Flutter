import 'package:flutter/material.dart';
import 'package:soccerapp/ui/screens/players/player_list_screen.dart';

class PlayerScreen extends StatelessWidget {
  const PlayerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            const SliverAppBar(
              title: Text('Players'),
              pinned: true,
              floating: true,
              bottom: TabBar(
                isScrollable: true,
                tabs: [
                  Tab(child: Text('List')),
                  Tab(child: Text('Goals')),
                ],
              ),
            ),
          ];
        },
        body: const TabBarView(
          children: <Widget>[
            PlayerListScreen(),
            PlayerListScreen(),
          ],
        ),
      )),
    );
  }
}
