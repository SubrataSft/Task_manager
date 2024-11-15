import 'package:flutter/material.dart';
import 'package:task_manager/enities/entities.dart';

class FootballScoreCard extends StatelessWidget {
  const FootballScoreCard({
    super.key, required this.football,
  });

  final Football football;

  @override
  Widget build(BuildContext context) {
    return  Card(
      elevation: 8,
      margin: EdgeInsets.symmetric(horizontal: 16,vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _buildTeam(football.team1Name,football.team1Score),
          Text("vs"),
          _buildTeam(football.team2Name,football.team2Score),
        ],
      ),
    );
  }

  Widget _buildTeam(String teamName, int teamScore) {
    return Column(
          children: [
            Text(
              teamScore.toString(),
              style: TextStyle(
                  fontSize: 25, fontWeight: FontWeight.w600),
            ),
            Text(
              teamName,
              style: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.w500),
            ),
          ],
        );
  }
}
