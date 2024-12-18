import 'package:vania/vania.dart';

class CreateProductnotesTable extends Migration {
  @override
  Future<void> up() async {
    super.up();
    await createTableNotExists('productnotes', (){

    });

    @override
    Future<void> down() async {
      super.down();
      await dropIfExists('productnotes');
    }
  }
}