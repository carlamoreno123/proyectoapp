import 'Database.dart';

class Valoraciontienda {
//propiedades
  int? idvaloracion;
  String?idusuario;
  String? tiendaperteneciente;
  String? valoraciontienda;

  Valoraciontienda();
  Valoraciontienda.fromMap(map) {
    this.idvaloracion = map['idvaloracion'];
    this.idusuario= map['idusuario'];
    this.tiendaperteneciente = map['tiendaperteneciente'];
    this.valoraciontienda = map['valoraciontienda'];
  }

  allvaloracion()async{
    var conn = await Database().conexion();

    try {
      var resultado = await conn.query('SELECT * FROM usuarios');
      List<Valoraciontienda> usuarios =
          resultado.map((row) => Valoraciontienda.fromMap(row)).toList();
      return usuarios;
    } catch (e) {
      print(e);
    } finally {
      await conn.close();
    }
  }
  insertarValoracion() async {
    var conn = await Database().conexion();
    try {
      await conn.query(
          'INSERT INTO valoraciones(idusario,tiendaperteneciente,valoraciontienda) VALUES (?,?,?)',
          [idusuario, tiendaperteneciente, valoraciontienda]);
      print('Valoracion insertada correctamente');
    } catch (e) {
      print(e);
    } finally {
      await conn.close();
    }
  }
}
