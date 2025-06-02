import 'package:flutter/material.dart';
import 'package:email_validator/email_validator.dart';
import 'package:quize/sqlite/dbhandler.dart';
import 'package:quize/Models/userModel.dart';
import 'package:quize/Views/login.dart';


class SignUp extends StatelessWidget{

  const SignUp({super.key});

  @override

  Widget build(BuildContext context){
    return const MaterialApp(

      debugShowCheckedModeBanner: false,
      home: SignUpHome(),


    );

  }

}

class SignUpHome extends StatefulWidget {
  const SignUpHome({super.key});

  @override
  State<SignUpHome> createState() => _SignUpState();
}

class _SignUpState extends State<SignUpHome> {

  final firstName = TextEditingController();
  final lastName = TextEditingController();
  final userName = TextEditingController();
  final password = TextEditingController();
  final email= TextEditingController();
  
  bool isVisible = false;
  GlobalKey<FormState> _formKey= GlobalKey<FormState>();

  String? _validateEmail(value){
    if(value!.isEmpty){
      return "email is required";

    }
    else if(!EmailValidator.validate(value)){
      return "enter valid email";

    }
    else{
      return null;
    }


  }

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      
      body:SingleChildScrollView(
        
        
        
         child: Padding(
            padding: const EdgeInsets.all(10),
    
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(height: 100,),
            
                    const Text(
                      "Sign up",
                        style:
                         TextStyle(color: Colors.indigo, fontSize: 35, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 15,
                    ),

                    Text(
                      "Create your account",
                      style:
                         TextStyle(fontSize: 20, color: Colors.grey[800]),
                    ),
                  
                  const SizedBox(height: 10,),
                  Form(
                    key:_formKey ,
                    child:Column(
                      
                      children: [
                          Row(

                                children: [
                                  Expanded(
                                   
                                    child:Container(
                              margin: const EdgeInsets.all(8),
                              padding:
                                const EdgeInsets.symmetric( horizontal:10,vertical:  6),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.deepPurple. withOpacity(.2)),
                              child: TextFormField(
                                controller: firstName,
                                autovalidateMode: AutovalidateMode.onUserInteraction,
                                validator: (value) {
                                    if (value!.isEmpty) {
                                      return "firstname is required";
                                    }
                                    return null;
                                  },
                                decoration: const InputDecoration(
                                  icon: Icon(Icons.person_3_outlined),
                                  border: InputBorder.none,
                                  hintText: "Firstname",
                                ),
                              ),
                            ),
                            ),
                                  
                                   Expanded(
                                    
                                    child:
                                    Container(
                              margin: const EdgeInsets.all(8),
                              padding:
                                const EdgeInsets.symmetric( horizontal:10,vertical:  6),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.deepPurple.withOpacity(.2)),
                              child: TextFormField(
                                controller: lastName,
                                
                                 autovalidateMode: AutovalidateMode.onUserInteraction,
                                validator: (value) {
                                    if (value!.isEmpty) {
                                      return "lastname is required";
                                    }
                                    return null;
                                  },
                                decoration: const InputDecoration(
                                  icon: Icon(Icons.person_3_outlined),
                                  border: InputBorder.none,
                                  hintText: "lastname",
                                ),
                              ),
                            ),
                                  
                                   ),
                                ],

                             ),

                             Container(
                              margin: const EdgeInsets.all(8),
                              padding:
                                const EdgeInsets.symmetric( horizontal:10,vertical:  6),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.deepPurple.withOpacity(.2)),
                              child: TextFormField(
                                controller: userName,
                                 autovalidateMode: AutovalidateMode.onUserInteraction,
                                validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Username is required";
                                    }
                                    return null;
                                  },
                                decoration: const InputDecoration(
                                  icon: Icon(Icons.person),
                                  border: InputBorder.none,
                                  hintText: "username",
                                ),
                              ),
                            ),

                            Container(
                              margin: const EdgeInsets.all(8),
                              padding:
                                const EdgeInsets.symmetric( horizontal:10,vertical:  6),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.deepPurple.withOpacity(.2)),
                              child: TextFormField(
                                controller: email,
                                 autovalidateMode: AutovalidateMode.onUserInteraction,
                                validator:  _validateEmail,
                                decoration: const InputDecoration(
                                  icon: Icon(Icons.email),
                                  border: InputBorder.none,
                                  hintText: "email",
                                ),
                              ),
                            ),

                            

                  //Confirm Password field
                  // Now we check whether password matches or not
                  Container(
                    margin: const EdgeInsets.all(8),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.deepPurple.withOpacity(.2)),
                    child: TextFormField(
                      controller: password,
                       autovalidateMode: AutovalidateMode.onUserInteraction,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "password is required";
                        } 
                        return null;
                      },
                      obscureText: !isVisible,
                      decoration: InputDecoration(
                          icon: const Icon(Icons.lock),
                          border: InputBorder.none,
                          hintText: "Password",
                          suffixIcon: IconButton(
                              onPressed: () {
                                //In here we will create a click to show and hide the password a toggle button
                                setState(() {
                                  //toggle button
                                  isVisible = !isVisible;
                                });
                              },
                              icon: Icon(isVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off))),
                    ),
                  ),

                  const SizedBox(height: 10),
                  //Login button
                  Container(
                    height: 55,
                    width: MediaQuery.of(context).size.width * .9,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: Colors.indigo),
                    child: TextButton(
                        onPressed: () {
                          if(_formKey.currentState!.validate()){

                              
                              final Obj=DBHandler();
                              Obj.signUp(UserModel(

                                firstName: firstName.text,
                                lastName: lastName.text,
                                email: email.text,
                                userName: userName.text,
                                password: password.text


                              )
                              ).whenComplete((){
                               
                                Navigator.of(context).push(MaterialPageRoute(builder: (context){

                                  return const Login();

                                }));


                              });
                              
                          

                        }
                        }, 
                          child: const Text(
                          "SIGN UP",
                          style: TextStyle(color: Colors.white),
                        )),
                  
                  ),

                   Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Already have an account?"),
                      TextButton(
                          onPressed: () {
                              
                                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context){

                                  return const Login();

                                }));
                            
                          },
                          child: const Text("Login", style: TextStyle(color: Colors.indigo),))
                    ],
                  ),

                  const SizedBox(
                    height: 30,
                  ),
                  // const Row(
                  //   mainAxisAlignment: MainAxisAlignment.center,
                  //   children: [
                  //     CircleAvatar(
                  //       maxRadius: 20,
                  //       foregroundImage: AssetImage("assets/google.png"),
                  //     ),
                  //      SizedBox(width: 10,),

                  //     CircleAvatar(
                  //       maxRadius: 20,
                  //       foregroundImage: AssetImage("assets/git.png"),
                  //     ),
                  //     SizedBox(width: 10,),
                  //     CircleAvatar(
                  //       maxRadius: 24,
                  //       foregroundImage: AssetImage("assets/Linkedin.png"),
                  //     ),
                  //   ],
                  // ),
                


               







                      ],
                    ),
                  ),

                ],
            ),
         ),
      ),
    );
  }
}