import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:soccerapp/core/api/api.dart';
import 'package:soccerapp/core/data/dummy_data.dart';
import 'package:soccerapp/core/models/export_helper.dart';
import 'package:soccerapp/ui/screens/clubs/club_details_screen.dart';
import 'package:soccerapp/ui/theme/app_theme.dart';
import 'package:soccerapp/ui/theme/widgets/wigets.dart';

class LeagueScreen extends StatefulWidget {
  final int id;
  const LeagueScreen({
    super.key,
    required this.id,
  });

  @override
  State<LeagueScreen> createState() => _LeagueScreenState();
}

class _LeagueScreenState extends State<LeagueScreen> {
  late List<dynamic>? _leagueTeamsModel = [];

  @override
  void initState() {
    super.initState();
    _getLeagueTeamsData();
  }

  void _getLeagueTeamsData() async {
    _leagueTeamsModel = (await ApiService().getTeamsLeague(widget.id));
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppsBar(
        text: 'Standings',
        textColor: AppTheme.color.neutral.shade100,
        color: AppTheme.color.primary,
      ),
      backgroundColor: AppTheme.color.neutral.shade300,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(left: 20.w, top: 20.h),
            child: Row(
              children: [
                Expanded(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: Get.width / 2.3,
                        child: Text(
                          'Club',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: AppTheme.color.primary,
                          ),
                        ),
                      ),
                      SizedBox(
                        width: Get.width / 2,
                        child: Row(
                          children: [
                            boxPoint('M', title: true),
                            boxPoint('W', title: true),
                            boxPoint('D', title: true),
                            boxPoint('L', title: true),
                            boxPoint('SG', title: true),
                            boxPoint('CG', title: true),
                            boxPoint('P', title: true),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const Divider(thickness: 1.5),
          Expanded(
            child:
                // _leagueTeamsModel == null || _leagueTeamsModel!.isEmpty
                //     ? const Center(
                //         child: CircularProgressIndicator(),
                //       )
                //     :
                ListView.builder(
              physics: const BouncingScrollPhysics(),
              padding: EdgeInsets.only(left: 20.w, top: 20.h),
              itemCount: _leagueTeamsModel!.length,
              itemBuilder: (context, index) {
                int lastThree = _leagueTeamsModel!.length - 3;
                return Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        border: Border(
                          left: BorderSide(
                            color: index < 3
                                ? Colors.blue
                                : index >= lastThree
                                    ? Colors.red
                                    : Colors.transparent,
                            width: 3,
                            style: BorderStyle.solid,
                          ),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: Get.width / 2.3,
                            child: Row(
                              children: [
                                SizedBox(width: 8.w),
                                Text(
                                  (index + 1).toString(),
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w600),
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: index < 9 ? 10.0 : 5.0),
                                  child: Image.network(
                                    _leagueTeamsModel![index].logoPath,
                                    height: 30,
                                    width: 30,
                                  ),
                                ),
                                GestureDetector(
                                  child: Text(
                                    _leagueTeamsModel![index].displayName,
                                    style: const TextStyle(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => ClubDetailScreen(
                                          id: _leagueTeamsModel![index].id,
                                          leagueId:_leagueTeamsModel![index].leagueId,
                                          countryId:_leagueTeamsModel![index].countryId,
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            width: Get.width / 2,
                            child: Row(
                              children: [
                                boxPoint(10.toString()),
                                boxPoint(12.toString()),
                                boxPoint(13.toString()),
                                boxPoint(14.toString()),
                                boxPoint(11.toString()),
                                boxPoint(16.toString()),
                                boxPoint(10.toString()),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const Divider(thickness: 1),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget boxPoint(String value, {bool title = false}) {
    return SizedBox(
      width: 25,
      child: Text(
        value,
        textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: title ? FontWeight.bold : FontWeight.normal,
          color: title ? AppTheme.color.primary : Colors.black,
        ),
      ),
    );
  }
}
