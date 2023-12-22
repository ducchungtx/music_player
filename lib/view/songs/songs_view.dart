import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:music_player/common/color_extension.dart';
import 'package:music_player/view_model/splash_view_model.dart';

class SongsView extends StatefulWidget {
  const SongsView({super.key});

  @override
  State<SongsView> createState() => _SongsViewState();
}

class _SongsViewState extends State<SongsView>
    with SingleTickerProviderStateMixin {
  TabController? controller;
  int selectTab = 0;

  @override
  void initState() {
    controller = TabController(length: 5, vsync: this);
    controller?.addListener(() {
      selectTab = controller?.index ?? 0;
    });
    super.initState();
  }

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
          "Songs",
          style: TextStyle(
            color: TColor.primaryText80,
            fontSize: 17,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          IconButton(
            icon: Image.asset(
              "assets/img/search.png",
              height: 20,
              width: 20,
              fit: BoxFit.contain,
              color: TColor.primaryText35,
            ),
            onPressed: () {
              Get.find<SplashViewModel>().openDrawer();
            },
          ),
        ],
      ),
      body: Column(children: [
        SizedBox(
          height: kToolbarHeight - 15,
          child: TabBar(
            controller: controller,
            indicatorColor: TColor.focus,
            indicatorPadding: const EdgeInsets.symmetric(horizontal: 20),
            isScrollable: true,
            labelColor: TColor.focus,
            labelStyle: TextStyle(
                color: TColor.focus, fontSize: 15, fontWeight: FontWeight.w600),
            unselectedLabelColor: TColor.primaryText80,
            unselectedLabelStyle: TextStyle(
                color: TColor.primaryText80,
                fontSize: 15,
                fontWeight: FontWeight.w600),
            tabs: const [
              Tab(text: "All Songs"),
              Tab(text: "Playlists"),
              Tab(text: "Albums"),
              Tab(text: "Artists"),
              Tab(text: "Genres"),
            ],
          ),
        )
      ]),
    );
  }
}
