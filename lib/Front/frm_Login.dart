import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_eiteck/Front/SearchDelegate.dart';
import 'package:flutter_eiteck/Front/SearchRickMorty.dart';
import 'package:flutter_eiteck/Models/SearchDelegateModel.dart';

final Usuario = TextEditingController();
final Contrasena = TextEditingController();
final ConfirmarContrasena = TextEditingController();
String Usua;
String Contra;

List<SearchDelegateModel> historialMenuPrincipal=[];
List<SearchDelegateModel> historialbusquedaseleccionada=[];

void main() {
  runApp(
      MaterialApp(
        debugShowCheckedModeBanner: false,
        home:frm_Login(),
      ));
}

class frm_Login extends StatefulWidget {

  @override
  // State<StatefulWidget> createState() {

  State<StatefulWidget> createState() {
    return Frm_Login();

    throw UnimplementedError();
  }
}



class Frm_Login extends State<frm_Login>{

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: new AppBar(
        title: new Text("Eiteck"),
        //centerTitle: true
      ),
      body: //cuerpo(context),
      new Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors:([Colors.black,Colors.blue])
            )
        ),
        child: new Center(
          child:new Column(
            //mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 38,),
              nombre(),
              SizedBox(height: 15,),//para dar espacios entre los widgets o componenetes
              usuario(),
              contrasena(),
              SizedBox(height: 48,),
              //BotonEntrar(context),
              Container(
                  height: 50,
                  width: 250,
                  decoration: BoxDecoration(
                      color: Colors.blue, borderRadius: BorderRadius.circular(20)),
                  child: new TextButton(//Boton de mensaje de errores al logearse
                    //color: Colors.blueAccent,
                    // padding: EdgeInsets.symmetric(horizontal: 70, vertical:10 ),
                    onPressed: (){
                      Navigator.push(context,
                          new MaterialPageRoute(builder:
                              (context) =>  new MenuPrincipal())
                      );
                    },
                    child: new Text("Ingresar",style: new TextStyle(fontSize: 25,color: Colors.white),),
                  )
              ),
             // ForgotPassWord(),
              SizedBox(height: 18,),
           //   newuser(context),
            ],
          ),
        ),
      ),
    );
    throw UnimplementedError();
  }
}

Widget nombre(){
  return new Container(
      child: new Text("Eiteck-Login",style: TextStyle(color: Colors.blue,fontSize:45.0,fontWeight: FontWeight.bold,),)
  );
}

Widget usuario(){
  return new Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical:10 ),
      child:new TextFormField(
        controller:Usuario ,
        decoration: new InputDecoration(
          hintText: "Usuario",
          fillColor: Colors.white,//color de fondo de texto
          filled: true,//confirma el texto
          border: new OutlineInputBorder(
            borderRadius: new BorderRadius.circular(25.0),
            borderSide: new BorderSide(
            ),
          ),
        ),
      )
  );

}

Widget contrasena(){
  return new Container(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical:10 ),
      child: new TextFormField(
        controller: Contrasena,
        obscureText: true,
        decoration: new InputDecoration(
          hintText: "Contraseña",
          fillColor: Colors.white,//color de fondo de texto
          filled: true,//confirma el texto
          border: new OutlineInputBorder(
            borderRadius: new BorderRadius.circular(25.0),
            borderSide: new BorderSide(
            ),
          ),
        ),
      )
  );

}

//Continuar con el codigo de la imagen
Widget imagen(){
  return Container(
    child: ClipRRect(
      borderRadius: BorderRadius.circular(300.0),
      // clipper: MyClip(),
      child: new Image(
        image: AssetImage("imagenes/element_logo.png"),
        fit: BoxFit.fill,
        width: 200,
        height: 150,
      ),
    ),
  );
}

Widget ForgotPassWord(){
  return new Container(
    child: TextButton(
      onPressed: (){
        //codigo de evento o de accion completar


      },
      child: Text(
        'Forgot Password',
        style: TextStyle(color: Colors.white, fontSize: 15),
      ),
    ),
  );
}

Widget newuser(BuildContext context){
  return new Container(
    child: TextButton(
      onPressed:()
       {



     /*   final busqueda =  await showSearch(
            context: context,
            delegate: SearchDelegateMenuPrincipal(
                "Buscar...", historialMenuPrincipal,historialbusquedaseleccionada)
        );
        if (busqueda != null ) {
          historialMenuPrincipal.removeWhere((item) =>
          item.gender == busqueda.gender);
          // this.historialMenuPrincipal.add(busqueda); este sirve
          historialMenuPrincipal.insert(0, busqueda);
          // this.historialbusquedaseleccionada.insert(0, busqueda);

        }*/

      },
      child: Text(
        'New User?Create Account',
        style: TextStyle(color: Colors.white, fontSize: 15),
      ),
    ),
  );
}

Widget CerrarDialog(context){
  return new Container(
    child: TextButton(
      onPressed:()
      {
        Navigator.pop(context);
      },
      child: Text(
        "Cerrar",
        // style: TextStyle(color: Colors.white, fontSize: 15),
      ),
    ),
  );
}


