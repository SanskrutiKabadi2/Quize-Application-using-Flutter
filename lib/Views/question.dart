import 'package:flutter/material.dart';
import 'package:quize/Models/questionsmodel.dart';
import 'package:quize/Views/result.dart';



class QuestionScreen extends StatefulWidget {
  final String name;
  final int i;

  QuestionScreen({super.key, required this.name, required this.i});

  @override
  _QuestionScreenState createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  late List<Map<String, dynamic>> que;  // Questions list
  int count = 0;
  int selectedAnswerIndex = -1;
  int questionIndex = 0;
  var obj = QuestionsModel();

  @override
  void initState() {
    super.initState();
    que = obj.getQuize(widget.name, widget.i);  // Initialize the question list
  }
    
  WidgetStateProperty<Color?> verifyAnswer(int buttonindex){

    if(selectedAnswerIndex!=-1){

      if(buttonindex==que[questionIndex]["ans"]){

        return const WidgetStatePropertyAll(Colors.green);
      }
      else if(selectedAnswerIndex==buttonindex){
        return const WidgetStatePropertyAll(Colors.red);

      }
      else{
        return const WidgetStatePropertyAll(null);
      }
        
    }
    else{
      return const WidgetStatePropertyAll(null);
    }
  }

  void validateCurrentPage(){
    if(selectedAnswerIndex==-1){
      return;

    }
    if(selectedAnswerIndex==que[questionIndex]["ans"]){
      count++;
    }
    if(selectedAnswerIndex!=-1){
      if(questionIndex==que.length-1){
           
         Navigator.of(context).push(
            MaterialPageRoute(
              builder:(context){
                 return Result(score: count);
              }
            ),
        );
      }else{
      selectedAnswerIndex=-1;
      setState(() {
        questionIndex++;
      });
      }
    }
  }
     
      
      
        

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home:Scaffold(
        body:Container(
          height: double.infinity,
          width:MediaQuery.of(context).size.width,
          decoration:const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomCenter,
              colors: [
                Colors.indigo,
                Colors.purple,
              ],
            ),
          ),
          child:Column(
            crossAxisAlignment: CrossAxisAlignment.end,
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

                        
                        Text("Quize Set ${widget.i+1}",style:const TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.w500
                        ),),
                    ],
                  ),

                
              ),

              Padding(
                padding: const EdgeInsets.all(15),
                child: Container(

                  height: MediaQuery.of(context).size.height*0.6,
                 
                  decoration: BoxDecoration(
                     color: Colors.white,
                    borderRadius: BorderRadius.circular(15),

                  ),
                  child:Column(
                    
                    children: [
                      Container(
                        padding:const EdgeInsets.all(25),
                        
                        child: Expanded(
                        child:Text("${questionIndex+1}. ${que[questionIndex]["question"]}",style:const TextStyle(fontSize: 25,fontWeight:FontWeight.w600)),  
                  ),



                      ),
                      Container(
                       
                        padding:const EdgeInsets.only(right: 25,left: 25) ,
                       
                        child:Column(
                          
                          children: [
                             const SizedBox(height: 15,),
                            Container(
                              height: 50,
                             
                              width:MediaQuery.of(context).size.width, 
                              decoration: BoxDecoration(
                                 color: Colors.white,
                                borderRadius: BorderRadius.circular(25),
                                border: Border.all(color: Colors.black)
                              ), 
                              child :ElevatedButton(
                                 style: ButtonStyle(backgroundColor: verifyAnswer(0)),

                              onPressed: (){
                                if( selectedAnswerIndex==-1){
                                  setState(() {
                                    selectedAnswerIndex=0;
                                  });

                                }
                              },
                              
                              child: Text(que[questionIndex]["options"][0],style: const TextStyle(
                                 fontSize: 15,
                                    color: Colors.black,),
                              ),
                            ),
                            ),

                            const SizedBox(height: 15,),

                            Container(
                              height: 50,
                              width:MediaQuery.of(context).size.width,  
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                border: Border.all(color: Colors.black)
                              ),
                              child :ElevatedButton(
                                 style: ButtonStyle(backgroundColor: verifyAnswer(1)),
                              onPressed: (){
                                if( selectedAnswerIndex==-1){
                                  setState(() {
                                    selectedAnswerIndex=1;
                                  });

                                }
                              },
                              
                              child: Text(que[questionIndex]["options"][1],style: const TextStyle(
                                 fontSize: 15,
                                    color: Colors.black,),
                              ),
                            ),
                            ),

                            const SizedBox(height: 15,),

                            Container(
                              height: 50,
                              width:MediaQuery.of(context).size.width,  
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                border: Border.all(color: Colors.black)
                              ),
                              child :ElevatedButton(
                                 style: ButtonStyle(backgroundColor: verifyAnswer(2)),
                              onPressed: (){
                                if( selectedAnswerIndex==-1){
                                  setState(() {
                                    selectedAnswerIndex=2;
                                  });

                                }
                              },
                              
                              child: Text(que[questionIndex]["options"][2],style: const TextStyle(
                                fontSize: 15,
                                    color:  Colors.black),
                              ),
                            ),
                            ),
                      
                            const SizedBox(height: 15,),
                            Container(
                              height: 50,
                              width:MediaQuery.of(context).size.width,  
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                border: Border.all(color: Colors.black)
                              ),
                              child :ElevatedButton(
                                style: ButtonStyle(backgroundColor: verifyAnswer(3)),
                              onPressed: (){
                                if( selectedAnswerIndex==-1){
                                  setState(() {
                                    selectedAnswerIndex=3;
                                  });

                                }
                              },
                              
                              child: Text(que[questionIndex]["options"][3],style: const TextStyle(
                                 fontSize: 15,
                                    color: Colors.black,),
                              ),
                            ),
                            ),
                      
                            





                          ],
                        ),
                        
                        
                        




                      ),

                    ],




                  ),
                  
                  
                ),
                

              ),
              
              Padding(
              padding: const EdgeInsets.all(20),

              child:FloatingActionButton(onPressed: (){
                   validateCurrentPage();

              },
              child: Icon(Icons.arrow_forward),
              )
              ),

              


            ],
          ),



        ),

      ),

    );


  }
       
}

