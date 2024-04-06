// ignore_for_file: sort_child_properties_last, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart'; 
import 'package:form_field_validator/form_field_validator.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:vms/home_page.dart'; 


class Register extends StatefulWidget { 
const Register({Key? key}) : super(key: key); 

@override 
State<Register> createState() => _RegisterState(); 
} 

class _RegisterState extends State<Register> { 

  @override
  void initState() {
    super.initState();
  }


  void setPreference() async {
  
  SharedPreferences prefs = await SharedPreferences.getInstance();
   
   prefs.setString('registerd','true');
}

Map userData = {}; 
final _formkey = GlobalKey<FormState>(); 



 String? dropDownValue;
 String selectedValue = 'Option 1'; // Initial selected value

@override 
Widget build(BuildContext context) { 
	return Scaffold( 
		appBar: AppBar( 
		title: Text('register'), 
		), 
		body: SingleChildScrollView( 
		child: Padding( 
			padding: const EdgeInsets.all(12.0), 
			child: Form( 
				key: _formkey, 
				child: Column( 
				crossAxisAlignment: CrossAxisAlignment.start, 
				children: <Widget>[ 
					Padding( 
					padding: const EdgeInsets.only(top: 20.0), 
					child: Center( 
						child: Container( 
						width: 50, 
						height: 50, 
						child: Icon(Icons.person,
            size: 32,), 
						), 
					), 
					), 

          Padding( 
					padding: const EdgeInsets.all(12), 
					child: 

              DropdownButtonFormField<String>(
                autovalidateMode: AutovalidateMode.always,
                value: dropDownValue,
                items: <String>['A', 'B', 'C', 'D'].map(
                  (String label) {
                    return DropdownMenuItem<String>(
                      value: label,
                      child: Text(
                        label,
                      ),
                    );
                  },
                ).toList(),
                hint: const Text("Choose title"),
                onChanged: (String? value) {
                  dropDownValue = value;
                  setState(() {});
                },
                validator: (String? value) {
                  return value == null ? "Choose item from list" : null;
                },
              ),),

     RadioListTile<String>(
          title: Text('Option 1'),
          value: 'Option 1',
          groupValue: selectedValue,
          onChanged: (String? value) {
            setState(() {
             selectedValue = value!;
            });
          },
        ),
        RadioListTile<String>(
          title: Text('Option 2'),
          value: 'Option 2',
          groupValue: selectedValue,
          onChanged: (value) {
            setState(() {
              selectedValue = value!;
            });
          },
        ), 



					Padding( 
					padding: const EdgeInsets.all(12.0), 
					child: TextFormField( 
						validator: ((value) { 
						if (value == null || value.isEmpty) { 
							 return 'please enter some text'; 
						} else if (value.length < 5) { 
							 return 'Enter atleast 5 Charecter'; 
						} 

						return null; 
						}),
            decoration: InputDecoration( 
							hintText: 'Enter first Name', 
							labelText: 'first named', 
							prefixIcon: Icon( 
							Icons.person, 
							color: Colors.green, 
							), 
							errorStyle: TextStyle(fontSize: 18.0), 
							border: OutlineInputBorder( 
								borderSide: BorderSide(color: Colors.red), 
								borderRadius: 
									BorderRadius.all(Radius.circular(9.0)))), 
					), 
					), 
					Padding( 
					padding: const EdgeInsets.all(8.0), 
					child: TextFormField( 
						validator: MultiValidator([ 
						RequiredValidator(errorText: 'Enter last named'), 
						MinLengthValidator(3, 
							errorText: 
								'Last name should be atleast 3 charater'), 
						]), 
						decoration: InputDecoration( 
							hintText: 'Enter last Name', 
							labelText: 'Last named', 
							prefixIcon: Icon( 
							Icons.person, 
							color: Colors.grey, 
							), 
							errorStyle: TextStyle(fontSize: 18.0), 
							border: OutlineInputBorder( 
								borderSide: BorderSide(color: Colors.red), 
								borderRadius: 
									BorderRadius.all(Radius.circular(9.0)))), 
					), 
					), 
					Padding( 
					padding: const EdgeInsets.all(8.0), 
					child: TextFormField( 
						validator: MultiValidator([ 
						RequiredValidator(errorText: 'Enter email address'), 
						EmailValidator( 
							errorText: 'Please correct email filled'), 
						]), 
						decoration: InputDecoration( 
							hintText: 'Email', 
							labelText: 'Email', 
							prefixIcon: Icon( 
							Icons.email, 
							color: Colors.lightBlue, 
							), 
							errorStyle: TextStyle(fontSize: 18.0), 
							border: OutlineInputBorder( 
								borderSide: BorderSide(color: Colors.red), 
								borderRadius: 
									BorderRadius.all(Radius.circular(9.0)))), 
					), 
					), 
					Padding( 
					padding: const EdgeInsets.all(8.0), 
					child: TextFormField( 
						validator: MultiValidator([ 
						RequiredValidator(errorText: 'Enter mobile number'), 
						MaxLengthValidator(10,
							errorText: 'enter vaid mobile number'), 
            MinLengthValidator(10,
							errorText: 'enter vaid mobile number'),
						]), 
						decoration: InputDecoration( 
							hintText: 'Mobile', 
							labelText: 'Mobile', 
							prefixIcon: Icon( 
							Icons.phone, 
							color: Colors.grey, 
							), 
							border: OutlineInputBorder( 
								borderSide: BorderSide(color: Colors.red), 
								borderRadius: 
									BorderRadius.all(Radius.circular(9)))), 
					), 
					), 
          					Padding( 
					padding: const EdgeInsets.all(12.0), 
					child: TextFormField( 
             keyboardType: TextInputType.text,
             
						// validator: ((value) { 
						// if (value == null || value.isEmpty) { 
						//	 return 'please enter some text'; 
						// } else if (value.length < 5) { 
						//	 return 'Enter atleast 5 Charecter'; 
						// } 

						// return null; 
						// }), 
						validator: MultiValidator([ 
						RequiredValidator(errorText: 'Password is Required'), 
						MinLengthValidator(3, 
							errorText: 'Minimum 3 charecter filled name'), 
						]), 
						decoration: InputDecoration( 
							hintText: 'Enter Password', 
							labelText: 'Enter Password', 
							prefixIcon: Icon( 
							Icons.person, 
							color: Colors.green, 
							), 
							errorStyle: TextStyle(fontSize: 18.0), 
							border: OutlineInputBorder( 
								borderSide: BorderSide(color: Colors.red), 
								borderRadius: 
									BorderRadius.all(Radius.circular(9.0)))), 
					), 
					),
					Center( 
						child: Padding( 
					padding: const EdgeInsets.all(18.0), 
					child: Container( 
           
						// margin: EdgeInsets.fromLTRB(200, 20, 50, 0), 
						child: ElevatedButton( 
               style: ElevatedButton.styleFrom(
                backgroundColor: Color.fromARGB(255, 42, 79, 210),
  ),
              
						child: Text( 
							'Register', 
							style: TextStyle(color: Colors.white, fontSize: 22), 
						), 
						onPressed: () { 
							if (_formkey.currentState!.validate()) { 


           setPreference();
					 Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => MyHomePage(title: '')
                // builder: (context) =>Register()



                ));





							} 
						}, 
					
					
						), 

						width: MediaQuery.of(context).size.width, 

						height: 50, 
					), 
					)), 


			
			
//       Row(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [


//  Text("Or"),


//         ],


//       ),
      
      
      // Center( 
			// 		child: Container( 
			// 			padding: EdgeInsets.only(top: 60), 

			// 			child: 
      //       TextButton(
      //         onPressed: (){



      //         },
      //         child:  Text( 
			// 			'SIGN IN', 
			// 			style: TextStyle( 
			// 				fontSize: 20, fontWeight: FontWeight.bold), 
			// 			),)
            
            
            
            
           
			// 		), 
			// 		),



				], 
				)), 
		), 
		)
    
    
    ); 
} 
} 
