// ignore_for_file: unnecessary_new

import 'package:flutter/cupertino.dart';

class ImageHolder extends StatefulWidget {
  final String imgUrl;
  final double width;
  final double height;
  const ImageHolder(
      {Key? key,
      required this.imgUrl,
      required this.height,
      required this.width})
      : super(key: key);

  @override
  _ImageHolderState createState() => _ImageHolderState(imgUrl, height, width);
}

class _ImageHolderState extends State<ImageHolder> {
  final String imgUrl;
  final double width;
  final double height;
  _ImageHolderState(this.imgUrl, this.height, this.width);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      constraints: new BoxConstraints(),
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          boxShadow: const [
            BoxShadow(
                offset: Offset(1.0, 2.0),
                blurRadius: 2.0,
                spreadRadius: -1.0,
                color: Color(0x33000000)),
            BoxShadow(
                offset: Offset(2.0, 1.0),
                blurRadius: 3.0,
                spreadRadius: 0.0,
                color: Color(0x24000000)),
            BoxShadow(
                offset: Offset(3.0, 1.0),
                blurRadius: 4.0,
                spreadRadius: 2.0,
                color: Color(0x1f000000))
          ],
          image: new DecorationImage(
              fit: BoxFit.cover, image: new NetworkImage(imgUrl))), // ?? ''
    );
  }
}
