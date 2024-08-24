import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:app/controller/newsController.dart';
import 'package:app/model/newsModels.dart';
import 'package:app/views/general.dart';
import 'package:app/views/sport.dart';
import 'package:app/views/technology.dart';

import 'views/bussiness.dart';

class HomePage extends GetWidget {
  final NewsController _controller = Get.put(NewsController());

  final List<BottomNavigationBarItem> _list = [
    const BottomNavigationBarItem(
      icon: Icon(Icons.home),
      label: "General",
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.sports),
      label: "Sports",
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.computer_outlined),
      label: "Technology",
    ),
    const BottomNavigationBarItem(
      icon: Icon(Icons.business),
      label: "Business",
    ),
  ];
  final List<Widget> _show = [
    General(),
    Sport(),
    Tech(),
    Bussiness(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => _show[_controller.currentIndex.value],
      ),
      bottomNavigationBar: Obx(
        () => BottomNavigationBar(
          items: _list,
          selectedItemColor: Colors.blueAccent,
          unselectedItemColor: Colors.grey,
          currentIndex: _controller.currentIndex.value,
          onTap: (val) {
            _controller.currentIndex.value = val;
          },
        ),
      ),
    );
  }
}
