import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../database/sharedpref.dart';
import '../util/change_pin_dialog.dart';
import '../util/settings_tile.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  SharedPref sp = SharedPref();
  void onPressChangePin() {
    showDialog(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) {
        return ChangePinDialog(
          onSave: () => Navigator.of(context).pop(),
          onCancel: () => Navigator.of(context).pop(),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SettingsTile(
          tileTile: "Change Theme",
          iconImg: Get.isDarkMode ? Icons.sunny : Icons.mode_night,
          iconText: Get.isDarkMode ? "Light mode" : "Dark Mode",
          onPressed: sp.changeTheme,
        ),
        SettingsTile(
          tileTile: "Change Pin",
          iconText: "PIN",
          iconImg: Icons.pin,
          onPressed: onPressChangePin,
        ),
      ],
    );
  }
}
