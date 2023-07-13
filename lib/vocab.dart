import 'package:flutter/material.dart';

class Vocab extends StatefulWidget {
  const Vocab({super.key});

  @override
  State<Vocab> createState() => _VocabState();
}

class _VocabState extends State<Vocab> {
  List<String> vocabList = [
    'abase',
    'abet',
    'advert',
    'concept',
    'court',
    'fancy',
    'grant',
    'dwell',
    'generate',
    'Justify',
    'Margin'
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: vocabList.length,
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(
              vocabList[index],
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => VocabList(
                    index: index,
                  ),
                ),
              );
            },
          );
        });
  }
}

class VocabList extends StatelessWidget {
  const VocabList({super.key, required this.index});

  final int index;

  @override
  Widget build(BuildContext context) {
    String title = '';
    String meaning = '';

    if (index == 0) {
      title = '\n abase';
      meaning = '\n \n cause to feel shame ';
    } else if (index == 1) {
      title = '\n abet';
      meaning = '\n \n assist or encourage, usually in some wrongdoing';
    } else if (index == 2) {
      title = '\n advert';
      meaning = '\n \n to advert to something means to refer to it.';
    } else if (index == 3) {
      title = '\n concept';
      meaning =
          '\n \n an abstract or general idea inferred from specific instances';
    } else if (index == 4) {
      title = '\n court';
      meaning = '\n \n an assembly to conduct judicial business';
    } else if (index == 5) {
      title = '\n fancy';
      meaning = '\n \nimagine;\nconceive of;\n see in one' 's mind';
    } else if (index == 6) {
      title = '\n grant';
      meaning = '\n \n allow to have';
    } else if (index == 7) {
      title = '\n dwell';
      meaning = '\n \n a think moodily or anxiously about something';
    } else if (index == 8) {
      title = '\n  generate';
      meaning = '\n \n produce or cause';
    } else if (index == 9) {
      title = '\n Justify';
      meaning = '\n \n 	defend, maintain';
    } else if (index == 10) {
      title = '\n Margin';
      meaning = '\n \n edge, gap';
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 51, 184, 66),
        title: Text(
          title,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(
          meaning,
          style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
