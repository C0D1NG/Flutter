import 'dart:async';

import 'package:flutter/material.dart';

import './widgets/article_card.dart';
import './widgets/splash_card.dart';
import './widgets/splash_indicator.dart';
import './model/article.dart';
import './model/splash_item.dart';
import './widgets/goal_planner.dart';

class LandingScreen extends StatefulWidget {
  const LandingScreen({Key? key}) : super(key: key);

  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  List<Article> news = [];

  final ScrollController _scrollController = ScrollController();

  // splash controller
  final _splashCardControlller = PageController(viewportFraction: 1);
  final _splashIndicatorController = ScrollController();

  // current splash index
  int _currIndex = 0;
  late Timer _timer;
  final int _timerDuration = 3500;
  final int _animationDuration = 2000;

  @override
  void initState() {
    Article.getNews().then(
      (e) => setState(
        () {
          news = e;
        },
      ),
    );
    _timer = Timer.periodic(
      Duration(milliseconds: _timerDuration),
      (_) {
        if (_currIndex != listSplashItem.length - 1) {
          _splashCardControlller.nextPage(
              duration: Duration(milliseconds: _animationDuration),
              curve: Curves.easeIn);
          _currIndex++;
        }
      },
    );
    super.initState();
  }

  @override
  void dispose() {
    _splashCardControlller.dispose();
    _scrollController.dispose();
    _splashIndicatorController.dispose();
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        controller: _scrollController,
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 20.0,
            vertical: MediaQuery.of(context).padding.top,
          ),
          child: Column(
            children: [
              SizedBox(
                height: size.height - MediaQuery.of(context).padding.top,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 50,
                      child: Image.asset(
                        'assets/logo.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () =>
                                _splashCardControlller.previousPage(
                              duration: const Duration(milliseconds: 350),
                              curve: Curves.easeOut,
                            ),
                            icon: _currIndex != 0
                                ? const Icon(
                                    Icons.arrow_back_ios,
                                    color: Colors.grey,
                                    size: 18,
                                  )
                                : const SizedBox(),
                          ),
                          SizedBox(
                            height: size.height * 0.3,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: size.height * 0.23,
                                  width: size.width * 0.5,
                                  child: PageView.builder(
                                    pageSnapping: true,
                                    clipBehavior: Clip.none,
                                    controller: _splashCardControlller,
                                    physics: const BouncingScrollPhysics(),
                                    itemCount: listSplashItem.length,
                                    itemBuilder: (_, i) => Padding(
                                      padding: const EdgeInsets.only(right: 20),
                                      child: SplashCard(
                                        image: listSplashItem[i].svgPicture,
                                        title: listSplashItem[i].title,
                                      ),
                                    ),
                                    onPageChanged: (index) {
                                      // Timer(
                                      //   Duration(milliseconds: _timerDuration),
                                      //   () {
                                      //     if (_currIndex <
                                      //         listSplashItem.length - 1) {
                                      //       _splashCardControlller.nextPage(
                                      //           duration: Duration(
                                      //               milliseconds:
                                      //                   _animationDuration),
                                      //           curve: Curves.easeIn);
                                      //     }
                                      //   },
                                      // );
                                      setState(() {
                                        _currIndex = index;
                                      });
                                    },
                                  ),
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                SizedBox(
                                  height: 10,
                                  width: size.width * 0.4,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    shrinkWrap: true,
                                    physics:
                                        const NeverScrollableScrollPhysics(),
                                    itemCount: listSplashItem.length,
                                    itemBuilder: (_, i) => SplashIndicator(
                                      isHighlighted: i == _currIndex,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          IconButton(
                            onPressed: () => _splashCardControlller.nextPage(
                              duration: const Duration(milliseconds: 350),
                              curve: Curves.easeIn,
                            ),
                            icon: _currIndex == listSplashItem.length - 1
                                ? const SizedBox()
                                : const Icon(
                                    Icons.arrow_forward_ios,
                                    color: Colors.grey,
                                    size: 18,
                                  ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size.fromHeight(40),
                          ),
                          child: const Text(
                            'Masuk',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ),
                        OutlinedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            minimumSize: const Size.fromHeight(40),
                          ),
                          child: const Text(
                            'Daftar',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Center(
                      child: IconButton(
                        onPressed: () {
                          _scrollController.animateTo(
                            size.height,
                            duration: const Duration(milliseconds: 500),
                            curve: Curves.easeInQuad,
                          );
                        },
                        icon: Icon(
                          Icons.keyboard_double_arrow_down_rounded,
                          color: Colors.grey[700],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              // Second
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                        top: MediaQuery.of(context).padding.top),
                  ),
                  ClipRect(
                    clipBehavior: Clip.none,
                    child: UnconstrainedBox(
                      child: Container(
                        clipBehavior: Clip.none,
                        color: Colors.grey.shade200.withOpacity(0.6),
                        width: size.width,
                        child: GoalPlanner(
                          height: 120,
                          width: size.width * 0.4,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Reksa Dana',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      LihatSemua(),
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 160,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      clipBehavior: Clip.none,
                      itemCount: 5,
                      itemBuilder: (_, i) => Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Image.asset(
                          'assets/logo.png',
                          height: 80,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      Text(
                        'Artikel',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      LihatSemua()
                    ],
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    height: 250,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      clipBehavior: Clip.none,
                      shrinkWrap: true,
                      itemCount: news.length,
                      itemBuilder: (_, i) => Padding(
                        padding: EdgeInsets.only(left: i == 0 ? 20 : 0),
                        child: ArticleCard(
                          desc: news[i].description,
                          title: news[i].title,
                          url: news[i].url,
                          urlToImage: news[i].urlToImage,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Center(
                    child: Text(
                      'FAQ',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: 5,
                    itemBuilder: (_, i) => Card(
                      child: ExpansionTile(
                        title: const Text('Select text'),
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            width: double.infinity,
                            color: Colors.grey.shade300,
                            child: const Text('description'),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      const Text(
                        'Licensed By',
                        style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            'assets/iso.png',
                            height: 20,
                          ),
                          Image.asset(
                            'assets/ojk.png',
                            height: 20,
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LihatSemua extends StatelessWidget {
  const LihatSemua({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        padding: const EdgeInsets.all(5),
        color: const Color.fromARGB(255, 219, 255, 178),
        child: const Text(
          'Lihat Semua',
          style: TextStyle(
            color: Color.fromARGB(255, 79, 185, 82),
            fontSize: 12,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
