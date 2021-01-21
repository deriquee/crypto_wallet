import 'package:http/http.dart'as http;
import 'dart:convert';

Future<double>getPrice(String id)async{
  try{
    var url = 'https://api.coingecko.com/api/v3/coins/'+id;
    var response =await http.get(url);
    var jsonData = jsonDecode(response.body);
    var jsonValue = jsonData['market_data']['current_price']['inr'].toString();
    return double.parse(jsonValue);
  }catch(e){
    print(e.toString());
  }
}