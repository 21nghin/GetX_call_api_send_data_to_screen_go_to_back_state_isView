import 'package:flutter_getx_ex1/api/user_api.dart';
import 'package:flutter_getx_ex1/models/users.dart';
import 'package:flutter_getx_ex1/ui/profile_screen.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  List<User> _users = [];
  bool _isLoading = true;

  List<User> get users => _users;

  bool get isLoading => _isLoading;

  @override
  void onInit() {
    super.onInit();
    print('==========> initState HomeController');
  }

  @override
  void onReady() {
    super.onReady();
    print('==========> onReady HomeController');
    this.loadUsers();
  }

  Future<void> loadUsers() async {
    final data = await UsersAPI.instance.getUsers(page: 1);
    this._users = data;
    this._isLoading = false;
    update(['id_user']);
  }

  Future<void> showUserProfile(User user) async {
    var result = await Get.to<bool>(
      ProfileScreen(),
      arguments: user,
    );
    if(result != null){
      result = user.isViewUser = false;
      update(['id_is_view']);
      print(' ==============> loadState isView $result');
    }
  }
}
