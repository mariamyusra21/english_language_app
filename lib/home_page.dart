import 'package:flutter/material.dart';
import 'package:language_app/quiz.dart';

import 'vocab.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  TabController? tabController;
  Quiz quiz = Quiz();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(255, 51, 184, 66),
          title: Text(
            "Learn English Basics",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          bottom: TabBar(controller: tabController, tabs: [
            Tab(
              child: Text(
                "Lessons",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            Tab(
              child: Text(
                "Quizzes",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
            Tab(
              child: Text(
                "Vocabulary",
                style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            )
          ]),
          centerTitle: true,
        ),
        body: TabBarView(
          controller: tabController,
          children: [
            // LessonsTab
            Container(
              child: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 51, 184, 66),
                        foregroundColor: Colors.white),
                    onPressed: () {
                      lesson1();
                    },
                    child: Text(
                      'Lesson 1',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                    ),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 51, 184, 66),
                        foregroundColor: Colors.white),
                    onPressed: () {
                      lesson2();
                    },
                    child: Text(
                      'Lesson 2',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                    ),
                  ),
                  TextButton(
                    style: TextButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 51, 184, 66),
                        foregroundColor: Colors.white),
                    onPressed: () {
                      lesson3();
                    },
                    child: Text(
                      'Lesson 3',
                      style:
                          TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                    ),
                  ),
                ],
              )),
            ),

            // Quizzes Tab
            QuizPage(),
            //Vocab Tab
            Expanded(child: Vocab())
          ],
        ));
  }

  void lesson1() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              "Lesson 1 Noun",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            content: Text(
                'A noun is the name of a person, place, thing, or idea.\nExample:  man... Butte College... house... happiness...\nA noun is a word for a person, place, thing, or idea. \nNouns are often used with an article (the, a, an), but not always. \nProper nouns always start with a capital letter; common nouns do not. \nNouns can be singular or plural, concrete or abstract. \nNouns show possession by adding \'s.\nNouns can function in different roles within a sentence; for example, a noun can be a subject, direct object, indirect object, subject complement, or object of a preposition.',
                style: TextStyle(fontSize: 18)),
            actions: [
              TextButton(
                child: Text("Back",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Color.fromARGB(255, 51, 184, 66),
                    )),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ],
          );
        });
  }

  void lesson2() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              "Lesson 2 Pronoun",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            content: Text(
                'A pronoun is a word used in place of a noun.\nExample:  She... we... they... it\nA pronoun is a word used in place of a noun. \nA pronoun is usually substituted for a specific noun, which is called its antecedent. \nIn the sentence above, the antecedent for the pronoun she is the girl. \nPronouns are further defined by type: personal pronouns refer to specific persons or things; \npossessive pronouns indicate ownership; \nreflexive pronouns are used to emphasize another noun or pronoun; \nrelative pronouns introduce a subordinate clause; \nand demonstrative pronouns identify, point to, or refer to nouns.',
                style: TextStyle(fontSize: 18)),
            actions: [
              TextButton(
                child: Text("Back",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Color.fromARGB(255, 51, 184, 66),
                    )),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ],
          );
        });
  }

  void lesson3() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              "Lesson 3 Verb",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            content: Text(
              'A verb expresses action or being.\njump... is... write... become...\nThe verb in a sentence expresses action or being. \nThere is a main verb and sometimes one or more helping verbs. \n("She can sing." Sing is the main verb; can is the helping verb.) \nA verb must agree with its subject in number (both are singular or both are plural). \nVerbs also take different forms to express tense.',
              style: TextStyle(fontSize: 18),
            ),
            actions: [
              TextButton(
                child: Text("Back",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Color.fromARGB(255, 51, 184, 66),
                    )),
                onPressed: () {
                  Navigator.pop(context);
                },
              )
            ],
          );
        });
  }
}
