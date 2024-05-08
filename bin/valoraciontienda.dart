import 'Database.dart';

class Valoraciontienda {
//propiedades
  int? idvaloracion;
  int? idusuarioadmin;
  String? tiendaperteneciente;
  String? valoraciontienda;

  Valoraciontienda();
  Valoraciontienda.fromMap(map) {
    this.idvaloracion = map['idvaloracion'];
    this.idusuarioadmin = map['idusuario'];
    this.tiendaperteneciente = map['tienda'];
    this.valoraciontienda = map['valoracion'];
  }

  insertarValoracion() async {
    var conn = await Database().conexion();
    try {
      await conn.query(
          'INSERT INTO valoraciones(idusarioadmin,tiendaperteneciente,valoraciontienda) VALUES (?,?,?)',
          [idusuarioadmin, tiendaperteneciente, valoraciontienda]);
      print('Valoracion insertado correctamente');
    } catch (e) {
      print(e);
    } finally {
      await conn.close();
    }
  }
}