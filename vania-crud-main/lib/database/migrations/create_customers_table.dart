import 'package:vania/vania.dart';

class CreateUserTable extends Migration {
  @override
  Future<void> up() async {
    super.up();
    await createTableNotExists('customers', () {
      id();
      char('cust_id', length: 5);
      string('cust_name', length: 50);
      string('cust_adress', length: 50);
      string('cust_city', length: 50);
      string('cust_state', length: 50);
      string('cust_zip', length: 50);
      string('cust_country', length: 50);
      char ('cust_telp', length: 50);
      timeStamps();
    });
  }

  @override
  Future<void> down() async {
    super.down();
    await dropIfExists('customers');
  }
}
