import 'package:flutter/material.dart';
import 'package:test_app/models/user/user_model.dart';



class UserScreen extends StatelessWidget {
  List<UserModle> users = [
    UserModle(id: 1, name: 'Mohammed Awwad', phone: '+97059213768'),
    UserModle(id: 2, name: 'Feras Elyan', phone: '+97059213651'),
    UserModle(id: 3, name: 'Abood Kollab', phone: '+97059219468'),
    UserModle(id: 4, name: 'Alaa Morjan', phone: '+97059285264'),
    UserModle(id: 5, name: 'Mohammed Abu Sharekh', phone: '+97059256238'),
    UserModle(id: 6, name: 'Hossny Mhana', phone: '+97059213768'),
    UserModle(id: 7, name: 'hassan jamal', phone: '+9705786768'),
    UserModle(id: 8, name: 'Mohammed Elyan', phone: '+9705925568'),
    UserModle(id: 9, name: 'Mohammed Awwad', phone: '+97059213768'),
    UserModle(id: 10, name: 'Mohammed Awwad', phone: '+97059213768'),
    UserModle(id: 11, name: 'Mohammed Awwad', phone: '+97059213768'),
    UserModle(id: 12, name: 'Mohammed Awwad', phone: '+97059213768'),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Users'),
      ),
      body: ListView.separated(
        itemBuilder: (context, index) => buildUserItem(users[index]),
        separatorBuilder: (context, index) => Padding(
          padding: const EdgeInsetsDirectional.only(
            start: 20,
          ),
          child: Container(
            width: double.infinity,
            height: 1.0,
            color: Colors.grey[300],
          ),
        ),
        itemCount: users.length,
      ),
    );
  }

  Widget buildUserItem(UserModle user) => Padding(
        padding: const EdgeInsets.all(15.0),
        child: Row(
          children: [
            CircleAvatar(
              radius: 25.0,
              child: Text(
                '${user.id}',
                style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              width: 20.0,
            ),
            Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${user.name}',
                  style: TextStyle(fontSize: 25.0, fontWeight: FontWeight.bold),
                ),
                Text(
                  '${user.phone}',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ],
        ),
      );
}
