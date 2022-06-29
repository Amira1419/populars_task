import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:squadio_task/constants.dart';
class PopularPeopleNetwork
{
  static Future<Map<String,dynamic>> getPagePopularPeople(int pageNumber) async
  {
    var client = http.Client();
    try {
      var url = Uri.parse("https://api.themoviedb.org/3/person/popular?api_key=$API_KEY&page=$pageNumber");
      var response = await client.get(url);
      Map<String,dynamic> jsonResponse = jsonDecode(response.body);
      return jsonResponse;
    } catch (e) 
    {
      rethrow;
    } finally
    {
      client.close();
    }

  }
  static Future<Map<String,dynamic>> getPopularPeronDetails(int id) async
  {
    var client = http.Client();
    try {
      var url = Uri.parse("https://api.themoviedb.org/3/person/$id?api_key=$API_KEY");
      var response = await client.get(url);
      Map<String,dynamic> jsonResponse = jsonDecode(response.body);
      print(jsonResponse);
      return jsonResponse;
    } catch (e) 
    {
      rethrow;
    } finally
    {
      client.close();
    }

  }

  static Future<Map<String,dynamic>> getPopularPeronImages(int id) async
  {
    var client = http.Client();
    try {
      var url = Uri.parse("https://api.themoviedb.org/3/person/$id/images?api_key=$API_KEY");
      var response = await client.get(url);
      Map<String,dynamic> jsonResponse = jsonDecode(response.body);
      print(jsonResponse);
      return jsonResponse;
    } catch (e) 
    {
      rethrow;
    } finally
    {
      client.close();
    }

  }



}