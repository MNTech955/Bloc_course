

import 'dart:convert';
import 'dart:io';

import 'package:bloc_course/model/posts_model.dart';
import 'package:http/http.dart' as http;

class PostRepository {

  //ham aik future function create karenge aur hu future function hame list return karega 
  //aur List ke andar ju object hunge hu PostModle ke hunge 

  Future<List<PostModel>> fetchPosts()async{
    try{
      final resposne=await http.get(Uri.parse("https://jsonplaceholder.typicode.com/comments"));
      if(resposne.statusCode==200){
        //as List:-->This ensures that the body variable is treated as a list for further processing.
        final body=json.decode(resposne.body) as List;
        return body.map((e){
          return PostModel(
            id: e['id'] as int,
            postId: e['postId'] as int,
            
          
            email: e['email'] as String,
            body: e['body'] as String,

          );

        }).toList();

      }

    }on SocketException{
        throw Exception("error while fetching data");

      }
      throw Exception("error while fetching data");
  }
}