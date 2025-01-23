import 'package:bloc_course/bloc/post/post_bloc/post_bloc.dart';
import 'package:bloc_course/bloc/post/post_bloc/post_event.dart';
import 'package:bloc_course/ui/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {

  @override
  void initState() {
  
    super.initState();
    context.read<PostBloc>().add(PostFetched());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Get Api With Bloc"),
        centerTitle: true,
      ),
      body: BlocBuilder<PostBloc, PostState>(
        builder: (context, state){
          switch(state.postStatus){
            case PostStatus.loading:
            return Center(child: CircularProgressIndicator());
            case PostStatus.failure:
            return Text(state.message.toString());
            case PostStatus.success:
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      hintText: "Enter Email",
                      border: OutlineInputBorder(),
                      
                    ),
                    onChanged: (filterKey ){
                      context.read<PostBloc>().add(SearchItem(filterKey));

                    },
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount:state.temPostList.isEmpty? state.postList.length:state.temPostList.length ,
                  itemBuilder: (context, index){
                    if(state.temPostList.isNotEmpty){
                       final item=state.temPostList[index];
                    return Card(
                      child: ListTile(
                        title: Text(item.email.toString()),
                        subtitle: Text(item.body.toString()),
                      ),
                    );
                      
                    }else{
                       final item=state.postList[index];
                    return Card(
                      child: ListTile(
                        title: Text(item.email.toString()),
                        subtitle: Text(item.body.toString()),
                      ),
                    );
                    }
                   
                  
                  
                  }
                  ),
                ),
              ],
            );
          }
         
        }
        ),
    );
  }
}