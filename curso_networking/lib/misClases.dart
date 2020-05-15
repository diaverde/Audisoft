// Clase Review para manejar los datos esperados
class Review {
  final String userTitle;
  final String filmName;
  final String userName;
  final String userPic;
  final String userReview;
  final String filmPic;

  Review({this.userTitle, this.filmName, this.userName, this.userPic, this.userReview, this.filmPic});

  // Convertir de json a clase
  factory Review.fromJson(Map<String, dynamic> json) {
    return Review(
      userTitle: json['UserTitle'],
      filmName: json['FilmName'],
      userName: json['UserName'],      
      userPic: json['UserPic'],
      userReview: json['UserReview'],
      filmPic: json['FilmPic']
    );
  }
}

// Clase Usuario para manejar los datos esperados
class Usuario {  
  String nombre;  
  String alias;
  String email;
  String password;  

  Usuario({this.nombre, this.alias, this.email, this.password});

  // Convertir de clase a json
  Map<String, dynamic> toJson() =>
  {
    'Nombre': nombre,    
    'Alias': alias,
    'Email': email,
    'Password': password,    
  };
}

// Clase ListaReview para manejar los datos esperados
class ListaReview {
  List review;

  ListaReview({this.review});

  // Convertir de json a clase
  factory ListaReview.fromJson(Map<String, dynamic> json) {
    return ListaReview(
      review: json['review']
    );
  } 
  
}