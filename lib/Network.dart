import 'package:http/http.dart' as http;
import 'dart:convert';

class NetworkDecoder{
  String url;
  NetworkDecoder(this.url);
  Future getData() async{
    http.Response response = await http.get(url);
    if(response.statusCode == 200){
      var body = response.body;
      return jsonDecode(body);
    }
    else{
      print(response.statusCode);
    }
  }
}