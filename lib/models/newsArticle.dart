
import 'dart:convert'; //includes jsonDecode() and jsonEncode() methods
import 'package:networking_demo/services/webservice.dart';
import 'package:networking_demo/utils/constants.dart';

class NewsArticle {
  
 // final String author;
  final String title; 
  final String descrption; 
  final String urlToImage; 
//  final String content;

  //NewsArticle({this.title, this.descrption, this.urlToImage, this.content});
  NewsArticle({this.title, this.descrption, this.urlToImage});

  factory NewsArticle.fromJson(Map<String,dynamic> json) {
    return NewsArticle(
//      author: json['author'],
      title: json['title'], 
      descrption: json['description'], 
      urlToImage: json['urlToImage'] ?? Constants.NEWS_PLACEHOLDER_IMAGE_ASSET_URL,
//      content: json["content"]
    );
  
}

  static Resource<List<NewsArticle>> get all {
    
    return Resource(
      url: Constants.HEADLINE_NEWS_URL,
      parse: (response) {
        final result = json.decode(response.body); 
        Iterable list = result['articles'];
        return list.map((model) => NewsArticle.fromJson(model)).toList();
      }
    );

  }

}