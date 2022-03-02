import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {},
        ),
        title: Text('My App'),
        actions: [
          IconButton(
              icon: Icon(Icons.notification_important), onPressed: () {}),
          IconButton(icon: Icon(Icons.search), onPressed: () {}),
        ],
        elevation: 30.0,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                width: 200.0,
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Stack(
                    alignment: Alignment.bottomCenter,
                    children: [
                      Image(
                        image: NetworkImage(
                            'https://static.pexels.com/photos/36753/flower-purple-lical-blosso.jpg'),
                        width: 200.0,
                        height: 200.0,
                        fit: BoxFit.cover,
                      ),
                      Container(
                        color: Colors.black.withOpacity(0.6),
                        width: double.infinity,
                        padding: EdgeInsetsDirectional.only(
                          start: 10.0,
                          end: 10.0,
                          top: 5.0,
                          bottom: 5.0,
                        ),
                        child: Text(
                          'Flower',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
