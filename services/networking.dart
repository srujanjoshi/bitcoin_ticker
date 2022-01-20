import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

String api_key= '1d8e758c1f8665577e049f3f3dd69fcc325024c21bc6756245ce997810a2ba79';

class NetworkHelper{

  String url;
  NetworkHelper( this.url);

  Future<dynamic> getData() async{
    //Get Weather data for current location
    var response = await http.get(Uri.parse(url));
    if (response.statusCode == 200) {
      var jsonResponse = convert.jsonDecode(response.body);
      return jsonResponse;
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }
  }
}