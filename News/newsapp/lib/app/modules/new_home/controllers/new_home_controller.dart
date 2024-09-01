import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:intl/intl.dart';
import 'package:starter/app/data/models/dto/filter.dart';
import 'dart:developer' as developer;
import 'package:starter/app/data/models/response/newsapi.dart';
import 'package:starter/app/data/repository/news_api_repository.dart';
import 'package:starter/app/data/values/env.dart';
import 'package:timeago/timeago.dart' as timeago;
import '../../../data/models/dto/response.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class NewHomeController extends GetxController {
  //TODO: Implement NewHomeController

  RxBool shouldBeNewest = true.obs;
  var page = 1.obs;
  final pageSize = 20;
  var isArticleEmpty = false.obs;

  var isLoading = true.obs;
  var isFilter = false.obs;
  RxBool isFilterBottomSheetValue=false.obs;
  RxBool isInternetConnected = true.obs;

  //bottom sheet filter with checkbox functionality
  RxList<bool> ischeck = RxList();
  RxString sourcesIds = ''.obs;

  RxList<dynamic>? articles;
  Set<dynamic> sources = {};
  Set<dynamic> ids = {};

  void sourceList() {
    articles = newArticles;
    for (int i = 0; i < articles!.length; i++) {
      if (articles![i].source.id != null &&
          !(ids.contains(articles![i].source.id))) {
        sources.add(articles![i].source.name);
        ids.add(articles![i].source.id.toString());
        ischeck.add(false);
      }
    }
  }

  // checking all the checkbox if there value is true or false
  void isFilterCheckbox(){
    for(int i=0;i<ischeck.length;i++){
      if(ischeck[i]==true){
        isFilterBottomSheetValue.value=true;
        break;
      }else if(ischeck[i]==false){
        isFilterBottomSheetValue.value=false;
      }
    }
    debugPrint("displaying the bool value:->> ${isFilterBottomSheetValue.value}");
  }

  void resetChecks() {
    for (int i = 0; i < articles!.length; i++) {
      ischeck.insert(i, false);
    }
  }

  void filterByNews() {
    sourcesIds.value = '';
    for (int i = 0; i < ids.length; i++) {
      if (ischeck[i] == true) {
        sourcesIds.value += '${ids.elementAt(i)},';
      }
    }
  }

  int sourceStringlength() {
    return sourcesIds.value.length;
  }

  RepoResponse<NewsApiResponse>? response;

  // Filter by sources
  // var sources = 'bbc-news'.obs;

  // Time format
  // "publishedAt": "2022-12-20T07:08:00Z",
  String time_ago(DateTime dt) {
    String aboutHourAgo = timeago.format(dt, allowFromNow: true, locale: 'en');
    if (aboutHourAgo == 'about an hour ago') {
      return 'About an hour ago';
    }
    return timeago.format(dt, allowFromNow: true, locale: 'en');
  }

  //Sorting variables
  var sort = 'newest'.obs;

  // for Location Info
  var initCountry = 'India'.obs;
  var c = 'India'.obs;

  //filter by country news
  RxString countryCode = 'us'.obs;

  ///var url='${Env.baseNewsLink}$countryCode&category=business&apiKey=${Env.apikey}'.obs;
  var url = '${Env.baseNewsLink}country=in&apiKey=${Env.apikey}'.obs;

  final NewsAppRepository _appRepository = NewsAppRepository();
  RxList<Articles> newArticles = <Articles>[].obs;
  RxList<Source> newsSource = <Source>[].obs;

  ///for Drop Down button Sort
  var sortList = ['Newest', 'Oldest'];
  var selectedDrowpdown = 'Newest'.obs;

  /// Function to change Url

  String urlFunction({String? country, String? source, int page = 1}) =>
      'https://newsapi.org/v2/top-headlines?country=$country&sources=${source ?? ''}&page=${page}&pageSize=${pageSize}&apiKey=${Env.apikey}';

  void changeUrlFunction() {
    // url.value = '${Env.baseNewsLink}country=${countryCode.value}&apiKey=${Env.apikey}';
    url.value = urlFunction(country: countryCode.value ?? "", page: page.value);
  }

  void filterUrlFunction() {
    // url.value = '${Env.baseNewsLink}sources=${sourcesIds.value}&apiKey=${Env.apikey}';
    url.value = urlFunction(
        source: sourcesIds.value ?? "", country: '', page: page.value);
    filterByNews();
  }

  void setCountryCode(var value) {
    countryCode.value = value;
  }

  String getCountry() {
    return initCountry.value;
  }

  void displayCountryCode() {
    displayCountry(initCountry.value);
  }

  sortArticles(bool isNewest) {
    if (isNewest) {
      newArticles.sort((a, b) => b.publishedAt!.compareTo(a.publishedAt!));
    } else {
      newArticles.sort((a, b) => a.publishedAt!.compareTo(b.publishedAt!));
    }
  }

  RxBool isFirstLoadRunning = false.obs;

  /// Initially hasNextPage initially set true.
  RxBool hasNextPage = true.obs;

  /// isLoadMoreRunning initially set to false.
  RxBool isLoadMoreRunning = false.obs;

  /// Initially _post lists will be empty.
  late ScrollController Fcontroller;

  Future<void> firstLoad() async {
    // if(newArticles.isNotEmpty){
    //   debugPrint('first load function called');
    //   newArticles.clear();
    // }

    if (isFilter.value == false) {
      changeUrlFunction();
    } else {
      filterUrlFunction();
    }

    isFirstLoadRunning.value = true;
    try {
      final response = await _appRepository.fetchNewsAPI(url.value);
      if (response.error == null) {
        if (shouldBeNewest.value) {
          final list = response.data!.articles!;
          list.sort((a, b) => b.publishedAt!.compareTo(a.publishedAt!));
          newArticles.value = list;
        } else {
          final list = response.data!.articles!;
          list.sort((a, b) => a.publishedAt!.compareTo(b.publishedAt!));
          newArticles.value = list;        }
      }
    } finally {
      isLoading.value = false;
      debugPrint('Something went wrong');
    }

    isFirstLoadRunning.value = false;
  }

  Future<void> loadMore() async {
    if (hasNextPage.value == true &&
        isFirstLoadRunning.value == false &&
        isLoadMoreRunning.value == false &&
        Fcontroller.position.extentAfter < 300) {
      isLoadMoreRunning.value =
          true; // Display a progress indicator at the bottom

      page.value += 1;

      if (isFilter.value == false) {
        changeUrlFunction();
      } else {
        filterUrlFunction();
      }
      // Increase page by 1

      /// Here, we are calling API.
      try {
        /// Here _page is always dynamic it will increase everytime when we are
        /// calling _loadMore function.
        final response = await _appRepository.fetchNewsAPI(url.value);

        /// If fetchedPosts is not empty then we will add data in posts.

        if (response?.error == null) {
          newArticles.addAll(response!.data!.articles!);
        } else {
          hasNextPage.value = false;
        }
      } finally {
        isLoading.value = false;
        debugPrint('Something went wrong');
      }

      /// At the end, when loading done isLoadMoreRunning set to false.
      isLoadMoreRunning.value = false;

      debugPrint('articles length >>>${newArticles.value.length.toString()}');
    }
  }


