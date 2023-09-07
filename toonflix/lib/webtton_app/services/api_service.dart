import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:toonflix/webtton_app/models/webtoon_detail_model.dart';
import 'package:toonflix/webtton_app/models/webtoon_episode_model.dart';
import 'package:toonflix/webtton_app/models/webtoon_model.dart';

class ApiService {
  static const String baseUrl =
      'https://webtoon-crawler.nomadcoders.workers.dev';
  static const String today = "today";

  static Future<List<WebtoonModel>> getTodayToons() async {
    List<WebtoonModel> webtoonInstances = [];
    final url = Uri.parse('$baseUrl/$today');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final List<dynamic> webtoons = jsonDecode(response.body);
      for (var webtoon in webtoons) {
        webtoonInstances.add(WebtoonModel.fromJson(webtoon));
      }
      return webtoonInstances;
    }
    throw Error();
  }

  static Future<WebtoonDetailModel> getToonById(String id) async {
    final url = Uri.parse("$baseUrl/$id");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final webtoon = jsonDecode(response.body);
      return WebtoonDetailModel.fromJson(webtoon);
    }
    throw Error();
  }

  static Future<List<WebtoonEpisodeModel>> getLatestEpisodesById(
      String id) async {
    List<WebtoonEpisodeModel> episodesInstances = [];
    final url = Uri.parse("$baseUrl/$id/episodes");
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final episodes = jsonDecode(response.body);
      for (int i = 0; i < 10; i++) {
        episodesInstances.add(WebtoonEpisodeModel.fromJson(episodes[i]));
      }
      // for (var episode in episodes) {
      //   if (num < 10) {
      //     episodesInstances.add(WebtoonEpisodeModel.fromJson(episode));
      //   }
      // }
      return episodesInstances;
    }
    throw Error();
  }
}
