import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import '../../../data/models/dto/response.dart';
import '../../../data/models/response/newsapi.dart';
import '../../../data/repository/news_api_repository.dart';
import '../../../data/values/env.dart';
import 'package:timeago/timeago.dart' as timeago;



class SearchScreenController extends GetxController {
  //TODO: Implement SearchScreenController

  Timer? _debounce;

  void onSearchChanged(String value) {
    if (_debounce?.isActive ?? false) _debounce?.cancel();
    _debounce = Timer(const Duration(milliseconds: 500), () {
      debugPrint('Value called$value');
      q.value = value;
      newArticles.clear();
      firstLoad();
      isLoading.value=true;
      //isFirstLoad.value=true;
    });
  }

  /// Here we have declared ScrollController for detecting scroll more.
  late ScrollController Fcontroller;
  final count = 0.obs;
  var isFirstLoad=false.obs;
  var _page=1.obs;
  final pageSize=20;
  RxBool isWait=false.obs;

  RxBool isFirstLoadRunning = false.obs;
  /// Initially hasNextPage initially set true.
  RxBool hasNextPage = true.obs;
  /// isLoadMoreRunning initially set to false.
  RxBool isLoadMoreRunning = false.obs;
  /// Initially _post lists will be empty.

  // Future<void> getNewsList() async {
  //   try{
  //     isLoading(true);
  //     changeUrlFunction();
  //     response = await _appRepository.fetchNewsAPI(url.value);
  //     if (response?.error == null) {
  //       newArticles.value = response!.data!.articles!;
  //     }
  //   }
  //   finally{
  //     isLoading(false);
  //   }
  // }

  void debouncedSearch(String value){
    Timer(Duration(seconds: 2),(){
      q.value = value;
      debugPrint(
          'display value ->> ${value.toString()} ${DateFormat('hh:mm:ss').format(DateTime.now())}');
      newArticles.clear();
      firstLoad();
    });
  }

  Future<void> firstLoad() async {
    changeUrlFunction();
    isFirstLoadRunning.value = true;

    try {
      final response =  await _appRepository.fetchNewsAPI(url.value);
      if (response?.error == null) {
        newArticles.value = response!.data!.articles!;

        if(q.value.isEmpty==true){
          isFirstLoad.value=false;
        }else if(response.data?.totalResults==0){
          isFirstLoad.value=true;
        }

      }
    } finally {
      if(q.value.isEmpty==true){
        isFirstLoad.value=false;
      }
      isLoading.value=false;
      debugPrint('Something went wrong');
    }

    isFirstLoadRunning.value = false;
  }

  Future<void> loadMore() async {
    changeUrlFunction();
    if (hasNextPage.value == true &&
        isFirstLoadRunning.value == false &&
        isLoadMoreRunning.value == false &&
        Fcontroller.position.extentAfter < 300) {

      isLoadMoreRunning.value = true; // Display a progress indicator at the bottom

      _page.value += 1; // Increase page by 1

      /// Here, we are calling API.
      try {
        /// Here _page is always dynamic it will increase everytime when we are
        /// calling _loadMore function.
        final response =  await _appRepository.fetchNewsAPI(url.value);
        /// If fetchedPosts is not empty then we will add data in posts.

        if (response?.error == null) {
          newArticles.addAll(response!.data!.articles!);
        }else{
          hasNextPage.value = false;
        }
      } finally {
        isLoading.value=false;
        debugPrint('Something went wrong');
      }
      /// At the end, when loading done isLoadMoreRunning set to false.
      isLoadMoreRunning.value = false;

      debugPrint('articles length >>>${newArticles.value.length.toString()}');
    }
  }

  @override
  void onInit() {
    super.onInit();
    firstLoad();
    /// Controller will here detect scroll and call _loadMore when there is
    /// scroll detected.
    Fcontroller = ScrollController()..addListener(loadMore);
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    newArticles.clear();
    _debounce?.cancel();
    //debugPrint(newArticles.value.length.toString());
    debugPrint('OnClose is called');
    update();
  }

  //Querry
  RxString q = ''.obs;
  RepoResponse<NewsApiResponse>? response;

  var url = ''.obs;
  var isLoading=true.obs;
  var isDataProcessing=false.obs;

  /// Pagination
  ScrollController scrollController = ScrollController();
  var isMoreDataAvailable = true.obs;


  void increment() => count.value++;
  final NewsAppRepository _appRepository = NewsAppRepository();
  RxList<Articles> newArticles = <Articles>[].obs;

  String time_ago(DateTime dt) {
    return timeago.format(dt, allowFromNow: true, locale: 'en');
  }

  /// Function to change Url
  void changeUrlFunction() async {
      url.value =
      '${Env.baseSearchLink}$q&sortBy=publishedAt&page=${_page}&pageSize=${pageSize}&apiKey=${Env.apikey}';
    }

}
