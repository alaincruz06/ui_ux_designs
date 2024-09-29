import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:ui_ux_designs/src/common/presentation/controllers/home_page_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomePageController>(
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(),
          body: ListView.builder(
            itemCount: controller.routes.length,
            itemBuilder: (context, index) => ListTile(
              leading: SvgPicture.asset(
                controller.routes[index].$1,
              ),
              title: Text(
                controller.routes[index].$2,
              ),
              onTap: () => controller.navigateToPages(index),
              trailing: const Icon(Icons.arrow_forward_ios),
            ),
          ),
        );
      },
    );
  }
}
