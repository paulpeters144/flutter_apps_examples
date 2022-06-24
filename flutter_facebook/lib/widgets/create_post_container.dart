import 'package:flutter/material.dart';
import 'package:flutter_facebook_responsive_ui/models/models.dart';
import 'package:flutter_facebook_responsive_ui/widgets/widgets.dart';

class CreatePostContainer extends StatelessWidget {
  final User currentUser;

  const CreatePostContainer({
    Key key,
    @required this.currentUser,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isDesktop = Responsive.isDesktop(context);
    return Card(
      margin: EdgeInsets.symmetric(horizontal: isDesktop ? 5.0 : 0.0),
      elevation: isDesktop ? 1.0 : 0.0,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius:
              isDesktop ? BorderRadius.all(Radius.circular(10)) : null,
        ),
        padding: const EdgeInsets.fromLTRB(12.0, 8.0, 12.0, 0.0),
        child: Column(
          children: [
            Row(
              children: [
                ProfileAvatar(imageUrl: currentUser.imageUrl),
                const SizedBox(width: 8.0),
                Expanded(
                  child: TextField(
                    decoration: InputDecoration.collapsed(
                      hintText: 'What\'s on your mind?',
                    ),
                  ),
                )
              ],
            ),
            const Divider(height: 10.0, thickness: 0.5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  style: TextButton.styleFrom(
                    minimumSize: Size(20, 20),
                    padding: EdgeInsets.all(0),
                  ),
                  onPressed: () {},
                  child: Row(
                    children: [
                      Icon(Icons.videocam, color: Colors.red),
                      SizedBox(width: 5.0),
                      Text('Live')
                    ],
                  ),
                ),
                VerticalDivider(width: 8.0),
                TextButton(
                  style: TextButton.styleFrom(
                    minimumSize: Size(20, 20),
                    padding: EdgeInsets.all(0),
                  ),
                  onPressed: () {},
                  child: Row(
                    children: [
                      Icon(Icons.photo_library, color: Colors.green),
                      SizedBox(width: 5.0),
                      Text('Photo')
                    ],
                  ),
                ),
                VerticalDivider(width: 8.0),
                TextButton(
                  style: TextButton.styleFrom(
                    minimumSize: Size(20, 20),
                    padding: EdgeInsets.all(0),
                  ),
                  onPressed: () {},
                  child: Row(
                    children: [
                      Icon(Icons.video_call, color: Colors.purpleAccent),
                      SizedBox(width: 5.0),
                      Text('Room')
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
