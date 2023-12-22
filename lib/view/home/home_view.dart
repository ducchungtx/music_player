import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_player/common/color_extension.dart';
import 'package:music_player/common_widget/playlist_cell.dart';
import 'package:music_player/common_widget/recommended_cell.dart';
import 'package:music_player/common_widget/songs_row.dart';
import 'package:music_player/common_widget/title_section.dart';
import 'package:music_player/common_widget/view_all_section.dart';
import 'package:music_player/view_model/home_view_model.dart';
import 'package:music_player/view_model/splash_view_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final homeVM = Get.put(HomeViewModel());

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
        title: Row(
          children: [
            Expanded(
              child: Container(
                height: 38.0,
                decoration: BoxDecoration(
                  color: const Color(0xff292E4B),
                  borderRadius: BorderRadius.circular(19.0),
                ),
                child: TextField(
                  controller: homeVM.txtSearch.value,
                  decoration: InputDecoration(
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(horizontal: 20),
                    prefixIcon: Container(
                      margin: const EdgeInsets.only(left: 20),
                      alignment: Alignment.centerLeft,
                      width: 30.0,
                      child: Image.asset(
                        "assets/img/search.png",
                        width: 20,
                        height: 20,
                        fit: BoxFit.contain,
                        color: TColor.primaryText28,
                      ),
                    ),
                    hintText: "Search album song",
                    hintStyle: TextStyle(
                      color: TColor.primaryText28,
                      fontSize: 13.0,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const TitleSection(title: "Hot Recommended"),
            SizedBox(
              height: 193.0,
              child: ListView.builder(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  var mObj = homeVM.hostRecommendedArr[index];
                  return RecommendedCell(mObj: mObj);
                },
                itemCount: homeVM.hostRecommendedArr.length,
              ),
            ),
            Divider(
              color: Colors.white.withOpacity(0.07),
              indent: 20,
              endIndent: 20,
            ),
            ViewAllSection(title: "Playlist", onPressed: () {}),
            SizedBox(
              height: 178.0,
              child: ListView.builder(
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  var mObj = homeVM.playListArr[index];
                  return PlaylistCell(mObj: mObj);
                },
                itemCount: homeVM.playListArr.length,
              ),
            ),
            Divider(
              color: Colors.white.withOpacity(0.07),
              indent: 20,
              endIndent: 20,
            ),
            ViewAllSection(title: "Recently Played", onPressed: () {}),
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(horizontal: 10),
              itemCount: homeVM.recentlyPlayedArr.length,
              itemBuilder: (context, index) {
                var sObj = homeVM.recentlyPlayedArr[index];
                return SongsRow(
                  sObj: sObj,
                  onPressed: () {},
                  onPressedPlay: () {},
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
