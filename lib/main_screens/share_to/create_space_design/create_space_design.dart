import 'package:flutter/material.dart';


// Create a Form widget.
class CreateSpaceForm extends StatefulWidget {
  @override
  CreateSpaceFormState createState() {
    return CreateSpaceFormState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class CreateSpaceFormState extends State<CreateSpaceForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();

  void _createSpace(){
    print('create space');
  }


  

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Builder(
        builder: (context) => Form(
      key: _formKey,
      child: ListView(
        children: <Widget>[
          Center(
                child: Container(
                  height: 100.0,
                  width: 100.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(
                            "https://techcommunity.microsoft.com/t5/image/serverpage/image-id/217078i525F6A9EF292601F/image-size/large?v=1.0&px=999")),
                  ),
                ),
              ),
           Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child:  TextFormField(
              decoration: InputDecoration(  
                labelText: 'Space Name',
              ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please Enter Display Name';
              }
              return null;
            },
          )
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: Center(child: SizedBox( 
              width: MediaQuery.of(context).size.width *.75,
              child:ElevatedButton(
              onPressed: () {
                _createSpace();
              },
              child: Text('Create Space'),
            )
            )
            ),
          ),
        ],
      ),
    ));
  }
}