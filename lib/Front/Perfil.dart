import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
//import 'package:url_launcher/url_launcher.dart';


class PerfilCliente extends StatefulWidget {

  var perfilseleccionado;

  PerfilCliente(busquedaseleccionada){

    perfilseleccionado = busquedaseleccionada;
  }

  @override
  // State<StatefulWidget> createState() {

  State<StatefulWidget> createState() {
    return perfilcliente();
    throw UnimplementedError();
  }
}

class perfilcliente extends State<PerfilCliente>{

 /* void AbrirWhatsapp() async{

    String numero = "+5930997753492";
    var url = "http://wa.me/+5930997753492?text=Hola";
    await launch(url);
  }*/

  Widget PerfilUsuario(){
    return new Container(
      child:Center(
        child:Card(
          shadowColor: Colors.blue,
          elevation: 8,
          clipBehavior: Clip.antiAlias,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          child: Column(
            children: [
              Stack(
                alignment: Alignment.center,
                children: [
                 /* Ink.image(
                    image: NetworkImage(
                        "https://2.bp.blogspot.com/-3ZzNt8ZsjQk/WW4IFn4II/AAAAAAAAAJw/_inTVynhS60V7F5IZ-461-pda7WArTStwCEw/s1600/ANA.jpg"),
                    child: InkWell(
                      onTap: (){},
                    ),
                    height: 240,
                    fit:   BoxFit.cover,
                  ),*/
                  Positioned(
                    bottom:16,
                    right:16,
                    left:16,
                    child: Text(widget.perfilseleccionado.gender,
                      style: TextStyle(fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.all(16).copyWith(bottom: 0),
                child: Text( widget.perfilseleccionado.gender
                  ,
                  style: TextStyle(fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              ButtonBar(
                alignment: MainAxisAlignment.start,
                children: [
                  new IconButton(
                    icon: new Icon(Icons.message,
                      color: Colors.green,
                    ),
                    onPressed: () {
                     // AbrirWhatsapp();
                    },
                  ),
                  new IconButton(
                    icon: new Icon(Icons.favorite,
                      color: Colors.red,
                    ),
                    onPressed: () { /* Your code */ },
                  ),

                  new IconButton(
                    icon: new Icon(Icons.comment_outlined,
                      color: Colors.black,
                    ),
                    onPressed: () { /* Your code */ },
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
          backgroundColor: Colors.red,
          title: new Text("Perfil"),
          centerTitle: true
      ),
      body: PerfilUsuario(),
    );
    throw UnimplementedError();
  }
}
