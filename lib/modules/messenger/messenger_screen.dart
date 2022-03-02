
import 'package:flutter/material.dart';

class MessengerScreen extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leadingWidth: 0.0,
        backgroundColor: Colors.white,
        elevation: 0.0,
        titleSpacing: 20.0,
        title: Row(
          children: [
            CircleAvatar(radius: 25.0,
            backgroundImage: NetworkImage('https://scontent.fgza2-3.fna.fbcdn.net/v/t1.6435-9/93797102_2606399406349760_1435690898561171456_n.jpg?_nc_cat=102&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=uI_47brtEIEAX8pS_6I&_nc_ht=scontent.fgza2-3.fna&oh=00_AT_zC7n3MLnReTkxf4WhqlnaXm1WFdw6gLJrFPZ-VAKn3A&oe=621A261A'),
            ),
            SizedBox(width: 15.0,),
            Text(
                'Chats',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 24.0,
                ),
            ),
          ],
        ),
        actions: [
          IconButton(
            icon:CircleAvatar(
              radius: 15.0,backgroundColor: Colors.black,
                child: Icon(Icons.camera_alt_rounded,
                  size: 20.0,
                  color: Colors.white,

                ),
            ),
            onPressed: (){},
          ),
          IconButton(
            icon:CircleAvatar(
              radius: 15.0,backgroundColor: Colors.black,
              child: Icon(Icons.edit,
                size: 20.0,
                color: Colors.white,
              ),
            ),
            onPressed: (){},
          ),

        ],
      ),
      body: Container(
        color: Colors.grey[100],
        child: Padding(

          padding: const EdgeInsets.all(20.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(6.0),
                    color: Colors.grey[500],
                  ),
                  padding: EdgeInsets.all(5.0),
                  child: Row(
                    children: [
                      Icon(
                        Icons.search,

                      ),
                      SizedBox(width:15.0,),
                      Text('Search',
                      ),

                    ],
                  ),
                ),
                SizedBox(height: 10.0,),
                Container(
                  height: 100,
                  child: ListView.separated(
                    scrollDirection: Axis.horizontal,
                      itemBuilder: (context , index) => buildStoryItem(),
                    separatorBuilder: (context , index) =>SizedBox(
                      width: 20.0,
                    ),

                    itemCount: 5,
                  ),
                ),
                SizedBox(height: 40.0,),
                ListView.separated(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap:true,
                    itemBuilder: (context, index) =>buildChatItem(),
                    separatorBuilder: (context, index)=>SizedBox(height: 20,), itemCount: 10)

              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildChatItem ()=> Row(
  children: [
  Stack(alignment: AlignmentDirectional.bottomEnd,
  children: [
  CircleAvatar(radius: 30.0,
  backgroundImage: NetworkImage('https://scontent.fgza9-1.fna.fbcdn.net/v/t39.30808-6/230509720_10157991261571806_7531192042848925605_n.jpg?_nc_cat=110&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=pzn1NTtw97UAX_CyoBZ&tn=RyUAePPazrHxjB0f&_nc_ht=scontent.fgza9-1.fna&oh=00_AT-z9kE7WoXmNcW58gRidfjiKW6S70ph8rAUj9eNfaCXWg&oe=61FA0E47'),
  ),
  CircleAvatar(radius: 8.0,
  backgroundColor: Colors.white,),
  CircleAvatar(radius: 7.0,
  backgroundColor: Colors.green,),
  ],
  ),
  SizedBox(width: 20,),
  Expanded(
  child: Column(
  crossAxisAlignment: CrossAxisAlignment.start,
  children: [
  Text(
  'Ibrahim Awwad',
  style: TextStyle(
  fontSize: 16,
  fontWeight: FontWeight.bold,
  ),
  maxLines: 1,
  overflow: TextOverflow.ellipsis,
  ),
  SizedBox(height: 7.0,),
  Row(
  children: [
  Expanded(
  child: Text(
  'Hello! My Name is Ibrhaim Awwad',
  style: TextStyle(fontWeight:FontWeight.bold),
  maxLines: 1,
  overflow: TextOverflow.ellipsis,
  ),
  ),
  Padding(
  padding: const EdgeInsets.symmetric(horizontal: 10.0),
  child: Container(
  width: 8.0,
  height: 8.0,
  decoration: BoxDecoration(
  color: Colors.blueAccent,
  shape: BoxShape.circle,

  ),
  ),
  ),

  Text(
  '02:10 AM'
  ),
  ],
  ),
  ],
  ),
  ),
  ],
  );
  Widget buildStoryItem () => Container(
    width: 60,
    child: Column(
      children: [
        Stack(alignment: AlignmentDirectional.bottomEnd,
          children: [
            CircleAvatar(radius: 30.0,
              backgroundImage: NetworkImage('https://scontent.fgza9-1.fna.fbcdn.net/v/t1.6435-9/174184513_1201219777003364_5667969162401771546_n.jpg?_nc_cat=101&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=AZaIAgTW3zEAX_ZV5BP&_nc_ht=scontent.fgza9-1.fna&oh=00_AT_MnjEPxcHvLl94Shox9WcjjAsfMzJZBPJxD689BkhLpQ&oe=62182E9C'),
            ),
            CircleAvatar(radius: 8.0,
              backgroundColor: Colors.white,),
            CircleAvatar(radius: 7.0,
              backgroundColor: Colors.green,),
          ],
        ),
        SizedBox(height: 6.0,),
        Text(
          'Feras Elyan',
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          textAlign: TextAlign.center,
        ),
        /*SizedBox(width: 15.0,),
                        CircleAvatar(radius: 30.0,
                          backgroundImage: NetworkImage('https://scontent.fgza9-1.fna.fbcdn.net/v/t39.30808-6/230509720_10157991261571806_7531192042848925605_n.jpg?_nc_cat=110&ccb=1-5&_nc_sid=09cbfe&_nc_ohc=pzn1NTtw97UAX_CyoBZ&tn=RyUAePPazrHxjB0f&_nc_ht=scontent.fgza9-1.fna&oh=00_AT-z9kE7WoXmNcW58gRidfjiKW6S70ph8rAUj9eNfaCXWg&oe=61FA0E47'),
                        ),*/
      ],
    ),
  );

}
