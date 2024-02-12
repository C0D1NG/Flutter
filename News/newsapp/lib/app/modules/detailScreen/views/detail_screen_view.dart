import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:starter/app/theme/app_colors.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:path/path.dart' as p;
import '../../../data/models/response/newsapi.dart';
import '../controllers/detail_screen_controller.dart';

class DetailScreenView extends GetView<DetailScreenController> {
  const DetailScreenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: InkWell(child: const Icon(Icons.arrow_back_ios),onTap: (){Get.back();}),
          centerTitle: true,
          backgroundColor: AppColors.primaryColor,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: <Widget>[
                (Get.arguments as Articles).urlToImage == null ? Image.network(
                    'https://avatar.net.in/Content/img/no-image-found.png',
                fit: BoxFit.fill,
                  height: 320,
                ):
                Image.network(
                  (Get.arguments as Articles).urlToImage.toString(),
                  fit: BoxFit.cover,
                  height: 320,
                ),
                Container(
                  height: 320,
                  width: Get.width,
                  padding: const EdgeInsets.all(5.0),
                  alignment: Alignment.bottomCenter,
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: <Color>[
                        Colors.black12,
                        Colors.black26,
                        Colors.black
                      ],
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10, right: 10,bottom: 10),
                    child: Text(
                      (Get.arguments as Articles).title.toString(),
                      maxLines: 2,
                      style:
                      const TextStyle(color: Colors.white, fontSize: 16.0,fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      (Get.arguments as Articles).source!.name.toString(),
                      style: const TextStyle(
                        color: Colors.black54,
                          fontSize: 18, fontWeight: FontWeight.bold,fontStyle: FontStyle.italic),
                    ),
                   const SizedBox(height: 5,),

                    (Get.arguments as Articles).publishedAt == null
                        ? Text(
                      DateFormat('d MMMM, y').format(DateTime.now()),
                      style: const TextStyle(color: Colors.grey, fontSize: 10,fontWeight: FontWeight.bold),
                    )
                        : Text(
                      DateFormat('d MMM, y').format(DateTime.parse(
                          (Get.arguments as Articles)
                              .publishedAt
                              .toString())) + ' at ' +
                          DateFormat('h:m a').format(DateTime.parse(
                              (Get.arguments as Articles)
                                  .publishedAt
                                  .toString())),
                      style: const TextStyle(color: Colors.grey, fontSize: 10,fontWeight: FontWeight.bold),),
                    const SizedBox(height: 20,),

                    // Text((Get.arguments as Articles).content.toString(),maxLines: 10,)
                    (Get.arguments as Articles).content == null
                        ? const Text('Content is Empty')
                        : Text((Get.arguments as Articles).description.toString(),style: const TextStyle(fontWeight: FontWeight.normal),),
                    const SizedBox(height: 10,),
                    InkWell(
                      child: const Text('See full story >',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.blueAccent)),
                      onTap: () async {
                        var url = (Get.arguments as Articles).url.toString();
                        if (await canLaunch(url)) {
                          await launch(url);
                        } else {
                          throw 'Could not launch $url';
                        }
                      },
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
