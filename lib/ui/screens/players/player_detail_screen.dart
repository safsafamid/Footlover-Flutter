import 'package:flutter/material.dart';
import 'package:soccerapp/core/api/api.dart';
import 'package:soccerapp/core/data/dummy_data.dart';
import 'package:soccerapp/core/models/data/club_data.dart';
import 'package:soccerapp/core/models/data/player_model.dart';
import 'package:soccerapp/ui/theme/app_theme.dart';
import 'package:soccerapp/ui/theme/widgets/app_bar.dart';
import 'package:getwidget/getwidget.dart';

class PlayerDetailScreen extends StatefulWidget {
final int id ;

  const PlayerDetailScreen({super.key, required this.id});

  @override
  State<PlayerDetailScreen> createState() => _PlayerDetailScreenState();
}

class _PlayerDetailScreenState extends State<PlayerDetailScreen> {
  late List<Player>? _playerModel = [];

  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    _playerModel = (await ApiService().getPlayer(widget.id));
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppsBar(
        text: 'Players',
        textColor: AppTheme.color.neutral.shade100,
        color: AppTheme.color.primary,
      ),
      backgroundColor: AppTheme.color.neutral.shade300,
      body: SingleChildScrollView(
        child: GFCard(
            boxFit: BoxFit.cover,
            titlePosition: GFPosition.start,
            image: Image.asset(
              'assets/images/bali.png',
              height: MediaQuery.of(context).size.height * 0.2,
              width: MediaQuery.of(context).size.width,
              fit: BoxFit.cover,
            ),
            showImage: true,
            title: GFListTile(
              avatar: GFAvatar(
                backgroundImage: AssetImage('assets/images/bali.png'),
              ),
              titleText: _playerModel!.length.toString(),
              subTitleText: 'PlayStation 4',
            ),
            content: Text("Some quick example text to build on the card"),
            buttonBar: GFButtonBar(
              children: <Widget>[
                GFAvatar(
                  backgroundColor: GFColors.PRIMARY,
                  child: Icon(
                    Icons.share,
                    color: Colors.white,
                  ),
                ),
                GFAvatar(
                  backgroundColor: GFColors.SECONDARY,
                  child: Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                ),
                GFAvatar(
                  backgroundColor: GFColors.SUCCESS,
                  child: Icon(
                    Icons.phone,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
      ),
    );
  }
}
