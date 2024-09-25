import 'package:flutter/material.dart';

class UserTile extends StatelessWidget {
  final String text;
  final void Function()? ontap;
  const UserTile({
    super.key,
    required this.text,
    required this.ontap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.tertiary,
          borderRadius: BorderRadius.circular(12),
        ),
        margin: EdgeInsets.symmetric(vertical: 10,horizontal: 25),
        padding: EdgeInsets.all(20),
        child: Row(
          children: [
            Icon(Icons.person),
            SizedBox(width: 20,),
            Text(text),
          ],
        ),
      ),
    );
  }
}
