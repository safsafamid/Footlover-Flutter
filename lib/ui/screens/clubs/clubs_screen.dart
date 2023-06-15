import 'package:flutter/material.dart';
import 'package:soccerapp/core/api/api.dart';
import 'package:soccerapp/core/models/data/team_model.dart';
import 'package:soccerapp/ui/screens/clubs/club_details_screen.dart';
import 'package:soccerapp/ui/theme/app_theme.dart';
import 'package:soccerapp/ui/theme/widgets/app_bar.dart';

class ClubsScreen extends StatefulWidget {
  const ClubsScreen({super.key});

  @override
  State<ClubsScreen> createState() => _ClubsScreenState();
}

class _ClubsScreenState extends State<ClubsScreen> {
  late List<Team>? _teamsModel = [];


  @override
  void initState() {
    super.initState();
    _getData();
  }


  void _getData() async {
    _teamsModel = (await ApiService().getTeams());
    Future.delayed(const Duration(seconds: 1)).then((value) => setState(() {}));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppsBar(
        text: 'Club',
        textColor: AppTheme.color.neutral.shade100,
        color: AppTheme.color.primary,
      ),
      backgroundColor: AppTheme.color.neutral.shade300,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _teamsModel == null || _teamsModel!.isEmpty
                      ? const Center(
                          child: CircularProgressIndicator(),
                        )
                      : GridView.builder(
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3,
                          ),
                          itemCount: _teamsModel!.length,
                          primary: false,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: const EdgeInsets.only(top: 15, left: 15),
                              child: Container(
                                decoration: BoxDecoration(
                                  color: AppTheme.color.neutral.shade100,
                                  borderRadius: const BorderRadius.all(
                                    Radius.circular(8),
                                  ),
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Color.fromRGBO(138, 149, 158, 0.2),
                                      blurRadius: 6,
                                      offset: Offset(0, 3),
                                    )
                                  ],
                                ),
                                child: InkWell(
                                  onTap: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => ClubDetailScreen(
                                          id: _teamsModel![index].id,
                                          leagueId:_teamsModel![index].leagueId,
                                          countryId:_teamsModel![index].countryId,
                                        ),
                                      ),
                                    );
                                  },
                                  splashColor: Colors.red,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8),
                                    child: Column(
                                      children: [
                                        Image.network(
                                          _teamsModel![index].logoPath,
                                          height: 70,
                                        ),
                                        SizedBox(height: 5.h),
                                        Text(
                                          _teamsModel![index].shortCode,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 12.sp,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
