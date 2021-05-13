import 'package:ecommerce/Model/user_info.dart';
import 'package:flutter/material.dart';

class UserInfoScreen extends StatefulWidget {
  @override
  _UserInfoScreenState createState() => _UserInfoScreenState();
}

class _UserInfoScreenState extends State<UserInfoScreen> {
  final UserBloc userBloc = new UserBloc();
  @override
  void initState() {
    super.initState();
    userBloc.fetchUser();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: userBloc.getStream,
        builder: (context, AsyncSnapshot<UserInfoModel> snapshot) {
          if (snapshot.hasData) {
            return Scaffold(
              appBar: AppBar(
                backgroundColor: Colors.white,
                title: Text(
                  'Profile',
                  style: TextStyle(color: Colors.blueAccent),
                ),
                centerTitle: true,
              ),
              body: SafeArea(
                child: Center(
                  child: Container(
                    color: Colors.white,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('${snapshot.data.username}'),
                      ],
                    ),
                  ),
                ),
              ),
            );
          }
          return Text('Khong co du lieu');
        });
  }
}
