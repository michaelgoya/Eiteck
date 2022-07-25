import 'package:flutter/material.dart';
import 'package:flutter_eiteck/Front/Perfil.dart';
import 'package:flutter_eiteck/Models/SearchDelegateModel.dart';
import 'package:flutter_eiteck/Services/SearchDelegateServices.dart';

//import 'PerfilCliente.dart';

/*class SearchDelegateMenuPrincipal  extends SearchDelegate<SearchDelegateModel>{

  @override
  final String searchFieldLabel;
  List<SearchDelegateModel> historialMenuPrincipal=[];
  List  <SearchDelegateModel> historialbusquedaseleccionada=[];

  SearchDelegateModel jj;

  //final menuprincipalservices = new MenuPrincipalServices();


  SearchDelegateMenuPrincipal(this.searchFieldLabel,this.historialMenuPrincipal,this.historialbusquedaseleccionada);

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: const Icon(Icons.close),
          onPressed:(){
            this.query="";
          }
      ),
    ];
  }

  // crear una funcion que reciba el suggestions y ese suggestions se lo mando a la funcion this close,todoeso  en un metodo aparte y que lo retorne el builleading

  @override
  Widget buildLeading(BuildContext context) {
    return

      Container(
        child:  IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed:() => this.close(context, jj)


        ),

      );
  }


  // esta guardando valores en la nueva lista que cree
  @override
  Widget buildResults(BuildContext context) {
    final searchdelegateservices = new SearchDelegateServices();
    return this.query.isEmpty?Container():Container(
      child: FutureBuilder(
          future: searchdelegateservices.MostrarMenuPrincipalSearch(),
          builder:(context, AsyncSnapshot  snapshot) {
            //  busqueda = snapshot.data; se lo utiliza con el future builder y quitando los comentarios
            if(snapshot.hasData ) {
              return  HistorialBusquedaResults(snapshot.data);

            } else if(snapshot.hasError){
              return Text("${snapshot.error}");
              // return Text("No se encontro la busqueda");
            }
            return Center(
                child: CircularProgressIndicator()
            );
          }

      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {

    return historialMenuPrincipal.length <= 0 ? MensajeHistorialBusquedaVacio():
    StatefulBuilderSuggestions(context,this.historialMenuPrincipal ); // este sirve

  }





  Widget HistorialBusquedaResults(List <SearchDelegateModel> BusquedaHistorial ){

    final suggestions = BusquedaHistorial.where((name) => name.gender.toLowerCase().contains(this.query.toLowerCase())).toList();
    return suggestions.length <=0 ? NoResultadosBusqueda() :ListView.builder(
        itemCount: suggestions.length,
        itemBuilder: (context,i){
//final  MostrarBusqueda = BusquedaHistorial[i];// este es el que sirve

          return  ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://2.bp.blogspot.com/-3ZzNt8ZsjQk/WR9W4IFn4II/AAAAAAAAAJw/_inTVynhS60V7F5IZ-461-pda7WArTStwCEw/s1600/ANA.jpg"),

              ),

              title: Text(suggestions[i].gender,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),

              ),

              onTap: () {

                // this.historialbusquedaseleccionada.insert(0, suggestions[i]);

                //
                //  jj = suggestions[i];

                print("fgfgfg");
                print(jj.toString());
                //this.close(context,suggestions[i] );// esto es para cerrar cuando des click en la lista de busqueda -- esto sirve
                // posibles respuestas:: crear un arreglo o variable global para que se almacene la busqueda elegida y usarla ern cualquiera de los metodos
                // paso 1: crear la arreglo global, paso 2:: insetar en el arreglo global, paso 3:: mostrarlo por el por el stafulbuilder

                Navigator.push(context,
                    new MaterialPageRoute(builder:
                        (context) => new PerfilCliente(suggestions[i]))

                );
                jj = suggestions[i];
                //  this.close(context,suggestions[i] );  //este sirve
                //this.close(context,null );
              }

            // this.close(context,suggestions[i] );// esto es para cerrar cuando des click en la lista de busqueda -- esto sirve




          );
        }
    );



  }
////////////// Muestra el historial de busqueda

  Widget StatefulBuilderSuggestions(BuildContext context ,List <SearchDelegateModel> historialMenuPrincipal,/*List <SearchDelegateModel> historialbusquedaseleccionada*/){

    return Container(
        child:StatefulBuilder(
            builder:(context,setState)
            {

              return Column(
                children: [
                  this.historialMenuPrincipal.length <= 0 ? MensajeHistorialBusquedaVacio() :GestureDetector(
                    child: Row(
                      children: [
                        SizedBox(height: 8,),
                        TextButton(
                            child:  Align(
                              child: Text("Reciente",
                                //  textAlign: TextAlign.left,
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            )

                        ),

                        Spacer(),
                        TextButton(
                            onPressed:(){
                              setState(() {

                                historialMenuPrincipal.clear();
                              });
                            } ,
                            child:  Align(
                              alignment: Alignment(0.190,-0.80),
                              child: Text("Delete All"

                              ),
                            )

                        )
                      ],
                    ),

                  ),
                  Expanded(
                    child: ListView.builder(

                        itemCount: historialMenuPrincipal.length,
                        itemBuilder: (context,i)
                        {
                          contentPadding: EdgeInsets.symmetric(vertical: 12,horizontal: 16);
                          leading:CircleAvatar(
                            radius: 32,
                            /*     backgroundImage: NetworkImage(
                "https://2.bp.blogspot.com/-3ZzNt8ZsjQk/WR9W4IFn4II/AAAAAAAAAJw/_inTVynhS60V7F5IZ-461-pda7WArTStwCEw/s1600/ANA.jpg"),*/
                          );

                          return  // historialMenuPrincipal.length < 0 ? MensajeHistorialBusquedaVacio():
                            ListTile(
                              /*  username != null ? Text(
                'Welcome $username',
                style: TextStyle(
                    fontFamily: 'Amatic',
                    fontSize: SizeConfig.safeBlockHorizontal * 10),
              ) : CircularProgressIndicator()*/

                              // title: Text(historialMenuPrincipal.length < 0 ?? "Empty Search" ), // tambien este sirve
                                leading: CircleAvatar(
                                  backgroundImage: NetworkImage(
                                      "https://2.bp.blogspot.com/-3ZzNt8ZsjQk/WR9W4IFn4II/AAAAAAAAAJw/_inTVynhS60V7F5IZ-461-pda7WArTStwCEw/s1600/ANA.jpg"),
                                ),
                                onTap: () {
                                 Navigator.push(context,
                                      new MaterialPageRoute(builder:
                                          (context) => new PerfilCliente(historialMenuPrincipal[i]))


                                  );
                                },
                                subtitle: Text(historialMenuPrincipal[i] == null ? "no data" :historialMenuPrincipal[i].gender,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ), // este sirve

                                title: Text(historialMenuPrincipal[i] == null ? "no data" :historialMenuPrincipal[i].gender,
                                  overflow: TextOverflow.ellipsis,
                                  style: TextStyle(fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),


                                trailing:  historialMenuPrincipal[i] != null || historialMenuPrincipal.isEmpty
                                    ? IconButton(
                                  icon: Icon(Icons.cancel,color: Colors.black,),
                                  onPressed: () {
                                    setState(() {
                                      historialMenuPrincipal.remove(historialMenuPrincipal[i]);
                                    });
                                  },): null
                            );
                        }
                    ),

                  ),

                ],
              );



/*return Container(

  child: ListView.builder(
      itemCount: historialMenuPrincipal.length,
      itemBuilder: (context,i)
      {
       contentPadding: EdgeInsets.symmetric(vertical: 12,horizontal: 16);
       leading:CircleAvatar(
          radius: 32,
          backgroundImage: NetworkImage(
              "https://2.bp.blogspot.com/-3ZzNt8ZsjQk/WR9W4IFn4II/AAAAAAAAAJw/_inTVynhS60V7F5IZ-461-pda7WArTStwCEw/s1600/ANA.jpg"),
        );

        return  // historialMenuPrincipal.length < 0 ? MensajeHistorialBusquedaVacio():
      ListTile(
            /*  username != null ? Text(
                'Welcome $username',
                style: TextStyle(
                    fontFamily: 'Amatic',
                    fontSize: SizeConfig.safeBlockHorizontal * 10),
              ) : CircularProgressIndicator()*/

         // title: Text(historialMenuPrincipal.length < 0 ?? "Empty Search" ), // tambien este sirve
             /* leading: CircleAvatar(
                backgroundImage: NetworkImage(
                    "https://2.bp.blogspot.com/-3ZzNt8ZsjQk/WR9W4IFn4II/AAAAAAAAAJw/_inTVynhS60V7F5IZ-461-pda7WArTStwCEw/s1600/ANA.jpg"),
              ),*/
         subtitle: Text(historialMenuPrincipal[i] == null ? "no data" :historialMenuPrincipal[i].email,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ), // este sirve

              title: Text(historialMenuPrincipal[i] == null ? "no data" :historialMenuPrincipal[i].contrasena,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),

           trailing:  historialMenuPrincipal[i] != null || historialMenuPrincipal.isEmpty
                ? IconButton(
      icon: Icon(Icons.cancel,color: Colors.black,),
        onPressed: () {
      setState(() {
      historialMenuPrincipal.remove(historialMenuPrincipal[i]);
      });
      },): null
          );
      }
  ),

);*/
            }
        )
    );

  }

  Widget MensajeHistorialBusquedaVacio(){
    return Container(
      child: new Center(
          child:new Column(
            children: [
              SizedBox(height: 38,),
              Text("No hay resultados en el historial de busqueda")
            ],
          )
      ),
    );
  }

  Widget NoResultadosBusqueda(){
    return Container(
        child:Column(
          children: [
            SizedBox(height: 38,),
            Container(
                child:Align(
                  alignment: Alignment.center,
                  child:  IconButton(
                    icon: Icon(Icons.search_off_outlined,color: Colors.black,),
                  ),
                )
            ),

            Container(
                child:Align(
                    alignment: Alignment.center,
                    child:   Text("No hay Resultado en la Busqueda")
                )
            ),



          ],
        )

    );

  }

  Widget RetornarHistorialB(List <SearchDelegateModel> historialMenuPrincipal,i){
    return Container(
        child: StatefulBuilder(
            builder:(context,setState){
              return Container(
                child: new Column(
                  children: [
                    Text(historialMenuPrincipal[i].gender),//falta hacer otro metodo
                    IconButton(
                      icon: Icon(Icons.cancel,color: Colors.black,),
                      onPressed: () {
                        setState(() {
                          historialMenuPrincipal.remove(historialMenuPrincipal[i]);
                          print(historialMenuPrincipal.length);
                        });
                      },
                    ),

                  ],
                ),
              );
            }

        )



    );

  }

  Widget issmisibleButtonn (List <SearchDelegateModel> historialMenuPrincipal){
    return Container(
        child: StatefulBuilder(
            builder:(context,setState){
              return ListView.separated(
                  itemCount: historialMenuPrincipal.length,
                  separatorBuilder: (context,i) => Divider(color:Colors.black26,height: 2,),
                  // itemBuilder: (context,i) => Actualizarstate(historialMenuPrincipal)
                  itemBuilder: (context,i){
                    return Dismissible(
                        key: UniqueKey(),
                        background: Container(
                          color: Colors.red[400],
                          child: Icon(
                              Icons.delete_outline_rounded
                          ),
                          alignment: Alignment.centerLeft,
                          padding: EdgeInsets.only(right: 10),
                        ),

                        onDismissed:(direction){
                          if(direction == DismissDirection.startToEnd){
                            historialMenuPrincipal.remove(historialMenuPrincipal[i]);
                            print("Dismissible button");

                          }
                        },

                        child:  ListTile(
                          title: Text(historialMenuPrincipal[i]== null? "no hay data":historialMenuPrincipal[i].gender),

                        )

                    );
                  }
              );

            }

        )

    );
  }
}
*/




