class NGO{
  String name;
  String description;
  String location;
  String imageUrl;

  NGO({this.name,this.imageUrl,this.description,this.location});

  Map<String,dynamic> toMap(){
    return {
      'name' : name,
      'description' : description,
      'location' : location,
      'ImageUrl'  : imageUrl,
    };
  }
  NGO.fromFirestore(Map<String,dynamic> firestore)
      : name = firestore['name'],
        description = firestore['description'],
        location = firestore['location'],
        imageUrl = firestore['ImageUrl'];
}