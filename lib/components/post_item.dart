import 'package:flutter/material.dart';
import 'package:flutter_app_1/styles/app_text.dart';

class PostItem extends StatelessWidget {
  final String user;
  const PostItem({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          Row(
            children: [
              Image.asset(
                'assets/temp/messi.png',
                width: 40,
                height: 40,
              ),
              const SizedBox(
                width: 16,
              ),
              Text(
                user,
                style: AppText.subtitle3,
              ),
            ],
          ),
          Image.asset('assets/temp/post1.jpeg'),
          const SizedBox(
            height: 12,
          ),
          const Text(
            'The sky looks beatiful, Wonderous night',
            style: AppText.subtitle3,
          ),
        ],
      ),
    );
  }
}
