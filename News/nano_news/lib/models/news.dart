import 'dart:convert';

class News {
  final String title;
  final String author;
  final String content;
  final String postedAt;
  final String sourceURL;
  final String sourceName;
  final String imageURL;
  News({
    this.title,
    this.author,
    this.content,
    this.postedAt,
    this.sourceURL,
    this.sourceName,
    this.imageURL,
  });

  News copyWith({
    String title,
    String author,
    String content,
    String postedAt,
    String sourceURL,
    String sourceName,
    String imageURL,
  }) {
    return News(
      title: title ?? this.title,
      author: author ?? this.author,
      content: content ?? this.content,
      postedAt: postedAt ?? this.postedAt,
      sourceURL: sourceURL ?? this.sourceURL,
      sourceName: sourceName ?? this.sourceName,
      imageURL: imageURL ?? this.imageURL,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'author': author,
      'content': content,
      'postedAt': postedAt,
      'sourceURL': sourceURL,
      'sourceName': sourceName,
      'imageURL': imageURL,
    };
  }

  factory News.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    var _imageURL =
        'https://partnershipfcc.org/images/easyblog_articles/14/new-york-times-logo-1.jpg';
    var multiMediaMapJson = map['multimedia'];

    if (multiMediaMapJson != null) {
      var multimediaMap = List<Map<String, dynamic>>.from(multiMediaMapJson);
      if (multimediaMap.length > 0) {
        final _mediaMap = multimediaMap[0];
        _imageURL = _mediaMap['url'];
      }
    }
    final _byInline = map['byline'] == null ? '--' : map['byline'];

    return News(
      title: map['title'],
      author: _byInline,
      content: map['abstract'],
      postedAt: map['published_date'],
      sourceURL: map['url'],
      sourceName: 'The New York Times', // map['source'],
      imageURL: _imageURL,
    );
  }

  String toJson() => json.encode(toMap());

  factory News.fromJson(String source) => News.fromMap(json.decode(source));

  @override
  String toString() {
    return 'News(title: $title, author: $author, content: $content, postedAt: $postedAt, sourceURL: $sourceURL, sourceName: $sourceName, imageURL: $imageURL)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is News &&
        o.title == title &&
        o.author == author &&
        o.content == content &&
        o.postedAt == postedAt &&
        o.sourceURL == sourceURL &&
        o.sourceName == sourceName &&
        o.imageURL == imageURL;
  }

  @override
  int get hashCode {
    return title.hashCode ^
        author.hashCode ^
        content.hashCode ^
        postedAt.hashCode ^
        sourceURL.hashCode ^
        sourceName.hashCode ^
        imageURL.hashCode;
  }
}
