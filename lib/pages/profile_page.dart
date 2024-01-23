import 'package:flutter/material.dart';
import 'package:flutter_app_1/components/toolbar.dart';
import 'package:flutter_app_1/components/user_avatar.dart';
import 'package:flutter_app_1/config/app_routes.dart';
import 'package:flutter_app_1/styles/app_text.dart';

enum ProfileMenue { edit, logout }

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: Toolbar(
        title: 'Profile',
        actions: [
          PopupMenuButton<ProfileMenue>(onSelected: (value) {
            switch (value) {
              case ProfileMenue.edit:
                Navigator.of(context).pushNamed(AppRoutes.editProfile);
                break;
              case ProfileMenue.logout:
                print('Logout');
                break;
              default:
            }
          }, itemBuilder: (context) {
            return [
              const PopupMenuItem(
                value: ProfileMenue.edit,
                child: Text('Edit'),
              ),
              const PopupMenuItem(
                value: ProfileMenue.logout,
                child: Text('Log Out'),
              ),
            ];
          })
        ],
      ),
      body: const Column(
        children: [
          UserAvatar(size: 90,),
          SizedBox(
            height: 24,
          ),
          Text(
            'Jayed Hasan',
            style: AppText.header2,
          ),
          SizedBox(
            height: 12,
          ),
          Text(
            'Dhaka',
            style: AppText.subtitle3,
          ),
          SizedBox(
            height: 24,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  Text(
                    '472',
                    style: AppText.header2,
                  ),
                  Text('followers'),
                ],
              ),
              Column(
                children: [
                  Text(
                    '119',
                    style: AppText.header2,
                  ),
                  Text('Posts'),
                ],
              ),
              Column(
                children: [
                  Text(
                    '860',
                    style: AppText.header2,
                  ),
                  Text('Followers'),
                ],
              ),
            ],
          ),
          Divider(
            thickness: 2,
            height: 40,
          ),
        ],
      ),
    );
  }
}
