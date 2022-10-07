import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:news_app/data/categorydata.dart';
import 'package:news_app/data/newsdata.dart';
import 'package:news_app/models/article_model.dart';
import 'package:news_app/models/category_models.dart';
import 'package:news_app/screens/category.dart';
import 'package:news_app/screens/categorylist.dart';
import 'package:news_app/screens/newsarticle.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<CategoryModel> categories = List<CategoryModel>.empty(growable: true);
  List<ArticleModel> articles = List<ArticleModel>.empty(growable: true);

  bool _loading = true;
  @override
  void initState() {
    super.initState();
    categories = getCategories();
    getNews();
  }

  getNews() async {
    News news = News();
    await news.getNews();
    articles = news.news;
    setState(() {
      _loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _loading
          ? Center(
              child: Container(child: CircularProgressIndicator()),
            )
          : SingleChildScrollView(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                child: Column(
                  children: <Widget>[
                    Container(
                      height: 60,
                      child: ListView.builder(
                          itemCount: categories.length,
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return Category(
                              imageURL: categories[index].imageURL,
                              categoryName: categories[index].categoryName,
                            );
                          }),
                    ),
                    Container(
                        padding: const EdgeInsets.only(top: 16),
                        child: ListView.builder(
                          itemCount: articles.length,
                          shrinkWrap: true,
                          physics: const ClampingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return ArticleTile(
                              imageURL: articles[index].urlToImage,
                              title: articles[index].title,
                              description: articles[index].description,
                              url: articles[index].url,
                              publishedAt: articles[index].publishedAt,
                            );
                          },
                        ))
                  ],
                ),
              ),
            ),
    );
  }
}

class Category extends StatelessWidget {
  const Category({this.categoryName, this.imageURL});
  final categoryName, imageURL;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    CategoryNews(category: categoryName.toLowerCase())));
      },
      child: Container(
        margin: const EdgeInsets.only(right: 10),
        //color: Colors.blue,
        child: Stack(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: CachedNetworkImage(
                imageUrl: imageURL,
                width: 120,
                height: 60,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              alignment: Alignment.center,
              width: 120,
              height: 60,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(6)),
              child: Text(
                categoryName,
                style: GoogleFonts.lato(
                  textStyle: const TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class ArticleTile extends StatelessWidget {
  final String imageURL, title, description, url;
  DateTime publishedAt;

  ArticleTile(
      {required this.imageURL,
      required this.title,
      required this.description,
      required this.url,
      required this.publishedAt});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => Article(articleUrl: url)));
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),

        //color: Colors.blue,
        child: Column(
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                imageURL,
              ),
            ),
            const SizedBox(
              height: 8,
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                title,
                style: GoogleFonts.lato(
                    textStyle: const TextStyle(
                        fontSize: 18, fontWeight: FontWeight.w500)),
              ),
            ),
            const SizedBox(
              height: 6,
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child: Text(
                description,
                maxLines: 2,
                style: const TextStyle(
                  color: Colors.black54,
                  fontSize: 14,
                ),
              ),
            ),
            const SizedBox(
              height: 4,
            ),
            Align(
              alignment: Alignment.bottomLeft,
              child:
                  Text(DateFormat('yyyy-MM-dd   KK:mm aaa').format(publishedAt),
                      style: GoogleFonts.lato(
                        textStyle: const TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                        ),
                      )),
            ),
            const Divider(
              height: 10,
              thickness: 1,
              color: Colors.black,
            )
          ],
        ),
      ),
    );
  }
}
