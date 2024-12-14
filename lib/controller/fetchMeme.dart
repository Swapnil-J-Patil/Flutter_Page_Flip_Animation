import 'dart:convert';
import 'package:http/http.dart';

class FetchMeme {
  static Future<List<String>> fetchMemes() async {
    final response = await get(Uri.parse("https://meme-api.com/gimme/20"));
    final data = jsonDecode(response.body);

    // Extract the URLs of the memes
    List<String> memes = (data["memes"] as List)
        .map((meme) => meme["url"] as String)
        .toList();

    return memes;
  }
}
