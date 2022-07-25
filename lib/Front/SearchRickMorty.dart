
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_eiteck/Models/SearchDelegateModel.dart';
import 'package:flutter_eiteck/Services/SearchDelegateServices.dart';

class MenuPrincipal extends StatefulWidget {
  @override
  // State<StatefulWidget> createState() {

  State<StatefulWidget> createState() {
    return menuprincipal();
    throw UnimplementedError();
  }
}

var barrabusquedaController = TextEditingController();

var SearchDelegateRM = new SearchDelegateServices();

class menuprincipal extends State<MenuPrincipal>{

  Icon cusIcon= Icon(Icons.search);
  Widget cusSearchBar = Text("Eiteck");
 // int indextab;
 // var barrabusquedaController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
          resizeToAvoidBottomInset : false,
          appBar: AppBar(
            backgroundColor: Colors.redAccent,
            elevation: 0,
            actions: [
              // todo esto sirve
              IconButton(
                onPressed: (){
                  setState(() {
                    if(this.cusIcon.icon== Icons.search){
                      this.cusIcon=Icon(Icons.cancel);
                      this.cusSearchBar= TextField(
                        controller: barrabusquedaController,
                        onChanged: (value) {
                          //filterSearchResults(value);
                          setState((){

                          }
                          );
                        },
                        textInputAction: TextInputAction.go,
                        decoration: InputDecoration(
                          hintText: "Buscar",
                        ),
                        style: TextStyle(
                            color:Colors.white,
                            fontSize: 16.0
                        ),
                      );
                    }else{
                      this.cusIcon= Icon(Icons.search);
                      this.cusSearchBar=Text("Rati Spa");
                    }
                  }
                  );
                },
                icon:cusIcon,
              )
            ],
            title:cusSearchBar,
          ),

           body:  RMMostrar()

        );

    throw UnimplementedError();
  }
}


Widget RMMostrar(){
  return Container(////////////////////////////////////////////////////////////////////////////////////////////////////
    child: FutureBuilder (
        future: SearchDelegateRM.MostrarMenuPrincipalSearch(),
        builder:(context,   snapshot ) {
     //     List  info = snapshot.data;
          List <SearchDelegateModel> info = snapshot.data;
//final SearchDelegateModel infoo = snapshot.data;
     // final SearchDelegateModel busqueda= snapshot.data;
         /* if(barrabusquedaController.text.isNotEmpty){
            print("No esta vacio la barra de busqueda");
            var busquedapalabra = barrabusquedaController.text.toLowerCase();
            busqueda = busqueda.where((element) => element.email.contains(busquedapalabra) || element.contrasena.contains(busquedapalabra)
            ).toList();
          }else{
            print("esta vacio la barra de busqueda");

          }*/

          if(snapshot.hasData) {
            return ListView.builder(
               itemCount: info.length,//snapshot.data.length,
                shrinkWrap: true,
                itemBuilder: (BuildContext context , index){
                //  var p = busqueda[index];
                  return new Card(
                    shadowColor: Colors.blue,
                    elevation: 8,
                    clipBehavior: Clip.antiAlias,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(14),
                    ),
                    child: new Column(
                      children: [
                        ListTile(
                        /*  leading: CircleAvatar(
                            backgroundImage: NetworkImage(
                                "https://2.bp.blogspot.com/-3ZzNt8ZsjQk/WR9W4IFn4II/AAAAAAAAAJw/_inTVynhS60V7F5IZ-461-pda7WArTStwCEw/s1600/ANA.jpg"),
                          ),*/
                          title:  Text(info[index].gender,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          onTap:(){
                           /* Navigator.push(context,
                                new MaterialPageRoute(builder:
                                    (context) =>  new Perfil( busqueda[index]))
                            );*/
                          } ,
                          subtitle: Text(
                            "${info[index].species}",
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          trailing: IconButton(
                            icon: Icon(Icons.cancel),
                            onPressed: () {


                            },
                          ),
                        )
                      ],
                    ),
                  );

                }
            ) ;
          } else if(snapshot.hasError){
            return Text("${snapshot.error}");
          }

          return Center(
              child: CircularProgressIndicator()
          );
        }
    ),

  );
}