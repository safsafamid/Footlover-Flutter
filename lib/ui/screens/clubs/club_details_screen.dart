import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:soccerapp/core/api/api.dart';
import 'package:soccerapp/ui/screens/players/player_detail_screen.dart';
import 'package:soccerapp/ui/theme/app_theme.dart';
import 'package:soccerapp/ui/theme/widgets/app_bar.dart';

class ClubDetailScreen extends StatefulWidget {
  final int id;
  final int leagueId;
  final int countryId;

  const ClubDetailScreen({
    super.key,
    required this.id,
    required this.leagueId,
    required this.countryId,
  });

  @override
  State<ClubDetailScreen> createState() => _PlayerDetailScreenState();
}

class _PlayerDetailScreenState extends State<ClubDetailScreen> {
  late List<dynamic>? _teamModel = [];
  late List<dynamic>? _teamPlayersModel = [];
  late List<dynamic>? _leagueModel = [];
  late List<dynamic>? _countryModel = [];

  @override
  void initState() {
    super.initState();
    _getTeamData();
    _getPlayersTeamData();
    _getLeagueData();
    _getCountryData();
  }

  void _getTeamData() async {
    _teamModel = (await ApiService().getTeam(widget.id));
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  void _getPlayersTeamData() async {
    _teamPlayersModel = (await ApiService().getPlayersTeam(widget.id));
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
        text: 'Team',
        textColor: AppTheme.color.neutral.shade100,
        color: AppTheme.color.primary,
      ),
      backgroundColor: AppTheme.color.neutral.shade300,
      body: SingleChildScrollView(
        child: _teamModel == null || _teamModel!.isEmpty
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
                child: Padding(
                  padding: const EdgeInsets.only(
                      bottom: 10, top: 10, left: 10, right: 10),
                  child: Column(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 254, 254, 254),
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          boxShadow: null,
                        ),
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                SizedBox(
                                  height: 60,
                                  width: 60,
                                  child: CircleAvatar(
                                    radius: 48, // Image radius
                                    backgroundImage: NetworkImage(
                                        '${_teamModel![0]['logo_path']}'),
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
                                              _teamModel![0]['name'],
                                              overflow: TextOverflow.fade,
                                              style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            margin:
                                                const EdgeInsets.only(left: 16),
                                            decoration: const BoxDecoration(
                                                color: Colors.black,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(5))),
                                            padding: const EdgeInsets.all(3),
                                            child: Text(
                                              _teamModel![0]['short_code'],
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'League',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 4.0),
                                        child: Text(
                                          _leagueModel![0]['short_code']
                                              .toString(),
                                          style: const TextStyle(
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      const Text(
                                        'Country',
                                        style: TextStyle(
                                          fontSize: 12,
                                          fontWeight: FontWeight.w500,
                                          color: Colors.grey,
                                        ),
                                      ),
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(top: 4.0),
                                        child: Text(
                                          _countryModel![0]['short_code']
                                              .toString(),
                                          style: const TextStyle(
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
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          color: Color.fromARGB(255, 254, 254, 254),
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          boxShadow: null,
                        ),
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          children: [
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          const Expanded(
                                            child: Text(
                                              'Players',
                                              overflow: TextOverflow.fade,
                                              style: TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.w700,
                                              ),
                                            ),
                                          ),
                                          Container(
                                            margin:
                                                const EdgeInsets.only(left: 16),
                                            decoration: const BoxDecoration(
                                                color: Colors.black,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(5))),
                                            padding: const EdgeInsets.all(3),
                                            child: Text(
                                              _teamModel![0]['short_code'],
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
                                  child: ListView.builder(
                                    physics: const BouncingScrollPhysics(),
                                    scrollDirection: Axis.vertical,
                                    shrinkWrap: true,
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 10.w),
                                    itemCount: _teamPlayersModel!.length,
                                    itemBuilder: (context, index) {
                                      return GestureDetector(
                                          onTap: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (_) =>
                                                    PlayerDetailScreen(
                                                  id: _teamPlayersModel![index]
                                                      .id,
                                                  teamId:
                                                      _teamPlayersModel![index]
                                                          .teamId,
                                                  leagueId:
                                                      _teamPlayersModel![index]
                                                          .teamId,
                                                  countryId:
                                                      _teamPlayersModel![index]
                                                          .countryId,
                                                ),
                                              ),
                                            );
                                          },
                                          child: Column(
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Text((index + 1)
                                                          .toString()),
                                                      Container(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal:
                                                                    15.w),
                                                        child: _teamPlayersModel![
                                                                        index]
                                                                    .imagePath !=
                                                                null
                                                            ? CircleAvatar(
                                                                backgroundImage:
                                                                    NetworkImage(
                                                                        _teamPlayersModel![index]
                                                                            .imagePath),
                                                              )
                                                            : CircleAvatar(
                                                                backgroundColor:
                                                                    AppTheme
                                                                        .color
                                                                        .neutral
                                                                        .shade400,
                                                                child: const Icon(
                                                                    Iconsax
                                                                        .user),
                                                              ),
                                                      ),
                                                      Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                              _teamPlayersModel![
                                                                      index]
                                                                  .fullname),
                                                          SizedBox(height: 5.h),
                                                          Row(
                                                            children: [
                                                              CircleAvatar(
                                                                backgroundImage:
                                                                    NetworkImage(
                                                                        '${_teamModel![0]['logo_path']}'),
                                                                        radius: 10,
                                                              ),
                                                              SizedBox(
                                                                  width: 5.w),
                                                              Text(
                                                                _teamPlayersModel![
                                                                      index]
                                                                  .displayName,
                                                                style:
                                                                    TextStyle(
                                                                  fontSize:
                                                                      12.sp,
                                                                  color: AppTheme
                                                                      .color
                                                                      .neutral
                                                                      .shade600,
                                                                ),
                                                              )
                                                            ],
                                                          )
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 15.0),
                                                    child: Text(
                                                      '${_teamPlayersModel![index].shirtNumber}',
                                                      style: TextStyle(
                                                        fontSize: 14.sp,
                                                        color: AppTheme
                                                            .color.primary,
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  )
                                                ],
                                              ),
                                              const Divider(thickness: 1),
                                            ],
                                          ));
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                onRefresh: () {
                  return Future(() {
                    setState(() {
                      _getTeamData();
                    });
                  });
                },
              ),
      ),
    );
  }
}
