
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sharing_app/main_screens/spaces/individual_space/individual_space.dart';
import 'dart:io';

class SharePic extends StatefulWidget {
  final VoidCallback onBack;
  const SharePic({Key key, this.onBack}) : super(key: key);

  @override
  _SharePicState createState() => _SharePicState();
}

class _SharePicState extends State<SharePic> {
  PickedFile imageFile;
  

Future getImage(int type) async {
  PickedFile pickedImage = await ImagePicker().getImage(
      source: type == 1 ? ImageSource.camera : ImageSource.gallery,
      imageQuality: 50);
  return pickedImage;
}

void setImage() async{
  final tmpFile = await getImage(2);
  setState(() {
  imageFile = tmpFile;
});
}

  @override
  Widget build(BuildContext context) {
    return  Column(
       mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
      children: [
      Column(
        children: <Widget>[
         Container(
    height: MediaQuery.of(context).size.height * 0.35,
    width: MediaQuery.of(context).size.width,
    decoration: BoxDecoration(
        image: DecorationImage(
            image: imageFile == null
                ? AssetImage('assets/images/insta_logo.png')
                : FileImage(File(imageFile.path)),
            fit: BoxFit.cover)),
  ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () async {
                final tmpFile = await getImage(2);

            setState(() {
              imageFile = tmpFile;
              });
              },
              child: Text('Get Image'),
            ),
            
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child:  TextFormField(
              decoration: InputDecoration(  
                labelText: 'Comment',
              ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Comment';
              }
              return null;
            },
          )
          ),
        ],
      ),
    ]
    );
  }
}
