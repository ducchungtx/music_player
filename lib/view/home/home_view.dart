import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_player/view_model/home_view_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final homeVM = Get.put(HomeViewModel());

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
