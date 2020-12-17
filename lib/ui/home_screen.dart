import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getx_ex1/controller/home_controller.dart';
import 'package:flutter_getx_ex1/models/users.dart';
import 'package:get/state_manager.dart';

class MyHomePage extends StatelessWidget {
  final String title;

  MyHomePage({this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: GetBuilder<HomeController>(
        id: 'id_user',
        init: HomeController(),
        builder: (controller) {
          print('======================> builder');
          if (controller.isLoading) {
            return Center(
              child: CupertinoActivityIndicator(animating: true, radius: 15),
            );
          }
          return CustomScrollView(
            physics: BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            slivers: [
              CupertinoSliverRefreshControl(
                onRefresh: controller.loadUsers,
              ),
              SliverList(
                delegate: SliverChildListDelegate([
                  ListView.builder(
                    itemBuilder: (context, index) => _buildItem(context, index, controller),
                    itemCount: controller.users.length,
                    physics: NeverScrollableScrollPhysics(),
                    primary: false,
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                  ),
                ]),
              )
            ],
          );
        },
      ),
    );
  }

  Widget _buildItem(
      BuildContext context, int index, HomeController controller) {
    final User user = controller.users[index];
    return ListTile(
      leading: GetBuilder<HomeController>(
        id: 'id_is_view',
        init: HomeController(),
        builder: (_) => Visibility(
          visible: user.isViewUser,
          child: Container(
            transform: Matrix4.translationValues(0, 12, 0),
            height: 15,
            width: 15,
            decoration: BoxDecoration(
                color: Colors.red, borderRadius: BorderRadius.circular(15)),
          ),
        ),
      ),
      title: Container(
        transform: Matrix4.translationValues(-25, 0, 0),
        child: Text(user.firstName),
      ),
      subtitle: Container(
        transform: Matrix4.translationValues(-25, 0, 0),
        child: Text(user.email),
      ),
      onTap: () => controller.showUserProfile(user),
    );
  }
}
