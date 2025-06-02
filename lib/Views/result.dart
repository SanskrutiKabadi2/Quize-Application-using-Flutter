import 'package:flutter/material.dart';
import 'package:quize/Views/splashScreen.dart';
import 'package:quize/Views/category.dart';

class Result extends StatelessWidget {
  final int score;
  const Result({super.key,required this.score});

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body:Container(
            height: double.infinity,
            width: MediaQuery.of(context).size.width,
            decoration:const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.indigo,
                  Colors.purple,

                ],
                
              )

            ),
            child:SingleChildScrollView(

              child:  Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 30,
                  ),
                    Row(
                        children: [
                          const SizedBox(
                          width: 10,
                          ),
                          GestureDetector(
                            onTap: (){
                              Navigator.of(context).push(MaterialPageRoute(builder: (context){
                                return const Category();
                              }
                              )
                              );
                            },
                            child:const Icon(Icons.arrow_back_ios,color: Colors.white),
                            ),
                          
                          const Text("Quize Result",style: TextStyle(color: Colors.white, fontSize: 25,fontWeight:FontWeight.w500),),

                        ],
                      ),
                    const SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Container(

                      height: MediaQuery.of(context).size.height*0.6,
                      width:MediaQuery.of(context).size.width ,
                    
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),

                      ),
                      child:Center(
                        child:Column(
                          
                        children: [
                          
                          const SizedBox(
                            height: 60,
                          ),

                          Image.asset("assets/trophy.png"),
                          
                          const Text("Congratulations",style: TextStyle(color: Colors.indigo, fontSize: 25,fontWeight:FontWeight.bold),),
                          const SizedBox(
                            height: 25,
                          ),
                          const Text("Your Score",style: TextStyle(color: Colors.indigo, 
                            fontSize: 20,fontWeight:FontWeight.w400),),
                          const SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("$score",style:const TextStyle(color: Colors.green, fontSize: 35,fontWeight:FontWeight.w500),),
                              Text(" / 10",style: TextStyle(color: Colors.grey[700], fontSize: 35,fontWeight:FontWeight.w500),),
                            ]
                        
                      
                          ),
                        ],
                      ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                    Container(
                    height: 55,
                    width: MediaQuery.of(context).size.width *0.5,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white,),
                    child: TextButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(builder: (context){
                              return const SplashScreen();

                          }));
                        }, 
                          child: Text(
                          "Home",
                          style: TextStyle(fontWeight: FontWeight.w500, fontSize: 20,color: Colors.grey[700]),
                        )),
                  
                  ),
                    
                        
                    ],
                ),
                ),
            
          ),
              );
            
        

      }
    } 

