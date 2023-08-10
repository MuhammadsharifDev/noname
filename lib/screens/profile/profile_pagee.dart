import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:noname/screens/profile/model.dart';

import 'bloc/profile_bloc.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileBloc, ProfileState>(
      builder: (context, state) {
        return Scaffold(
          body: state.pageStatus.isLoading?
          const Center(child: CircularProgressIndicator.adaptive(),)
          :state.tasks.isNotEmpty
          ?ListView.builder(
            itemCount: 5,
              itemBuilder: (context, index) {
                MyTask currentTask = state.tasks[index];
                Card(
                  elevation: 3,
                  child: ListTile(
                    leading: Checkbox(
                      onChanged: (bool ? value){
                        context.read<ProfileBloc>().add(CheckTaskEvent(index: index));
                      },
                      value: currentTask.isDone,
                    ),
                    title: Text(currentTask.description),
                    trailing: IconButton(
                      onPressed: (){},
                      icon: IconButton(onPressed: (){
                        context.read<ProfileBloc>().add(DeleteTaskEvent(index: index));
                      },icon: const Icon(Icons.delete,color: Colors.red,),),
                    ),
                  ),
                );
              }
          )
              : Center(
            child:
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text(
                  'No Task',
                  style: TextStyle(fontSize: 30),
                ),
                ElevatedButton(onPressed: (){
                  context.read<ProfileBloc>().add(LoadTaskEvent());
                }, child: const Text('Generate Task'),)
              ],
            ),
          )
        );
      },
    );
  }
}
