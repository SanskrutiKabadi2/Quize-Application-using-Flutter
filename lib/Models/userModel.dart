class UserModel{
  final String? firstName;
  final String? lastName;
  final String? email;
  final String userName;
  final String password;

  UserModel({this.firstName,this.lastName,this.email,required this.userName,required this.password});

  Map<String,dynamic> toMap(){

    return {
      "firstName":firstName,
      "lastName":lastName,
      "userName":userName,
      "email":email,
      "password":password,


    };



  }



}