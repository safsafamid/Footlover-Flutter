import 'package:flutter/material.dart';
import 'package:soccerapp/core/api/api.dart';
import 'package:soccerapp/ui/theme/app_theme.dart';
import 'package:soccerapp/ui/theme/widgets/app_bar.dart';

class PlayerDetailScreen extends StatefulWidget {
  final int id;
  final int teamId;
  final int leagueId;
  final int countryId;

  const PlayerDetailScreen(
      {super.key,
      required this.id,
      required this.teamId,
      required this.leagueId,
      required this.countryId,
      });

  @override
  State<PlayerDetailScreen> createState() => _PlayerDetailScreenState();
}

class _PlayerDetailScreenState extends State<PlayerDetailScreen> {
  late List<dynamic>? _playerModel = [];
  late List<dynamic>? _teamModel = [];
  late List<dynamic>? _leagueModel = [];
  late List<dynamic>? _countryModel = [];

  @override
  void initState() {
    super.initState();
    _getPlayerData();
    _getTeamData();
    _getLeagueData();
    _getCountryData();
  }

  void _getPlayerData() async {
    _playerModel = (await ApiService().getPlayer(widget.id));
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  void _getTeamData() async {
    _teamModel = (await ApiService().getTeam(widget.teamId));
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  void _getLeagueData() async {
    _leagueModel = (await ApiService().getLeague(widget.leagueId));
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  void _getCountryData() async {
    _countryModel = (await ApiService().getCountry(widget.countryId));
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
        child: _playerModel == null || _playerModel!.isEmpty
            ? const Center(
                child: Padding(
                  padding:
                      EdgeInsets.only(bottom: 10, top: 10, left: 10, right: 10),
                  child: CircleAvatar(
                    backgroundImage: AssetImage('assets/images/safsaf.png'),
                  ),
                ),
              )
            : RefreshIndicator(
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    boxShadow: null,
                  ),
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            height: 59,
                            width: 59,
                            decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: Colors.blueAccent,
                              // image: DecorationImage(
                              //   image: NetworkImage("assets/images/safsaf.png"),
                              //   fit: BoxFit.cover,
                              // ),
                            ),
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          Expanded(
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        _playerModel![0]['fullname'],
                                        overflow: TextOverflow.fade,
                                        style: const TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.only(left: 16),
                                      decoration: const BoxDecoration(
                                          color: Colors.black,
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(5))),
                                      padding: const EdgeInsets.all(3),
                                      child: Text(
                                        _playerModel![0]['shirt_number'],
                                        style: const TextStyle(
                                            color: Colors.white,
                                            fontSize: 10,
                                            fontWeight: FontWeight.w500),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 12,
                                ),
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text.rich(
                                        softWrap: false,
                                        overflow: TextOverflow.fade,
                                        TextSpan(
                                            text: 'Team: ',
                                            style: const TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500,
                                                color: Colors.grey),
                                            children: <InlineSpan>[
                                              TextSpan(
                                                text: _teamModel![0]
                                                        ['short_code']
                                                    .toString(),
                                                style: const TextStyle(
                                                    fontSize: 12,
                                                    fontWeight: FontWeight.w700,
                                                    color: Colors.black),
                                              ),
                                            ]),
                                      ),
                                    ),
                                    const SizedBox(
                                      width: 1,
                                    ),
                                    Expanded(
                                      child: Text.rich(
                                          softWrap: false,
                                          overflow: TextOverflow.fade,
                                          TextSpan(
                                              text: 'League: ',
                                              style: const TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.grey),
                                              children: <InlineSpan>[
                                                TextSpan(
                                                  text: _leagueModel![0]
                                                          ['short_code']
                                                      .toString(),
                                                  style: const TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: Colors.black),
                                                )
                                              ])),
                                    ),
                                    const SizedBox(
                                      width: 1,
                                    ),
                                    Expanded(
                                      child: Text.rich(
                                          softWrap: false,
                                          overflow: TextOverflow.fade,
                                          TextSpan(
                                              text: 'Country: ',
                                              style: const TextStyle(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500,
                                                  color: Colors.grey),
                                              children: <InlineSpan>[
                                                TextSpan(
                                                  text: _countryModel![0]
                                                          ['short_code']
                                                      .toString(),
                                                  style: const TextStyle(
                                                      fontSize: 12,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color: Colors.black),
                                                )
                                              ])),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      const Divider(
                        color: Colors.black,
                        height: 20,
                        thickness: 1,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  'Claim ID',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 4.0),
                                  child: Text(
                                    'widget.claimNumber',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 16,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  'Contract No.',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    color: Colors.grey,
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 4.0),
                                  child: Text(
                                    'KP2207514735',
                                    style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                onRefresh: () {
                  return Future(() {
                    setState(() {
                      _getPlayerData();
                      _getTeamData();
                    });
                  });
                },
              ),
      ),
    );
  }
}
