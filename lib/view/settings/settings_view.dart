import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_player/common/color_extension.dart';
import 'package:music_player/common_widget/icon_text_row.dart';
import 'package:music_player/view_model/splash_view_model.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: TColor.bg,
        elevation: 0,
        leading: IconButton(
          icon: Image.asset(
            "assets/img/menu.png",
            height: 25,
            width: 25,
            fit: BoxFit.contain,
          ),
          onPressed: () {
            Get.find<SplashViewModel>().openDrawer();
          },
        ),
        title: Text(
          "Settings",
          style: TextStyle(
            color: TColor.primaryText80,
            fontSize: 17,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
      body: ListView(
        children: [
          IconTextRow(
            title: "Display",
            icon: "assets/img/s_display.png",
            onTap: () {},
          ),
          IconTextRow(
            title: "Audio",
            icon: "assets/img/s_audio.png",
            onTap: () {},
          ),
          IconTextRow(
            title: "Headset",
            icon: "assets/img/s_headset.png",
            onTap: () {},
          ),
          IconTextRow(
            title: "Lock Screen",
            icon: "assets/img/s_lock_screen.png",
            onTap: () {},
          ),
          IconTextRow(
            title: "Advanced",
            icon: "assets/img/s_menu.png",
            onTap: () {},
          ),
          IconTextRow(
            title: "Other",
            icon: "assets/img/s_other.png",
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
