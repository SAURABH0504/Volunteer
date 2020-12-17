import 'package:flutter/material.dart';
import 'package:myapp/Service/NGOservice.dart';

class NGOList extends StatefulWidget {
  @override
  _NGOListState createState() => _NGOListState();
}

class _NGOListState extends State<NGOList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: getNGO(),
          builder: (context,snapshot){
            if(snapshot.connectionState == ConnectionState.done){
              return CircleAvatar(
                backgroundColor: Colors.white,
                child: snapshot.data,
                radius: 30,
              );
            }
            if(snapshot.connectionState==ConnectionState.waiting){
              return CircularProgressIndicator();
            }
            return Container();
          }
      ),
    );
  }
  getNGO()async{
    var service = NGOService();
    var ngo = await service.getAllNGO();
    return ListView.builder(
      scrollDirection: Axis.vertical,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return Card(
          child: Column(
            children: [
              Image(image: NetworkImage(ngo[index].imageUrl),),
              Text(ngo[index].name),
              Text(ngo[index].description),
            ],
          ),
        );
      },
      itemCount: ngo.length,
    );
  }
}
