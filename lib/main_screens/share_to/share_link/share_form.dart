import 'package:flutter/material.dart';

// Create a Form widget.
class ShareLinkForm extends StatefulWidget {
  final VoidCallback onBack;
  const ShareLinkForm({Key key, this.onBack}) : super(key: key);
  @override
  ShareLinkFormState createState() {
    return ShareLinkFormState();
  }
}

// Create a corresponding State class.
// This class holds data related to the form.
class ShareLinkFormState extends State<ShareLinkForm> {
  // Create a global key that uniquely identifies the Form widget
  // and allows validation of the form.
  //
  // Note: This is a GlobalKey<FormState>,
  // not a GlobalKey<MyCustomFormState>.
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Column(children: [
      Builder(
          builder: (context) => Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Website Link',
                          ),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Please enter website link';
                            }
                            return null;
                          },
                        )),
                    Padding(
                        padding: const EdgeInsets.symmetric(vertical: 16.0),
                        child: Text('Select Space')),
                    Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            labelText: 'Comment',
                          ),
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Comment';
                            }
                            return null;
                          },
                        )),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: ElevatedButton(
                        onPressed: () {
                          print('Show Processsing');
                        },
                        child: Text('Submit'),
                      ),
                    ),
                  ],
                ),
              ))
    ]);
  }
}
