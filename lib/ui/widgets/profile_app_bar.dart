import 'package:flutter/material.dart';
import 'package:task_manager/ui/screen/update_profile_screen.dart';
import 'package:task_manager/ui/utility/app_colors.dart';

AppBar profileAppBar(context,[bool formUpdateProfile = false]) {
  return AppBar(
    backgroundColor: AppColors.themeColor,
    leading: GestureDetector(
      onTap: (){
        if(formUpdateProfile){
          return ;
        }
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => UpdateProfileScreen(),
          ),
        );
      },
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: CircleAvatar(),
      ),
    ),
    title: GestureDetector(
      onTap: (){
        if(formUpdateProfile){
          return ;
        }
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => UpdateProfileScreen(),
          ),
        );
      },
      child: const Column(
        children: [
          Text(
            "Subrata Singha",
            style: TextStyle(fontSize: 15),
          ),
          Text(
            "xxxxx@gmail.com",
            style: TextStyle(
                fontSize: 13, color: Colors.black, fontWeight: FontWeight.w500),
          ),
        ],
      ),
    ),
    actions: [
      IconButton(
        onPressed: () {},
        icon: const Icon(Icons.logout),
      ),
    ],
  );
}