/*  List_of_ISO_3166_country_codes
*   india - in
*   USA - us
*   Australia - au
*   Brazil - br
*   Sweden  - SE
*   England - gb
* */
// display top headlines ac to country
  void displayCountry(var value) {
    switch (value) {
      case 'India':
        setCountryCode('in');
        break;
      case 'USA':
        setCountryCode('us');
        break;
      case 'Australia':
        setCountryCode('au');
        break;
      case 'Brazil':
        setCountryCode('br');
        break;
      case 'England':
        setCountryCode('gb');
        break;
      case 'Sweden':
        setCountryCode('se');
        break;
      default:
        print('No Country Selected');
    }
  }

  //Selecting value from dropDown Button Sort
  void setSelected(String value) {
    selectedDrowpdown.value = value;
  }

  var connectionStatus = 0.obs;

  /// Listening Internet Connection Request in Stream.
  late StreamSubscription<InternetConnectionStatus> _listner;

  @override
  void onInit() {
    firstLoad();

    /// Controller will here detect scroll and call _loadMore when there is
    /// scroll detected.
    Fcontroller = ScrollController()..addListener(loadMore);
    //getNewsList();
    _listner = InternetConnectionChecker()
        .onStatusChange
        .listen((InternetConnectionStatus status) {
      switch (status) {
        case InternetConnectionStatus.connected:
          connectionStatus.value = 1;
          break;
        case InternetConnectionStatus.disconnected:
          connectionStatus.value = 0;
          break;
      }
    });
    print('connection status :${connectionStatus.value.toString()}');
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
    _listner.cancel();
  }
}
