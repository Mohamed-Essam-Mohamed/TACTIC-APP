import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gap/gap.dart';
import 'package:tactic_zone/src/data/models/response/data_response_video.dart';
import 'package:tactic_zone/src/utils/app_color.dart';
import 'package:tactic_zone/src/utils/app_text_style.dart';

class StaticPage extends StatelessWidget {
  final DataResponseVideo? data;
  const StaticPage({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColor.primaryColor,
        title: Text(
          "ٍStatistics Page",
          style: AppTextStyle.textStyle40,
        ),
        iconTheme: const IconThemeData(color: AppColor.withColor),
      ),
      body: Stack(
        children: [
          Image.asset(
            "assets/image/background-home.png",
            width: double.infinity,
            height: double.infinity,
            fit: BoxFit.cover,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: ListView(
              children: [
                Gap(20.h),
                Text(
                  "Match Summary",
                  style: AppTextStyle.textStyle30
                      .copyWith(color: AppColor.blackColor),
                  overflow: TextOverflow.ellipsis,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 30.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.r),
                    image: const DecorationImage(
                      image: AssetImage("assets/image/rectangle-profile.png"),
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Gap(10.h),
                      Text(
                        "Your team match",
                        style: AppTextStyle.textStyle30.copyWith(
                          fontSize: 25.sp,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        "Formation : ${data!.matchSummary!.matchSummaryIn!.myTeamPerformance!.formation ?? ""}",
                      ),
                      Text(
                        "Score : ${data!.matchSummary!.matchSummaryIn!.myTeamPerformance!.score ?? ""}",
                      ),
                      Text(
                        "Goals : ${data!.matchSummary!.matchSummaryIn!.myTeamPerformance!.goals ?? ""}",
                      ),
                      Text(
                        "Total Shots : ${data!.matchSummary!.matchSummaryIn!.myTeamPerformance!.totalShots ?? ""}",
                      ),
                      Text(
                        "Shots on Target : ${data!.matchSummary!.matchSummaryIn!.myTeamPerformance!.shotsOnTarget ?? ""}",
                      ),
                      Text(
                        "Total Possesion : ${data!.matchSummary!.matchSummaryIn!.myTeamPerformance!.totalPossession ?? ""}",
                      ),
                      Text(
                        "Accurate Passes : ${data!.matchSummary!.matchSummaryIn!.myTeamPerformance!.accuratePasses ?? ""}",
                      ),
                      Text(
                        "Pass Success Rate : ${data!.matchSummary!.matchSummaryIn!.myTeamPerformance!.passSuccessRate ?? ""}",
                      ),
                      Text(
                        "Key Passes : ${data!.matchSummary!.matchSummaryIn!.myTeamPerformance!.keyPasses ?? ""}",
                      ),
                      Text(
                        "Dribbles Success Rate : ${data!.matchSummary!.matchSummaryIn!.myTeamPerformance!.dribblesSuccessRate ?? ""}",
                      ),
                      Text(
                        "Tackle Success Rate : ${data!.matchSummary!.matchSummaryIn!.myTeamPerformance!.tackleSuccessRate ?? ""}",
                      ),
                      Text(
                        "corners : ${data!.matchSummary!.matchSummaryIn!.myTeamPerformance!.corners ?? ""}",
                      ),
                      Text(
                        "Your opponent match",
                        style: AppTextStyle.textStyle30.copyWith(
                          fontSize: 25.sp,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        "Formation : ${data!.matchSummary!.matchSummaryIn!.opponentPerformance!.formation ?? ""}",
                      ),
                      Text(
                        "Score : ${data!.matchSummary!.matchSummaryIn!.opponentPerformance!.score ?? ""}",
                      ),
                      Text(
                        "Goals : ${data!.matchSummary!.matchSummaryIn!.opponentPerformance!.goals ?? ""}",
                      ),
                      Text(
                        "Total Shots : ${data!.matchSummary!.matchSummaryIn!.opponentPerformance!.totalShots ?? ""}",
                      ),
                      Text(
                        "Shots on Target : ${data!.matchSummary!.matchSummaryIn!.opponentPerformance!.shotsOnTarget ?? ""}",
                      ),
                      Text(
                        "Total Possesion : ${data!.matchSummary!.matchSummaryIn!.opponentPerformance!.totalPossession ?? ""}",
                      ),
                      Text(
                        "Accurate Passes : ${data!.matchSummary!.matchSummaryIn!.opponentPerformance!.accuratePasses ?? ""}",
                      ),
                      Text(
                        "Pass Success Rate : ${data!.matchSummary!.matchSummaryIn!.opponentPerformance!.passSuccessRate ?? ""}",
                      ),
                      Text(
                        "Key Passes : ${data!.matchSummary!.matchSummaryIn!.opponentPerformance!.keyPasses ?? ""}",
                      ),
                      Text(
                        "Dribbles Success Rate : ${data!.matchSummary!.matchSummaryIn!.opponentPerformance!.dribblesSuccessRate ?? ""}",
                      ),
                      Text(
                        "Tackle Success Rate : ${data!.matchSummary!.matchSummaryIn!.opponentPerformance!.tackleSuccessRate ?? ""}",
                      ),
                      Text(
                        "corners : ${data!.matchSummary!.matchSummaryIn!.opponentPerformance!.corners ?? ""}",
                      ),
                      Gap(20.h),
                    ],
                  ),
                ),
                Text(
                  "Recommendations",
                  style: AppTextStyle.textStyle30
                      .copyWith(color: AppColor.blackColor),
                  overflow: TextOverflow.ellipsis,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 30.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.r),
                    image: const DecorationImage(
                      image: AssetImage("assets/image/rectangle-profile.png"),
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Gap(10.h),
                      Text(
                        "Best Formation",
                        style: AppTextStyle.textStyle30.copyWith(
                          fontSize: 25.sp,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        "Formation : ${data!.recommendations!.recommendationsOutput!.bestFormation!.formation ?? ""}",
                      ),
                      Text(
                        "Best Formation",
                        style: AppTextStyle.textStyle30.copyWith(
                          fontSize: 25.sp,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      for (int i = 0;
                          i <
                              data!.recommendations!.recommendationsOutput!
                                  .playersRecommendations!.length;
                          i++)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                "Number: ${data!.recommendations!.recommendationsOutput!.playersRecommendations![i].number}"),
                            Text(
                                "Position: ${data!.recommendations!.recommendationsOutput!.playersRecommendations![i].position}"),
                            Text(
                                "Status: ${data!.recommendations!.recommendationsOutput!.playersRecommendations![i].status}"),
                            const Divider(
                              color: AppColor.primaryColor,
                              endIndent: 40,
                              indent: 40,
                              thickness: 2,
                            ),
                          ],
                        ),
                      Gap(20.h),
                    ],
                  ),
                ),
                Text(
                  "Opponent Analysis",
                  style: AppTextStyle.textStyle30
                      .copyWith(color: AppColor.blackColor),
                  overflow: TextOverflow.ellipsis,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 30.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.r),
                    image: const DecorationImage(
                      image: AssetImage("assets/image/rectangle-profile.png"),
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Gap(10.h),
                      Text(
                        "Strengths",
                        style: AppTextStyle.textStyle30.copyWith(
                          fontSize: 25.sp,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      for (int i = 0;
                          i <
                              data!.opponentAnalysis!.opponentAnalysisIn!
                                  .strengths!.length;
                          i++)
                        Text(
                            "${i + 1} : ${data!.opponentAnalysis!.opponentAnalysisIn!.strengths![i]}"),
                      Gap(20.h),
                      Text(
                        "Weaknesses",
                        style: AppTextStyle.textStyle30.copyWith(
                          fontSize: 25.sp,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      for (int i = 0;
                          i <
                              data!.opponentAnalysis!.opponentAnalysisIn!
                                  .weaknesses!.length;
                          i++)
                        Text(
                            "${i + 1} : ${data!.opponentAnalysis!.opponentAnalysisIn!.weaknesses![i]}"),
                      Gap(20.h),
                      Text(
                        "Counter Strategies",
                        style: AppTextStyle.textStyle30.copyWith(
                          fontSize: 25.sp,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      for (int i = 0;
                          i <
                              data!.opponentAnalysis!.opponentAnalysisIn!
                                  .counterStrategies!.length;
                          i++)
                        Text(
                            "${i + 1} : ${data!.opponentAnalysis!.opponentAnalysisIn!.counterStrategies![i]}"),
                      Gap(20.h),
                    ],
                  ),
                ),
                Text(
                  "Training Suggestions",
                  style: AppTextStyle.textStyle30
                      .copyWith(color: AppColor.blackColor),
                  overflow: TextOverflow.ellipsis,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 30.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50.r),
                    image: const DecorationImage(
                      image: AssetImage("assets/image/rectangle-profile.png"),
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Gap(10.h),
                      Text(
                        "Team Training Session",
                        style: AppTextStyle.textStyle30.copyWith(
                          fontSize: 25.sp,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      Text(
                        "Team Training Session : ${data!.trainingSuggestions!.teamTrainingSession ?? ""}",
                      ),
                      Text(
                        "Worst 5 Players Individual Sessions",
                        style: AppTextStyle.textStyle30.copyWith(
                          fontSize: 25.sp,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                      for (int i = 0;
                          i <
                              data!.trainingSuggestions!
                                  .worst5PlayersIndividualSessions!.length;
                          i++)
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                "Player: ${data!.trainingSuggestions!.worst5PlayersIndividualSessions![i].player}"),
                            Text(
                                "Shirt Number: ${data!.trainingSuggestions!.worst5PlayersIndividualSessions![i].shirtNumber}"),
                            Text(
                                "Drill : ${data!.trainingSuggestions!.worst5PlayersIndividualSessions![i].drill}"),
                            const Divider(
                              color: AppColor.primaryColor,
                              endIndent: 40,
                              indent: 40,
                              thickness: 2,
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
