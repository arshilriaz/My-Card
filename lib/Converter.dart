import 'Network.dart';

String initialURL = 'https://rest.coinapi.io/v1/exchangerate';
String apikey = '6205CED4-6925-4C74-BEAA-5CD0DD991A84';
class Converter{
  Future<dynamic> getInfo(String crypto, String fiat) async{
    NetworkDecoder nD = new NetworkDecoder('$initialURL/BTC/USD?apikey=$apikey');
    var data = await nD.getData();
    return data["rate"];
  }
}

