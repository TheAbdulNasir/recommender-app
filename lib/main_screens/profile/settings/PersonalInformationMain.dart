import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:sharing_app/main_screens/profile/settings/forms/EditProfile.dart';

class PersonalInformationMain extends StatelessWidget {
  void _editProfile(context){
     Navigator.of(context).push(
          MaterialPageRoute(
          builder: (_) => EditProfileForm(),
        ),
      );
  }

   void _editAccountInformation(){
    print('edit account information');
  }
  
  @override
  Widget build(BuildContext context) {
    return Column (
        children: <Widget> [ 
           Align(
            alignment: Alignment.centerLeft,
             child: Container(
                  child: Text(
                  "Personal Information",
                  style: TextStyle(fontWeight: FontWeight.bold)
                ),
            ),
            ),
           Container ( 
             width: MediaQuery.of(context).size.width,
             child: Row(  
             mainAxisAlignment: MainAxisAlignment.start,
             children: [ 
               new SizedBox(
                          width: 10.0,
                ),
                Expanded(
                        child:  Text('Edit Profile'),
                      ),
              Row(  
                mainAxisAlignment: MainAxisAlignment.end,
                children: [ 
                    GestureDetector(
                            onTap: () {
                            _editProfile(context);
                          },
                          child: new Icon(FontAwesomeIcons.chevronRight,
                          color: Colors.black,)
                          ),
                          new SizedBox(
                          width: 10.0,
                          )
                ],
              )
             ]
           )
           ),
           Align(
            alignment: Alignment.centerLeft,
             child: Container(
                  child: Text(
                  "Account Information",
                  style: TextStyle(fontWeight: FontWeight.bold)
                ),
            ),
            ),
           Container ( 
             width: MediaQuery.of(context).size.width,
             child: Row(  
             mainAxisAlignment: MainAxisAlignment.start,
             children: [ 
               new SizedBox(
                          width: 10.0,
                ),
                Expanded(
                        child:  Text('Account Settings'),
                      ),
              Row(  
                mainAxisAlignment: MainAxisAlignment.end,
                children: [ 
                    GestureDetector(
                            onTap: () {
                            _editAccountInformation();
                          },
                          child: new Icon(FontAwesomeIcons.chevronRight,
                          color: Colors.black,)
                          ),
                          new SizedBox(
                          width: 10.0,
                          )
                ],
              )
             ]
           )
           )
           
        ]
      );
  }
}