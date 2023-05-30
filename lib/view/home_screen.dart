import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:joke_task/controller/home_controller.dart';

import 'appbar.dart';
import 'bd_design.dart';
import 'custom_button.dart';
import 'drop_down_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final controller = Get.put(HomeController());
  String category = 'Any';
  String lang = 'en-English';

  var itemsCat = ['Any', 'Programming', 'Miscellaneous', 'Dark', 'Pun', 'Spooky', 'Christmas'];
  var itemsLan = [
    'en-English',
    'cs-CZech',
    'fr-French',
    'pt-Portuguese',
    'de-German',
    'es-Spanish',
  ];

  @override
  void initState() {
    () async {
      controller.isTwo.value=false;
      await controller.getJoke(category: 'Any', type: 'single', lang: "");
    }();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(alignment: Alignment.topCenter, children: [
        const BgDesign(),
        Column(
          children: [
            const AppBarMobile(),
            Container(
              padding: EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: Get.width,
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                              color: MediaQuery.of(context).size.width > 585
                                  ? Colors.black.withOpacity(0.1)
                                  : Colors.black.withOpacity(0.2),
                              blurRadius: 4,
                              offset: const Offset(0, 2))
                        ]),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        elevation: 0,
                        value: category,
                        icon: Icon(Icons.keyboard_arrow_down),
                        items: itemsCat.map((String items) {
                          return DropdownMenuItem(value: items, child: Text(items));
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            category = newValue!;
                            controller.getJoke(
                                category: category,
                                lang: lang.substring(0, 2) == 'en' ? "" : lang.substring(0, 2),
                                type: controller.isTwo.value?"twopart":"single");
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: Get.width,
                    margin: EdgeInsets.symmetric(horizontal: 10),
                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: [
                          BoxShadow(
                              color: MediaQuery.of(context).size.width > 585
                                  ? Colors.black.withOpacity(0.1)
                                  : Colors.black.withOpacity(0.2),
                              blurRadius: 4,
                              offset: const Offset(0, 2))
                        ]),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        elevation: 0,
                        value: lang,
                        icon: Icon(Icons.keyboard_arrow_down),
                        items: itemsLan.map((String items) {
                          return DropdownMenuItem(value: items, child: Text(items));
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            lang = newValue!;
                            controller.getJoke(
                                category: category,
                                type: controller.isTwo.value?"twopart":"single",
                                lang: lang.substring(0, 2) == 'en' ? "" : lang.substring(0, 2));
                          });
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          controller.isTwo.value = false;
                          controller.getJoke(
                              category: category,
                              type: controller.isTwo.value?"twopart":"single",
                              lang: lang.substring(0, 2) == 'en' ? "" : lang.substring(0, 2));
                        },
                        child: Container(
                          height: 25,
                          width: 25,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, border: Border.all(color: Colors.black)),
                          child: Obx(()=>
                          Icon(
                              Icons.circle,
                              size: 16,
                              color: controller.isTwo.value ? Colors.transparent : Colors.black,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Text("Single Part")
                    ],
                  ), SizedBox(width: 20),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          controller.isTwo.value = true;
                          controller.getJoke(
                              category: category,
                              type: controller.isTwo.value?"twopart":"single",
                              lang: lang.substring(0, 2) == 'en' ? "" : lang.substring(0, 2));
                        },
                        child: Container(
                          height: 25,
                          width: 25,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle, border: Border.all(color: Colors.black)),
                          child: Obx(()=>
                             Icon(
                              Icons.circle,
                              size: 16,
                              color: controller.isTwo.value ? Colors.black : Colors.transparent,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Text("Two Part")
                    ],
                  ),
                ],
              ),
            ),
            Spacer(),
            Container(
              height: Get.height / 3,
              width: Get.width,
              margin: EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        blurRadius: 4,
                        offset: const Offset(0, 2))
                  ]),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Obx(
                        () => controller.joke.value != ''
                            ? customSubTitle(title: controller.joke.value)
                            : customSubTitle(title: "Try later"),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Obx(
                            () => controller.isTwo.value
                            ? customSubTitle(title: controller.jokeSub.value,color: Colors.grey)
                            : customSubTitle(title: ""),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Spacer(),
            GestureDetector(
                onTap: () {
                  controller.getJoke(
                      category: category,
                      lang: lang.substring(0, 2) == 'en' ? "" : lang.substring(0, 2),
                      type: "single");
                  setState(() {});
                },
                child: const CustomButton(
                  text: "Go For Next",
                  horizontalPadding: 50,
                )),
            const SizedBox(height: 20),
          ],
        )
      ]),
    );
  }
}


