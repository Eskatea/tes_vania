import 'package:vania/vania.dart';

class CreateOrderitemsTable extends Migration {
  @override
  Future<void> up() async {
    super.up();
    await createTableNotExists('createordersitems', () {});

}
  @override
  Future<void> down() async {
    super.down();
    await dropIfExists('CreateOrderItems');
  }
}