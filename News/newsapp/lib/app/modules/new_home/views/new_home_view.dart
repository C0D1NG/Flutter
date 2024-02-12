import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:starter/app/app.dart';
import 'package:starter/app/data/models/response/newsapi.dart';
import 'package:starter/app/modules/detailScreen/views/detail_screen_view.dart';
import 'package:starter/app/modules/home/views/home_view.dart';
import 'package:starter/app/modules/home_screen/views/home_screen_view.dart';
import 'package:starter/app/modules/search_screen/views/search_screen_view.dart';
import 'package:starter/app/routes/app_pages.dart';
import 'package:starter/app/theme/app_colors.dart';
import 'package:starter/widgets/buttons/primary_filled_button.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:intl/intl.dart';
import '../../network_error/views/network_error_view.dart';
import '../controllers/new_home_controller.dart';
import 'package:badges/badges.dart';

class NewHomeView extends GetView<NewHomeController> {
  NewHomeView({Key? key}) : super(key: key);

  //InternetConnectionChecker internetConnectionChecker = Get.put(InternetConnectionChecker());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.SecondaryColor,
      appBar: AppBar(
        backgroundColor: AppColors.primaryColor,
        leading: Padding(
          padding: const EdgeInsets.only(right: 10, bottom: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: const [
              Text(
                'MyNEWS',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              )
            ],
          ),
        ),
        leadingWidth: 100,
        actions: [
          InkWell(
            onTap: () {
              controller.isFilter.value = false;
              controller.changeUrlFunction();
              showModalBottomSheet(
                  context: context,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0),
                  ),
                  builder: (context) {
                    return bottomSheet();
                  });
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(right: 20,top: 10),
                  child: Text(
                    'LOCATION',
                    style: TextStyle(fontSize: 12),
                  ),
                ),
                Row(
                  children: [
                    const Icon(
                      Icons.location_on,
                      size: 14,
                    ),
                    Obx(() => Text(
                      controller.c.value,
                      // style: const TextStyle(fontSize: 14),
                    )),
                  ],
                )
              ],
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          debugPrint(controller.articles.toString());
          controller.sourceList();
          Future<void> bottomSheetAwaitClose = showModalBottomSheet(
              context: context,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(5.0),
              ),
              builder: (context) {
                return bottomSheetFilter();
              });

          bottomSheetAwaitClose
              .then((void value) => controller.isFilterCheckbox());
        },
        backgroundColor: AppColors.primaryColor,
        child: Obx(
          () => controller.isFilter.value == true &&
                  controller.isFilterBottomSheetValue.value
              ? Badge(
                  child: const Icon(
                    Icons.filter_alt_outlined,
                    size: 35,
                  ),
                  badgeColor: Colors.redAccent,
                  toAnimate: true,
                  position: BadgePosition.bottomEnd(bottom: 26, end: -2),
                )
              : const Icon(
                  Icons.filter_alt_outlined,
                  size: 35,
                ),
        ),
      ),
      body: Obx(() => controller.connectionStatus == 0
          ? Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.signal_wifi_connected_no_internet_4,
                    color: Colors.grey,
                    size: 200,
                  ),
                  const Text(
                    'No Internet Connection!',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                        fontFamily: 'helveticaneue'),
                  ),
                  Padding(
                      padding: const EdgeInsets.all(20),
                      child: PrimaryFilledButton(
                        onTap: () {
                          controller.firstLoad();
                        },
                        text: 'Try Again',
                      ))
                ],
              ),
            )
          : controller.isLoading.value == true
              ? const Center(child: CircularProgressIndicator())
              : Column(
                  children: [
                    GestureDetector(
                      onTap: () {
                        Get.to(SearchScreenView(),
                            transition: Transition.fadeIn);
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(
                            top: 20.0, left: 20, right: 20, bottom: 10),
                        child: Container(
                            padding: const EdgeInsets.all(15),
                            width: double.infinity,
                            decoration: BoxDecoration(
                                color: Colors.grey.shade200,
                                borderRadius: const BorderRadius.all(
                                    Radius.circular(10))),
                            child: Row(
                              children: const [
                                Text(
                                  'Search for news, topics',
                                  style: TextStyle(
                                      fontSize: 16, color: Colors.grey),
                                ),
                                Spacer(),
                                Icon(
                                  Icons.search,
                                  color: Colors.grey,
                                  size: 20,
                                )
                              ],
                            )),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Text(
                            'Top Headlines',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),
                          ),
                        ),
                        Row(
                          children: [
                            const Text(
                              'Sort:',
                              style: TextStyle(color: Colors.grey),
                            ),

                            Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Obx(() => DropdownButtonHideUnderline(child: DropdownButton2(items:
                              controller.sortList
                                  .map((item) => DropdownMenuItem<String>(
                                value: item,
                                child: Padding(
                                  padding: EdgeInsets.only(left: 8),
                                  child: Text(
                                    item,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                              ))
                                  .toList(),
                                itemPadding: EdgeInsets.zero,
                                hint:const Text('Sort'),
                                dropdownPadding:const EdgeInsets.only(left: 0,right: 0,top: 0,bottom: 0),
                                value: controller.selectedDrowpdown.value,
                                scrollbarRadius:const Radius.circular(16),
                                onChanged: (value){
                                  controller.shouldBeNewest.value=value.toString().toLowerCase() ==
                                      'Newest'.toLowerCase()
                                      ? true
                                      : false;
                                  controller
                                      .setSelected(value.toString());
                                  controller.update();
                                  controller.sortArticles(
                                      value.toString().toLowerCase() ==
                                          'Newest'.toLowerCase()
                                          ? true
                                          : false);
                                },
                                dropdownDecoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(6),
                                ),

                              ),)
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Obx(() =>
                            // controller.connectionStatus.toString()=='none'?const Center(child:
                            //   Icon(Icons.signal_wifi_connected_no_internet_4),):
                            RefreshIndicator(
                              onRefresh: () {
                                controller.page.value = 1;
                                return controller.firstLoad();
                              },
                              child: ListView.builder(
                                controller: controller.Fcontroller,
                                itemCount: controller.newArticles.length,
                                padding: const EdgeInsets.all(10),
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {
                                      Get.to(const DetailScreenView(),
                                          arguments:
                                              controller.newArticles[index]);
                                    },
                                    child: Container(
                                      height: Get.height * .18,
                                      margin: const EdgeInsets.only(bottom: 16),
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        boxShadow: [
                                          BoxShadow(
                                            color:
                                                Colors.black.withOpacity(0.15),
                                            blurRadius: 4,
                                            spreadRadius: .2,
                                            offset: const Offset(4, 1),
                                          ),
                                        ],
                                        borderRadius: const BorderRadius.all(
                                          Radius.circular(4),
                                        ),
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(10),
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Expanded(
                                                      child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                          controller
                                                                      .newArticles[
                                                                          index]
                                                                      .source
                                                                      ?.name ==
                                                                  null
                                                              ? "No Source found"
                                                              : controller
                                                                  .newArticles[
                                                                      index]
                                                                  .source!
                                                                  .name
                                                                  .toString(),
                                                          maxLines: 1,
                                                          style: const TextStyle(
                                                              color: Colors
                                                                  .black54,
                                                              fontSize: 16,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontStyle:
                                                                  FontStyle
                                                                      .italic)),
                                                      const SizedBox(
                                                        height: 5,
                                                      ),
                                                      Expanded(
                                                        child: Text(
                                                          controller
                                                                      .newArticles[
                                                                          index]
                                                                      .content ==
                                                                  null
                                                              ? "No Data Fetched"
                                                              : controller
                                                                  .newArticles[
                                                                      index]
                                                                  .description
                                                                  .toString(),
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          maxLines: 3,
                                                        ),
                                                      )
                                                      //  ),
                                                    ],
                                                  )),
                                                  controller.newArticles[index]
                                                              .publishedAt ==
                                                          null
                                                      ? const Text('No Time')
                                                      : Text(
                                                          controller.time_ago(DateTime
                                                              .parse(controller
                                                                  .newArticles[
                                                                      index]
                                                                  .publishedAt
                                                                  .toString())),
                                                          style:
                                                              const TextStyle(
                                                                  color: Colors
                                                                      .grey,
                                                                  fontSize: 12),
                                                        )
                                                ],
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 10,
                                            ),
                                            controller.newArticles[index]
                                                        .urlToImage ==
                                                    null
                                                ? Container(
                                                    color: Colors.grey.shade100,
                                                    height: Get.height * .20,
                                                    width: Get.width * .35,
                                                    child: const Icon(
                                                      Icons.image_not_supported,
                                                      color: Colors.grey,
                                                      size: 100,
                                                    ),
                                                  )
                                                : ClipRRect(
                                                    child: Image.network(
                                                      controller
                                                          .newArticles[index]
                                                          .urlToImage
                                                          .toString(),
                                                      fit: BoxFit.cover,
                                                      height: Get.height * .20,
                                                      width: Get.width * .35,
                                                      errorBuilder:
                                                          (_, __, ___) {
                                                        return Container(
                                                          color: Colors
                                                              .grey.shade100,
                                                          height:
                                                              Get.height * .20,
                                                          width:
                                                              Get.width * .35,
                                                          child: const Icon(
                                                              Icons
                                                                  .image_not_supported,
                                                              size: 100,
                                                              color:
                                                                  Colors.grey),
                                                        );
                                                      },
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8.0),
                                                  )
                                          ],
                                        ),
                                      ),
                                    ),
                                  );
                                },
                              ),
                            )),
                      ),
                    ),
                  ],
                )),
    );
  }

  Widget bottomSheet() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10),
      child: Obx(
        () => Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 6,
            ),
            Center(
              child: Container(
                height: 6,
                width: Get.width * 0.1,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.grey.shade400,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'Choose your location',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.black54),
            ),
            Divider(
              height: 30,
              color: Colors.grey[800],
            ),
            Expanded(
              child: ListView(
                children: [
                  RadioListTile(
                    title: const Text("India"),
                    value: 'India',
                    controlAffinity: ListTileControlAffinity.trailing,
                    groupValue: controller.initCountry.value,
                    activeColor: AppColors.primaryColor,
                    onChanged: (value) {
                      controller.initCountry.value = value.toString();
                    },
                  ),
                  RadioListTile(
                    title: const Text("USA"),
                    value: 'USA',
                    controlAffinity: ListTileControlAffinity.trailing,
                    groupValue: controller.initCountry.value,
                    activeColor: AppColors.primaryColor,
                    onChanged: (value) {
                      controller.initCountry.value = value.toString();
                    },
                  ),
                  RadioListTile(
                    title: const Text("Australia"),
                    value: 'Australia',
                    controlAffinity: ListTileControlAffinity.trailing,
                    groupValue: controller.initCountry.value,
                    activeColor: AppColors.primaryColor,
                    onChanged: (value) {
                      controller.initCountry.value = value.toString();
                    },
                  ),
                  RadioListTile(
                    title: const Text("Brazil"),
                    value: 'Brazil',
                    controlAffinity: ListTileControlAffinity.trailing,
                    groupValue: controller.initCountry.value,
                    activeColor: AppColors.primaryColor,
                    onChanged: (value) {
                      controller.initCountry.value = value.toString();
                    },
                  ),
                  RadioListTile(
                    title: const Text("England"),
                    value: 'England',
                    activeColor: AppColors.primaryColor,
                    controlAffinity: ListTileControlAffinity.trailing,
                    groupValue: controller.initCountry.value,
                    onChanged: (value) {
                      controller.initCountry.value = value.toString();
                    },
                  ),
                  RadioListTile(
                    title: const Text("Sweden"),
                    value: 'Sweden',
                    activeColor: AppColors.primaryColor,
                    controlAffinity: ListTileControlAffinity.trailing,
                    groupValue: controller.initCountry.value,
                    onChanged: (value) {
                      controller.initCountry.value = value.toString();
                    },
                  ),
                ],
              ),
            ),
            /*const Spacer(),*/
            Center(
                child: SizedBox(
                  height: 50,
                  width: 150,
                  child: ElevatedButton(
                    child: const Text('Apply',style: TextStyle(fontSize: 16),),
                   style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primaryColor,
                      elevation: 10,
                      surfaceTintColor: Colors.blueAccent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8)
                      ),
                      side: const BorderSide(
                          width: 2,
                          color: Colors.blueAccent
                      )
                  ),
                      onPressed: () async {
                        // print(controller.getCountry());
                        controller.page.value = 1;
                        controller.c.value = controller.initCountry.value;
                        controller.displayCountryCode();
                        // print("CountryCode Here ===>>> ${controller.countryCode}");
                        controller.firstLoad();
                        Get.back();
                      }, ),
                ),
            ),
            const SizedBox(height: 10,)
          ],
        ),
      ),
    );
  }

  // Bottom Sheet for action button
  Widget bottomSheetFilter() {
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 5,
          ),
          Center(
            child: Container(
              height: 6,
              width: Get.width * 0.1,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.grey.shade400,
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 10, top: 10),
            child: Text(
              'Filter by sources',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.black87),
            ),
          ),
          Divider(
            height: 30,
            color: Colors.grey[800],
          ),
          Expanded(
              child: ListView.builder(
                  itemCount: controller.sources.length,
                  itemBuilder: (context, index) {
                    return Obx(() => InkWell(
                      onTap: (){
                        controller.ischeck[index] =
                        !controller.ischeck[index];
                      },
                      child: ListTile(
                          trailing: controller.ischeck[index]
                                  ? const Icon(
                                      Icons.check_box_outlined,
                                      color: AppColors.primaryColor,
                                    )
                                  : const Icon(Icons.check_box_outline_blank),
                          title: controller.ischeck[index] == false
                              ? Text(
                                  controller.sources.elementAt(index).toString(),
                                )
                              : Text(
                                  controller.sources.elementAt(index).toString(),
                                  style: const TextStyle(
                                     color: Colors.blueAccent,),
                                )),
                    ));
                  })),
          const SizedBox(
            height: 20,
          ),
        // GestureDetector(
        //     onTap: (){
        //       print("Container clicked");
        //     },
        //     child:  Container(
        //       width:200,
        //       padding: new EdgeInsets.fromLTRB(20.0, 40.0, 20.0, 40.0),
        //       color: AppColors.primaryColor,
        //       child: new Column(
        //           children: [
        //             Text("Apply Filter",style: TextStyle(color: Colors.white,fontSize: 18),),
        //           ]
        //       ),
        //     )
        // ),

          Center(
            child: SizedBox(
              height: 50,
              width: 150,
              child: ElevatedButton(
                child: const Text('Apply Filter',style: TextStyle(fontSize: 16),),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primaryColor,
                  elevation: 10,
                  surfaceTintColor: Colors.blueAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)
                  ),
                  side: const BorderSide(
                    width: 2,
                    color: Colors.blueAccent
                  )
                ),
                onPressed: () {
                  controller.page.value = 1;
                  controller.filterByNews();
                  if (controller.sourceStringlength() > 0) {
                    controller.isFilter.value = true;
                    controller.firstLoad();
                    controller.isFilterCheckbox();
                    Get.back();
                  } else {
                    Get.snackbar('Alert', 'Select any one option',
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: Colors.grey);
                  }
                },

              ),
            ),
          )
        ],
      ),
    );
  }
}
