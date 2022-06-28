
import 'dart:typed_data';

import 'package:dio/dio.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';

class SaveImageNetwork{
  
  static Future<bool> saveImage(String imagePath)async
  {
    var response = await Dio().get(
           imagePath,
           options: Options(responseType: ResponseType.bytes));
   final result = await ImageGallerySaver.saveImage(
           Uint8List.fromList(response.data));
   return result['isSuccess'];
  }
  
}