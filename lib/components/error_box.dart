import 'package:flutter/material.dart';

class ErrorBox extends StatelessWidget {

  ErrorBox({ this.message });

  final String? message;

   @override
   Widget build(BuildContext context) {
       if (message == null) return Container();
       return Container(
        padding: EdgeInsets.all(8),
        decoration: BoxDecoration(
          color: Colors.blue,
          borderRadius: BorderRadius.circular(16)),
        child: Row(
          children: [
            Icon(
              Icons.info_outline,
              color: Colors.white,
              size: 40,
            ),
            SizedBox(width: 16,),
            Expanded(
              child: Text(message!,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                ),
              ),
            ),
          ],
        ),
       );
  }
}