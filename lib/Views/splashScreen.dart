import 'package:flutter/material.dart';
import 'package:quize/Views/login.dart';

class SplashScreen extends StatelessWidget {
 const SplashScreen({super.key});
  @override
Widget build(BuildContext context) {
   
    return Scaffold(
      
      body:Container(
               width: MediaQuery.of(context).size.width,
               height:double.infinity ,
               color: const Color.fromARGB(255, 153, 46, 171),
                  
                  
                
              
              
               
               child: 
                  Column(
                    
                  children: [
                    Container(
                        height:MediaQuery.of(context).size.height*0.62,
                        width:MediaQuery.of(context).size.width, 
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(bottomRight: Radius.circular(45.0)),
                          
                       ),

                        
                        child:Center(
                      
                      child: Image.asset("assets/home.png",width: 250,),
                      ),

                    ),
                    
                  

              Container(
               width: MediaQuery.of(context).size.width,
               height:MediaQuery.of(context).size.height*0.38,
               decoration:const BoxDecoration(
                color: Colors.white,
                 
              
              
               ),
               child:Container(
               width: MediaQuery.of(context).size.width,
               height:MediaQuery.of(context).size.height*0.38,
               decoration:const BoxDecoration(
               
                 gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.purple,
                    Colors.indigo,
                  ],
                  
                  
                
              ),
              borderRadius: BorderRadius.only(topLeft: Radius.circular(45.0)),
              
               ),
               child:Column(
                
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                const SizedBox(height: 50,),
                  const Text("Learning is Everything!",style: TextStyle(color: Colors.white,fontSize: 25,fontWeight: FontWeight.w600),),

                  const SizedBox(height: 60,),
                  Container(

                    height: 50,
                    width: 200,

                    child: ElevatedButton(onPressed: (){
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                             builder:(context){
                              return const Login();
                             },
                          ),
                         
                        );
                    }, child:const Text("Get Start",style: TextStyle(fontSize: 20),)),
                  ),
                ],
               ),

              ),
                
               
                
               
              ),
                
                
              
        
                  ],
      ),
    ),
    );
      
  

      

    
  }
}