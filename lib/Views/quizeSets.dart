
import 'package:flutter/material.dart';
import 'package:quize/Views/question.dart';


class QuizeList extends StatelessWidget{
  final String name;
  final int i;
  QuizeList({super.key,required this.i,required this.name});
 

  final List<String> img=["assets/C.png","assets/Flutter.png","assets/Java.png","assets/Cpp.png","assets/Python.png"];

  Widget build(BuildContext context){
    
      return MaterialApp(
        debugShowCheckedModeBanner:false,
        home:Scaffold(
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
               Padding(
                padding:const EdgeInsets.all(10),
                child: 
                  Row(
                    children: [
                        GestureDetector(
                          onTap: (){
                             Navigator.of(context).pop();

                          },
                          child:const Icon(Icons.arrow_back_ios,color: Colors.white,), 
                        ),

                        
                         Text(name,style: const TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.w500
                        ),),
                    ],
                  ),
               ),

                  ListView.builder(
                    shrinkWrap: true,
                    physics:const NeverScrollableScrollPhysics(),
                    itemCount: 5,
                    
                    itemBuilder: (context,index){
                      return Container(
                        height: 70,
                        margin:const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50)

                        ),
                        
                        child:
                          ListTile(
                          contentPadding:const EdgeInsets.all(10),
                            leading: CircleAvatar(backgroundImage:AssetImage(img[i])) ,
                            title:Text("Quize-${index+1}"),
                            trailing:const Icon(Icons.arrow_forward_ios) ,
                            shape: RoundedRectangleBorder(
                            borderRadius:BorderRadius.circular(30) ),
                            
                            
                            onTap: (){
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (context){
                                    return QuestionScreen(name:name,i:index);
                                  }
                                )
                              );
                            },
                        )
                      );
                    }
                    
                    )
                ],
            ),


            ),
            

          ),
        ),
      ); 


  }


}