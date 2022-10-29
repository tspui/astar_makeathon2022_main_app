import 'package:flutter/material.dart';

import '../model/exercise_list.dart';
import '../screens/instructionpreview.dart';
import '../screens/video_info.dart';

class ExerciseBox extends StatelessWidget {
  const ExerciseBox({Key? key, required this.item}) : super(key: key);
  final Exercise item;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(2),
      height: 140,
      child: Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            GestureDetector(onTap:(){Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => VideoInfo(item: item)),
            );},

                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset("images/" + item.imagePath),
                )),
            Expanded(
                child: Center(
                  child: Container(
                    padding:  EdgeInsets.fromLTRB(20, 5, 20, 5),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            item.title,
                            style: const TextStyle(fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                          Text(item.subtitle),
                        ]),
                  ),
                )),
            GestureDetector(onTap: (){Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => InstrucToPreview(item: item)),
            );},child: Container(margin: const EdgeInsets.all(20), child: Text(item.time),)  )
          ],
        ),
      ),
    );
  }
}
