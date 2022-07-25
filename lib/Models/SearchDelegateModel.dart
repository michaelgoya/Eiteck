import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

List <SearchDelegateModel>productFromJson(String str) => List <SearchDelegateModel>.from(json.decode(str).map((x) => SearchDelegateModel.fromJson(x)));// con esto hago el get
//List /*<SearchDelegateModel>*/.from(json.decode(str).map((x) => SearchDelegateModel.fromJson(x)));

class SearchDelegateModel{

  String species;
  String gender;

  SearchDelegateModel({this.species,this.gender});

  //Creo que es para retornar los valores
  factory SearchDelegateModel.fromJson(Map<String, dynamic> parsedJson)
    => SearchDelegateModel(
        species: parsedJson['species'],
        gender: parsedJson['gender']
    );



}