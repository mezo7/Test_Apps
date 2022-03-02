
import 'package:flutter/material.dart';

Widget defualtButton({
   double width = double.infinity,
   Color background = Colors.blueAccent,
  required Function function,
  required String text,
}) => Container(
width: width,
color: background,
height: 40,
child: MaterialButton(
onPressed: (){
function();
},
child: Text(
text.toUpperCase(),
style: TextStyle(color: Colors.white),
),

),
);


Widget defualtTextFormField({
  required controller,
  required TextInputType type,
  required FormFieldValidator validate,
  required String label,
  required IconData prefixIcon,
  IconButton? suffixIcon,
  bool isPassword = false,
  Function? suffixPressed,
  Function()? onTap,
  bool isClicked = true,


})=>  TextFormField(
controller: controller,
keyboardType: type,
obscureText: isPassword,
decoration: InputDecoration(
labelText: label,
border: OutlineInputBorder(),
prefixIcon: Icon(
prefixIcon,
),
  suffixIcon: suffixIcon,
),
validator: validate,
  onTap: onTap,
  enabled: isClicked,
);


Widget buildTasksItem(Map model) => Padding(
  padding: const EdgeInsets.all(20.0),
  child: Row(
    children: [
      CircleAvatar(
        radius: 40.0,
        child: Text(
          '${model['time']}',
        ),
      ),
      SizedBox(width: 20.0,),
      Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${model['title']}',
            style: TextStyle(
              fontSize: 18.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 5.0,),
          Text(
            '${model['date']}',
            style: TextStyle(
              color: Colors.grey,
            ),
          ),
        ],
      ),

    ],
  ),
);