import 'package:flutter/material.dart';
import 'package:project/utils/styles.dart';
import 'package:project/widgets/demo_values.dart';

class PostCard extends StatelessWidget {
  const PostCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 5 / 2,
      child: Card(
        child: Column(children: <Widget>[_Post(), _PostDetails()]),
      ),
    );
  }
}

class _Post extends StatelessWidget {
  const _Post({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 3,
      child: Row(
        children: <Widget>[_PostImage(), _PostTitleAndSummary()],
      ),
    );
  }
}

class _PostTitleAndSummary extends StatelessWidget {
  const _PostTitleAndSummary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final String title = DemoValues.postTitle;
    final String summary = DemoValues.postSummary;

    return Expanded(
      flex: 3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Text(title, style: TitleTextStyle, textAlign: TextAlign.center),
          Text(summary, style: SubTextStyle),
        ],
      ),
    );
  }
}

class _PostImage extends StatelessWidget {
  const _PostImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(flex: 2, child: Image.asset(
        DemoValues.postImage,

    )
    );
  }
}

class _PostDetails extends StatelessWidget {
  const _PostDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[_UserImage(), _UserNameAndEmail()],
    );
  }
}

class _UserNameAndEmail extends StatelessWidget {
  const _UserNameAndEmail({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 7,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(DemoValues.userName),
          Text(DemoValues.userEmail),
        ],
      ),
    );
  }
}

class _UserImage extends StatelessWidget {
  const _UserImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: CircleAvatar(
        backgroundImage: AssetImage(
            DemoValues.userImage,


        ),
      ),
    );
  }
}