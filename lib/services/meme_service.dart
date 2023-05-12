import 'dart:convert';
import 'dart:developer';
import 'package:formation/models/meme.dart';
import 'package:http/http.dart' as http;

class MemeService {
  /*
    Future: équivalent des promesses JS
  */
  Future getMemes() async {
    // url de l'api
    Uri url = Uri.parse('https://api.imgflip.com/get_memes');

    // récupération de la réponse HTTP en GET
    http.Response response = await http.get(url);

    //inspect(response);
    // récupérer les données
    if (response.statusCode == 200) {
      // décoder les données
      List data = jsonDecode(response.body)['data']['memes'];

      // retourner une List d'objet Meme
      return data
          .map((value) => Meme(name: value['name'], url: value['url']))
          .toList();

      // inspect(data);
    } else {
      throw Error();
    }
  }
}
