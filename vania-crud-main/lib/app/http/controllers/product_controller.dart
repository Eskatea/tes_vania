import 'package:belajar_api_vania/app/models/product.dart';
import 'package:vania/vania.dart';

class ProductController extends Controller {
  Future<Response> store(Request request) async {
    try {
      request.validate({
        'name': 'required|string|max_length:100',
        'description': 'required|string|max_length:255',
        'price': 'required|numeric|min:0'
      },{
        'name.required': 'Nama wajib diisi',
        'name.string':'Nama produk harus teks',
        'name.max_length':'Maksimal 100 karakter',
        'description.required':'Deskripsi produk wajib diisi',
        'description.string':'Deskripsi harus berupa teks',
        'description.max_length':'Maksmimal 255 karakter',
        'price.required':'Harga produk wajib diisi',
        'price.numeric':'Harga produk harus berupa angka',
        'price.min':'Harga produk tidak kurang dari 0',
      });
    }
  }

  Future<Response> create(Request request) async {
    try {
      final requestData = request.input();

      return Response.json({
        "message": "Producr berhasil ditambahkan",
        "data": requestData,
      }, 201);
    } catch (e) {
      return Response.json({
        "message": "Error terjadi pada server, silahkan coba lagi nanti",
      },
        500,
      );
    }
  }


  Future<Response> show() async {
    final products = await Product().query().get();
    if (products.isEmpty) {
      return Response.json({
        "message": "daftar product",
        "data": [],
      }, 404);
    }
    return Response.json({
      "message": "daftar product",
      "data": products,
    }, 200);
  }

  Future<Response> update(Request request, int id) async {
    request.validate({
      'name': 'required',
      'description': 'required',
      'price': 'required',
    }, {
      'name.required': 'nama tidak boleh kosong',
      'description.required': 'deskripsi tidak boleh kosong',
      'price.required': 'harga tidak boleh kosong',
    });

    final requestData = request.input();
    requestData['updated_at'] = DateTime.now().toIso8601String();

    final affectedRows =
        await Product().query().where('id', '=', id).update(requestData);
    if (affectedRows == 0) {
      return Response.json({
        "message": "produk dengan id $id tidak di temukan",
      }, 404);
    }

    return Response.json({
      "message": "product berhasil di update",
      "data": requestData,
    }, 200);
  }

  Future<Response> destroy(int id) async {
    final affectedRows =
        await Product().query().where('id', '=', id).delete(id);
    if (affectedRows == 0) {
      return Response.json({
        "message": "produk dengan id $id tidak di temukan",
      }, 404);
    }

    return Response.json({
      "message": "product berhasil di hapus",
    }, 200);
  }
}

final ProductController productController = ProductController();
