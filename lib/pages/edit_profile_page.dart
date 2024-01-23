import 'package:flutter/material.dart';
import 'package:flutter_app_1/components/app_text_field.dart';
import 'package:flutter_app_1/components/toolbar.dart';
import 'package:flutter_app_1/components/user_avatar.dart';

enum Gender {
  none,
  male,
  female,
  other;
}

class EditProfilePage extends StatefulWidget {
  const EditProfilePage({super.key});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  var gender = Gender.none;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const Toolbar(title: 'Edit Profile'),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              const Stack(
                children: [
                  UserAvatar(
                    size: 120,
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Icon(Icons.edit),
                  ),
                ],
              ),
              const SizedBox(
                height: 50,
              ),
              const AppTextField(hint: 'First Name'),
              const SizedBox(
                height: 12,
              ),
              const AppTextField(hint: 'Last Name'),
              const SizedBox(
                height: 12,
              ),
              const AppTextField(hint: 'Phone Number'),
              const SizedBox(
                height: 12,
              ),
              const AppTextField(hint: 'Location'),
              const SizedBox(
                height: 12,
              ),
              const AppTextField(hint: 'Birthday'),
              const SizedBox(
                height: 12,
              ),

              
              const Text('Gender'),
              RadioListTile(
                  title: const Text('male'),
                  value: Gender.male,
                  groupValue: gender,
                  onChanged: (value) {
                    setState(() {
                      gender = Gender.male;
                    });
                  }),
              RadioListTile(
                  title: const Text('female'),
                  value: Gender.female,
                  groupValue: gender,
                  onChanged: (value) {
                    setState(() {
                      gender = Gender.female;
                    });
                  }),
              RadioListTile(
                  title: const Text('other'),
                  value: Gender.other,
                  groupValue: gender,
                  onChanged: (value) {
                    setState(() {
                      gender = Gender.other;
                    });
                  })
            ],
          ),
        ),
      ),
    );
  }
}
