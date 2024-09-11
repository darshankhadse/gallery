import 'package:animated_hint_textfield/animated_hint_textfield.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import 'full_screen_image.dart';

class HomeView extends GetView<HomeController> {
  final HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AnimatedTextField(
                animationType: Animationtype.slide,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  contentPadding: const EdgeInsets.all(12),
                ),
                hintTexts: const [
                  'Search "Nature"',
                  'Search "Sports"',
                  'Search "Science"',
                  'Search "Fashion"',
                ],
                onChanged: (value)=>controller.query.value = value,
              )
            ),
          ],
        )
      ),
      body: Obx(() {
        return NotificationListener<ScrollNotification>(
          onNotification: (scrollInfo) {
            if (scrollInfo.metrics.pixels == scrollInfo.metrics.maxScrollExtent &&
                !controller.isLoading.value) {
              controller.fetchImages(controller.query.value);
              return true;
            }
            return false;
          },
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: (MediaQuery.of(context).size.width ~/ 150).toInt(),
                crossAxisSpacing: 8,
                mainAxisSpacing: 8,
                childAspectRatio: 0.7,
              ),
              itemCount: controller.images.length,
              itemBuilder: (context, index) {
                final image = controller.images[index];
                return GestureDetector(
                  onTap: () => Get.to(() => FullScreenImage(image: image)),
                  child: Column(
                    children: [
                      Expanded(
                        child: CachedNetworkImage(
                          imageUrl: image.imageUrl,
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(height: 5,),
                      Text('Likes: ${image.likes}'),
                      Text('Views: ${image.views}'),
                    ],
                  ),
                );
              },
            ),
          ),
        );
      }),
    );
  }
}
