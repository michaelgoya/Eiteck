import 'package:flutter_eiteck/Models/SearchDelegateModel.dart';
import 'package:http/http.dart' as http;

class SearchDelegateServices{

  Future   MostrarMenuPrincipalSearch() async{
    Map<String, String> headers = {
      'Content-Type':'application/json;charset=UTF-8',
      'Charset':'utf-8'
    };
     var Url= Uri.parse("https://rickandmortyapi.com/api/character/176");

 //   var Url= Uri.parse("http://192.168.0.105/PruebaRati/Prueba Php/Modelo_Php/RatiDemo/OpcionGeneral.php");// este sirve
    final http.Response response = await http.get((Url),headers: headers);
    print(response.body);
    return productFromJson(response.body);
  }

}