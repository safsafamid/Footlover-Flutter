import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:soccerapp/core/api/api.dart';
import 'package:soccerapp/core/models/data/player_model.dart';
import 'package:soccerapp/ui/screens/players/player_detail_screen.dart';
import 'package:soccerapp/ui/theme/app_theme.dart';
import 'package:http/http.dart' as http;

class PlayerListScreen extends StatefulWidget {
  const PlayerListScreen({super.key});

  @override
  State<PlayerListScreen> createState() => _PlayerGoalScreenState();
}

class _PlayerGoalScreenState extends State<PlayerListScreen> {
  late List<Player>? _playersModel = [];

  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    _playersModel = (await ApiService().getPlayers())!;
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.h),
      child: _playersModel == null || _playersModel!.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : RefreshIndicator(
              child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                itemCount: _playersModel!.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => PlayerDetailScreen(
                              id:  _playersModel![index].id,
                              teamId:  _playersModel![index].teamId,
                              leagueId:  _playersModel![index].teamId, 
                              countryId:  _playersModel![index].countryId, 
                            ),
                          ),
                        );
                      },
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text((index + 1).toString()),
                                  Container(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 15.w),
                                    child: _playersModel![index].imagePath !=
                                            null
                                        ? CircleAvatar(
                                            backgroundImage: NetworkImage(
                                                _playersModel![index]
                                                    .imagePath),
                                          )
                                        : CircleAvatar(
                                            backgroundColor:
                                                AppTheme.color.neutral.shade400,
                                            child: const Icon(Iconsax.user),
                                          ),
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(_playersModel![index].fullname),
                                      SizedBox(height: 5.h),
                                      // Row(
                                      //   children: [
                                      //     Image.asset(
                                      //       goal.clubLogo,
                                      //       height: 20,
                                      //     ),
                                      //     SizedBox(width: 5.w),
                                      //     Text(
                                      //       goal.club,
                                      //       style: TextStyle(
                                      //         fontSize: 12.sp,
                                      //         color: AppTheme.color.neutral.shade600,
                                      //       ),
                                      //     )
                                      //   ],
                                      // )
                                    ],
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(right: 15.0),
                                child: Text(
                                  '${_playersModel![index].shirtNumber}',
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    color: AppTheme.color.primary,
                                    fontWeight: FontWeight.bold,
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
              onRefresh: () {
                return Future(() {
                  setState(() {
                    _getData();
                  });
                });
              },
            ),
    );
  }
}
