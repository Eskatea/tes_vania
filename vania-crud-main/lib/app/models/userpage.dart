import 'package:belajar_api_vania/app/models/user_model.dart';
import 'package:belajar_api_vania/app/models/userservice.dart';

class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<_UserPageState> createState() => _UserPageStateState();
}

class _UserPageStateState extends State<_UserPageState> {
  List<UserModel> listUser = <UserModel>[];
  final Userservice userService = Userservice();

  @override
  void initState() {
    super.initState();
    getDataUser();
  }

  void getDataUser() async {
    List<UserModel> listUserTemp = await userService.fetchUsers();
    if (listUserTemp.isNotEmpty) {
      setState(() {
        listUser = listUserTemp;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Users',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
          ),
        ),
      body: SafeArea(
        child: ListView.separated(
          itemBuilder: (context, index) => ListTile(
            leading: ClipOval(
              child: Image.network(
              listUser[index].avatar ?? '-',
              width: 52,
              height: 52,
              fit: BoxFit.cover
              ),
            ),
            title: Text(
              '${listUser[index].firstName} ${listUser[index].lastName}',
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
              ),
            ),
            subtitle: Text(
              listUser[index].email ?? '',
              style: const TextStyle(
                fontSize: 12,
              ),
            ),
          separatorBuilder: (context, index) => const Divider(
            height: 0.0,
    ),
    itemCount: listUser.length,
    shrinkWrap: true,
    physics: const BouncingScrollPhysics(),
    padding: const EdgeInsets.symmetric(vertical: 16),
        ),
      ),
    );
  }
}


