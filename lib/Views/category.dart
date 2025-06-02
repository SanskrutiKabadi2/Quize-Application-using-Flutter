import 'package:flutter/material.dart';
import 'package:quize/Views/quizeSets.dart';

class Category extends StatefulWidget{
  const Category({super.key});
  @override
  State createState(){
    return _CategoryState();
  }

}  



class  _CategoryState extends State<Category>{

  List<String> name=["C","Flutter","Java","C++","Python"];
  List<dynamic> img=["assets/C.png","assets/Flutter.png","assets/Java.png","assets/Cpp.png","assets/Python.png"];
 
                    
  @override
  Widget build(BuildContext context) {
    return Scaffold(
            
            body:Container(
                height: double.infinity,
                width:MediaQuery.of(context).size.width,
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors:[
                      Colors.indigo,
                      Colors.purpleAccent,
                    ],
                  ),
                ),
                child:SingleChildScrollView(
                  padding: const EdgeInsets.only(right: 15,left: 15),
                  child:Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height: 60,),
                      
                      const Text("Test Your Skills Now",style:TextStyle(fontSize: 25,fontWeight: FontWeight.w600,color: Colors.white)),
                     
                      const SizedBox(
                        height: 30,
                        ),
                      
                      GridView.builder(
                        shrinkWrap: true,
                        physics:const NeverScrollableScrollPhysics(),
                        padding:const EdgeInsets.all(15),
                        scrollDirection:Axis.vertical ,
                        gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 15,
                          mainAxisSpacing: 15,
                        ), 
                        itemCount: 5,
                        itemBuilder:(context,index){
                          return InkWell(
                            onTap:(){
                              Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder:(context){
                                    return  QuizeList(i:index,name: name[index],);
                                  }
                                  
                                  ),
                            
                              );
                              
                            },

                            child:Container(
                                decoration:BoxDecoration (
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child:Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: [
                                      Padding(
                                        padding: const EdgeInsets.all(10),
                                        child:Image.asset(img[index],
                                            height:100,
                                            width:100,
                                          ), 
                                      ),
                                      Text(name[index],style:TextStyle(fontSize: 22,fontWeight:FontWeight.w600,color: Colors.black.withOpacity(0.6)),),

                                  ],
                                ),
                            ),
                          );
                        },
                      ),  
                    ],
                      
                  ),
                ),
            ),

          
       );
  }


}
     
class Demo extends StatelessWidget{
  const Demo({super.key});
  @override
  Widget build(BuildContext context){

    return Scaffold(
      appBar: AppBar(
        title:const Text("Demo"),
        centerTitle: true,
      ),
      body:Container(
        color: Colors.indigo,
        
         
        
      ),
    );

  }



}