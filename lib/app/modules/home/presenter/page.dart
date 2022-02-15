import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

import 'controller.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Home page")),
      body: Obx(
        () => controller.isLoading.value
            ? const Center(child: CircularProgressIndicator())
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: controller.trackList.length,
                      itemBuilder: (context, index) => ListTile(
                        title: Text(controller.trackList[index].name),
                      ),
                    ),
                  ),
                  ElevatedButton(
                      onPressed: () {
                        controller.getRandomTrackByGenre('pop');
                      },
                      child: const Text("get random track by genre")),
                ],
              ),
      ),
    );
  }
}
