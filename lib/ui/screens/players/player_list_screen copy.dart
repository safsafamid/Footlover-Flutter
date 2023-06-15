import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:soccerapp/core/api/api.dart';
import 'package:soccerapp/core/models/data/player_model.dart';
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
    return _playersModel == null || _playersModel!.isEmpty
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : ListView.builder(
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.symmetric(horizontal: 10.w),
            itemCount: _playersModel!.length,
            itemBuilder: (context, index) {
              return Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text((index + 1).toString()),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 15.w),
                        child: _playersModel![index].imagePath != null
                            ? CircleAvatar(
                                backgroundImage: NetworkImage(_playersModel![index].imagePath),
                              )
                            : CircleAvatar(
                                backgroundColor:
                                    AppTheme.color.neutral.shade400,
                                child: const Icon(Iconsax.user),
                              ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
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
          );
            });
    // Container(
    //     margin: EdgeInsets.only(top: 10.h),
    //     child: FutureBuilder<List<Player>>(
    //       future: fetchPlayers(),
    //       builder: (context, snapshot) {
    //         if (snapshot.hasData) {
    //           List<Player> players = snapshot.data as List<Player>;
    //           return RefreshIndicator(
    //             child: ListView.builder(
    //                 physics: const BouncingScrollPhysics(),
    //                 padding: EdgeInsets.symmetric(horizontal: 10.w),
    //                 itemCount: players.length,
    //                 itemBuilder: (context, index) {
    //                   return Column(
    //                     children: [
    //                       Row(
    //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                         children: [
    //                           Row(
    //                             children: [
    //                               Text(players[index].id.toString()),
    //                               Container(
    //                                 padding:
    //                                     EdgeInsets.symmetric(horizontal: 15.w),
    //                                 child: players[index].imagePath != null
    //                                     ? CircleAvatar(
    //                                         backgroundImage: NetworkImage(
    //                                             players[index].imagePath),
    //                                       )
    //                                     : CircleAvatar(
    //                                         backgroundColor:
    //                                             AppTheme.color.neutral.shade400,
    //                                         child: const Icon(Iconsax.user),
    //                                       ),
    //                               ),
    //                               Column(
    //                                 mainAxisAlignment: MainAxisAlignment.center,
    //                                 crossAxisAlignment:
    //                                     CrossAxisAlignment.start,
    //                                 children: [
    //                                   GestureDetector(
    //                                     child:
    //                                   Text(players[index].fullname),
    //                                   onTap: () {
    //                                       Navigator.push(
    //                                         context,
    //                                         MaterialPageRoute(
    //                                           builder: (_) => PlayerDetailScreen(
    //                                             id: players[index].id.toString(),
    //                                           ),
    //                                         ),
    //                                       );
    //                                     },
    //                                   ),
    //                                   SizedBox(height: 5.h),
    //                                   Row(
    //                                     children: [
    //                                       // Image.asset(
    //                                       //   goal.clubLogo,
    //                                       //   height: 20,
    //                                       // ),
    //                                       SizedBox(width: 5.w),
    //                                       Text(
    //                                         players[index].shirtNumber,
    //                                         style: TextStyle(
    //                                           fontSize: 12.sp,
    //                                           color: AppTheme
    //                                               .color.neutral.shade600,
    //                                         ),
    //                                       )
    //                                     ],
    //                                   )
    //                                 ],
    //                               ),
    //                             ],
    //                           ),
    //                           Padding(
    //                             padding: const EdgeInsets.only(right: 15.0),
    //                             child: Text(
    //                               '${players[index].shirtNumber}',
    //                               style: TextStyle(
    //                                 fontSize: 14.sp,
    //                                 color: AppTheme.color.primary,
    //                                 fontWeight: FontWeight.bold,
    //                               ),
    //                             ),
    //                           )
    //                         ],
    //                       ),
    //                       const Divider(thickness: 1),
    //                     ],
    //                   );
    //                 }),
    //             onRefresh: () {
    //               return Future(() {
    //                 setState(() {});
    //               });
    //             },
    //           );
    //         }
    //         if (snapshot.hasError) {
    //           print(snapshot.error.toString());
    //           return Text('error');
    //         }
    //         return CircularProgressIndicator();
    //       },
    //     )
    //     // ListView.builder(
    //     //   physics: const BouncingScrollPhysics(),
    //     //   padding: EdgeInsets.symmetric(horizontal: 10.w),
    //     //   itemCount: goals().length,
    //     //   itemBuilder: (BuildContext context, int index) {
    //     //     StatsData goal = goals()[index];
    //     //     return Column(
    //     //       children: [
    //     //         Row(
    //     //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //     //           children: [
    //     //             Row(
    //     //               children: [
    //     //                 Text((index + 1).toString()),
    //     //                 Container(
    //     //                   padding: EdgeInsets.symmetric(horizontal: 15.w),
    //     //                   child: goal.photo != null
    //     //                       ? CircleAvatar(
    //     //                           backgroundImage: AssetImage(goal.photo!),
    //     //                         )
    //     //                       : CircleAvatar(
    //     //                           backgroundColor:
    //     //                               AppTheme.color.neutral.shade400,
    //     //                           child: const Icon(Iconsax.user),
    //     //                         ),
    //     //                 ),
    //     //                 Column(
    //     //                   mainAxisAlignment: MainAxisAlignment.center,
    //     //                   crossAxisAlignment: CrossAxisAlignment.start,
    //     //                   children: [
    //     //                     Text(goal.name),
    //     //                     SizedBox(height: 5.h),
    //     //                     Row(
    //     //                       children: [
    //     //                         Image.asset(
    //     //                           goal.clubLogo,
    //     //                           height: 20,
    //     //                         ),
    //     //                         SizedBox(width: 5.w),
    //     //                         Text(
    //     //                           goal.club,
    //     //                           style: TextStyle(
    //     //                             fontSize: 12.sp,
    //     //                             color: AppTheme.color.neutral.shade600,
    //     //                           ),
    //     //                         )
    //     //                       ],
    //     //                     )
    //     //                   ],
    //     //                 ),
    //     //               ],
    //     //             ),
    //     //             Padding(
    //     //               padding: const EdgeInsets.only(right: 15.0),
    //     //               child: Text(
    //     //                 '${goal.point}',
    //     //                 style: TextStyle(
    //     //                   fontSize: 14.sp,
    //     //                   color: AppTheme.color.primary,
    //     //                   fontWeight: FontWeight.bold,
    //     //                 ),
    //     //               ),
    //     //             )
    //     //           ],
    //     //         ),
    //     //         const Divider(thickness: 1),
    //     //       ],
    //     //     );
    //     //   },
    //     // ),
    //     );
  }
}
