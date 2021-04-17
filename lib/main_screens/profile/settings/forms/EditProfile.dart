import 'package:flutter/material.dart';


// Create a Form widget.
class EditProfileForm extends StatefulWidget {
  final VoidCallback onBack;
  const EditProfileForm({Key key, this.onBack}) : super(key: key);
  @override
  EditProfileFormState createState() {
    return EditProfileFormState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class EditProfileFormState extends State<EditProfileForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();

  

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(onPressed: widget.onBack)),
      body: 
      Builder(
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
                labelText: 'Display Name',
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
            child:  TextFormField(
              decoration: InputDecoration(  
                labelText: 'Bio',
              ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter bio';
              }
              return null;
            },
          )
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child:  TextFormField(
              decoration: InputDecoration(  
                labelText: 'Website Link',
              ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter website link';
              }
              return null;
            },
          )
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child:  TextFormField(
              decoration: InputDecoration(  
                labelText: 'Username',
              ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter username';
              }
              return null;
            },
          )
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child:  TextFormField(
              decoration: InputDecoration(  
                labelText: 'Email',
              ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter email';
              }
              return null;
            },
          )
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child:  TextFormField(
              decoration: InputDecoration(  
                labelText: 'Phone Number',
              ),
            validator: (value) {
              if (value.isEmpty) {
                return 'Please enter phone number';
              }
              return null;
            },
          )
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                // Validate returns true if the form is valid, or false
                // otherwise.
                if (_formKey.currentState.validate()) {
                  // If the form is valid, display a Snackbar.
                  Scaffold.of(context)
                      .showSnackBar(SnackBar(content: Text('Processing Data')));
                }
              },
              child: Text('Submit'),
            ),
          ),
        ],
      ),
    ))
    );
  }
}