import 'dart:convert';

import 'package:http/http.dart'as http;
import 'package:newapp/model/model_class.dart';

class DataServices{
  String baseUrl='http://mark.bslmeiyu.com/api';
  Future<List<DatatModel>> getInfo() async {
    var apiUrl='/getplaces';
  http.Response res = await http.get(Uri.parse(baseUrl+apiUrl));
  try{
    if(res.statusCode==200){
      List<dynamic> list = json.decode(res.body);
      print(list);
      return list.map((e) => DatatModel.fromJson(e)).toList();
    }
    else{
      return <DatatModel>[];
    }
  }catch(e){
    print(e);
    return <DatatModel>[];
  }
  }
}