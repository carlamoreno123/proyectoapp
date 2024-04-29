import 'dart:io';
import 'usuario.dart';
import 'database.dart';
class app{

  //Constructores
  
 
  menuInicial(){
    int? opcion;
    do{
      stdout.writeln('''Elige una opción
      1 - Crear usuario
      2 - Log in''');
      String respuesta = stdin.readLineSync() ?? 'e';
      opcion = int.tryParse(respuesta);
    } while( _menuinicialrespuestanovalida ( opcion));
    switch(opcion){
      case 1:
        registrarusuario();
        break;
      case 2:
        login();
        break;

    }
  }
   registrarusuario()async{
     var respuesta;
     var contestacion;
    do{

      stdout.write('''Hola, bienvenido estas apunto de resgistrarte en este centro comercial, porfavor
      rellene estos datos
      1- nombre:
      2-appelido:
      3-direccion:
      4-direccioncorreo:

    ''');
       String respuesta= stdin.readLineSync()?? 'e';
       int.tryParse(respuesta);


    }while(respuesta==null && respuesta!=1 && respuesta!=2  && respuesta!=3 && respuesta!=4 );
    switch(contestacion){
      case 1:
      
        break;
    }

  }
   


   menuLogueado(Usuario usuario) async {
    int? opcion;
    String? nombre = usuario.nombre;
    do{
      stdout.writeln('''Hola, $nombre, elige una opción
      1 - Listar usuarios
      2 - Listar mis mascotas
      3 - insertar mascota
      4-salir
      ''');
      opcion = parsearrespuesta();
    } while(_menulogueadorespuestanovalida ( opcion));
    switch(opcion){
      case 1:
      insertarnombre();
        break;
     
      case 2:
        print('adios!');
      
    }
  }
  login() async {
    Usuario usuario = new Usuario();
    stdout.writeln('Introduce tu nombre de usuario');
    usuario.nombre = stdin.readLineSync();
    stdout.writeln('Introduce tu constraseña');
    usuario.password = stdin.readLineSync();
    var resultado = await usuario.loginUsuario();
    if(resultado == false){
      stdout.writeln('Tu nombre de usuario o contraseña son incorrectos');
      menuInicial();
    } else {
      menuLogueado(resultado);
    }
  }
  insertarnombre() async {
    Usuario nombre = new nombre;
    var conn = await Database().conexion();
    try {
      await conn.query('INSERT INTO usuarios (nombre) VALUES (?)',
          [nombre]);
      print('nombre insertado correctamente');
    } catch (e) {
      print(e);
    } finally {
      await conn.close();
    }
  


  
}
}
  bool _menuinicialrespuestanovalida (var opcion) => opcion == null || opcion != 1 && opcion !=2;
   bool _menulogueadorespuestanovalida (var opcion) =>opcion == null || opcion != 1 && opcion !=2 && opcion !=3 && opcion !=4;
   int? parsearrespuesta() => int.tryParse(stdin.readLineSync()?? 'e');

