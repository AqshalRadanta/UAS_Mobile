import 'package:flutter/material.dart';
import 'package:prak_mobile/models/user.dart';
import 'package:prak_mobile/view/screen/profile.dart';
import 'package:prak_mobile/viewmodels/FetchUser.dart';

class ListUser extends StatefulWidget {
  Function setTheme;
  final String? user;
  ListUser({Key? key, required this.setTheme, required this.user}) : super(key: key);

  @override
  State<ListUser> createState() => _ListUserState();
}

class _ListUserState extends State<ListUser> {
  ApiUser apiUser = ApiUser();
  void initState() {
    apiUser.fecthDataUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        leading: IconButton(
            onPressed: (() {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => ProfilePage(setTheme: widget.setTheme, user: widget.user?? "-"),));
            }),
            icon: Icon(Icons.arrow_back_ios)),
        title: Text(
          'User List',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: FutureBuilder<List<User>>(
          future: apiUser.fecthDataUser(),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              print(snapshot.data.toString());
              List<User> user = snapshot.data;
              return ListView.builder(
                itemCount: user.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    child: Card(
                      elevation: 10.0,
                      clipBehavior: Clip.antiAlias,
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 8,
                            ),
                            child: Row(
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 12,
                                  ),
                                  child: Icon(
                                    Icons.person_pin,
                                    size: 32,
                                    color: Colors.deepPurple,
                                  ),
                                ),

                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      user[index].username,
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      user[index].email,
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text('*********'),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      ),
    );
  }
}