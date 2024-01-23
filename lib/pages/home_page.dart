import 'package:flutter/material.dart';
import 'package:flutter_app_1/components/post_item.dart';
import 'package:flutter_app_1/components/toolbar.dart';
import 'package:flutter_svg/svg.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final users = mockUsersFromServer();
    return Scaffold(
      appBar: Toolbar(title: '5minuteflutter', actions: [
        IconButton(onPressed: () {
          
        }, icon: SvgPicture.asset('assets/svg/ic_location.svg', height: 40, width: 40,))
        ],),

      body: ListView.separated(
        itemBuilder: (context, index) {
          return PostItem(user: users[index]);
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(height: 24,);
        },
        itemCount: users.length,
      )
    );
  }

  List<String> mockUsersFromServer() {
    List<String> users = [];
    for (var i = 0; i < 100; i++) {
      users.add('User number $i');
    }
    return users;
  }
}
