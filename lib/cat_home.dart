import 'package:cat_facts/bloc_and_cubits/cat_bloc/cat_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CatHome extends StatelessWidget {
  CatHome({Key? key}) : super(key: key);
  bool catFact = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text('Cat Facts'),
        backgroundColor: Colors.purpleAccent,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<CatBloc, CatState>(
            builder: (context, state) {
              if (catFact == true) {
                if (state is FactLoadingState) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: Colors.purpleAccent,
                    ),
                  );
                } else if (state is FactLoadedState) {
                  return Center(
                    child: Card(
                      elevation: 7,
                      shadowColor: Colors.white,
                      margin: EdgeInsets.all(13),
                      child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Text(
                            state.catFact.fact,
                            style: TextStyle(fontSize: 20),
                          )),
                    ),
                  );
                } else if (state is FailedToLoadFactState) {
                  return Center(
                    child: Text(state.error.toString()),
                  );
                }
              }
              return Center(
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 120,
                        child: Image.asset('assets/images/cat_icon.png'),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'CatFacts',
                        style:
                            TextStyle(fontSize: 30, color: Colors.purpleAccent),
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.purpleAccent,
            ),
            onPressed: () {
              context.read<CatBloc>().add(LoadFactEvent());
              print(catFact.toString());
              catFact = true;
              print(catFact.toString());
            },
            child: Text('Meow To Get A Cat Fact'),

          ),
        ],
      ),
    );
  }
}
