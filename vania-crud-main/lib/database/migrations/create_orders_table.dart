import 'package:vania/vania.dart';

class CreateOrdersTable extends Migration {
  @override
  Future<void> up() async {
    super.up();
    await createTableNotExists('createorders', () {});

  }

  @override
  Future<void> down() async {
    super.down();
    await dropIfExists('CreateOrder');
  }
}