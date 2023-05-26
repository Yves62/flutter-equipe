import 'package:flutter/material.dart';
import 'package:clone_equipe/second_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey),
      ),
      home: EquipePage(),
    );
  }
}

class EquipePage extends StatefulWidget {
  const EquipePage({super.key});

  @override
  EquipePageState createState() => EquipePageState();

}

class EquipePageState extends State<EquipePage> {


  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var platform = Theme.of(context).platform;
    var greyBackgroundColor = Colors.grey;
    var textColor = Colors.black;

    List<Widget> actions = [
      button('test', greyBackgroundColor, textColor),
      button('test', greyBackgroundColor, textColor),
      button('test', greyBackgroundColor, textColor),
      button('test', greyBackgroundColor, textColor),
      button('test', greyBackgroundColor, textColor),
      button('test', greyBackgroundColor, textColor),
      button('test', greyBackgroundColor, textColor),
      button('test', greyBackgroundColor, textColor),
      button('test', greyBackgroundColor, textColor),
      button('test', greyBackgroundColor, textColor),
    ];

    return Scaffold(
      drawer: menu(),
      appBar: AppBar(
        title: const Text("L'équipe", style: TextStyle(
          color: Colors.red,
          fontStyle: FontStyle.italic,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => showDialog<String>(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                title: const Text('Abonnement'),
                content: const Text('Voulez-vous vous abonner ?'),
                actions: <Widget>[
                  TextButton(
                    onPressed: () => Navigator.pop(context, 'Cancel'),
                    child: const Text('Annuler'),
                  ),
                  TextButton(
                    onPressed: () => Navigator.pop(context, 'OK'),
                    child: const Text("Je m'abonne"),
                  ),
                ],
              ),
            ),
            child: const Padding(
              padding: EdgeInsets.all(10.0),
              child: Text("S'abonner", style: TextStyle(color: Colors.black, backgroundColor: Colors.yellow)),
            ),
          ),
        ],
        centerTitle: true,
        elevation: 10,
      ),
      body : SingleChildScrollView(
        child :  Column(
          children: [
            const SizedBox(
              height: 10,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child :
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.max,
                children: [
                  button('test', greyBackgroundColor, textColor),
                  button('test', greyBackgroundColor, textColor),
                  button('test', greyBackgroundColor, textColor),
                  button('test', greyBackgroundColor, textColor),
                  button('test', greyBackgroundColor, textColor),
                  button('test', greyBackgroundColor, textColor),
                  button('test', greyBackgroundColor, textColor),
                  button('test', greyBackgroundColor, textColor),
                  button('test', greyBackgroundColor, textColor),
                  button('test', greyBackgroundColor, textColor),
                ],
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            fromAsset(size, 'images/f1.jpg'),
            headerArticle('F1', greyBackgroundColor, textColor),
            generateTitle("Monaco, un circuit unique"),
            divideSection(),
            const Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text('En kiosque'),
                  const Spacer(),
                  Text('Voir toutes les éditions', style : TextStyle(color: Colors.lightBlueAccent))
                ],
              ),
            ),
            Padding(
                padding: const EdgeInsets.all(8.0),
                child : inKiosque(size / 5)
            ),
            divideSection(),
            genericContent('F1', 'Les essais', size / 2),
            const SizedBox(
              height: 15,
            ),
            divideSection(),
            genericContent('F1', 'Les essais', size / 2),
            const SizedBox(
              height: 15,
            ),
            divideSection(),
            genericContent('F1', 'Les essais', size / 2),
            const SizedBox(
              height: 15,
            ),
            divideSection(),
            genericContent('F1', 'Les essais', size / 2),
            const SizedBox(
              height: 15,
            ),
            divideSection(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home, color: Colors.black),
            label: 'Accueil',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.business, color: Colors.black),
            label: 'Chrono',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.school, color: Colors.red),
            label: 'Directs',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.tv_sharp, color: Colors.black),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore,  color: Colors.black),
            label: 'TV',
          ),
        ],
        selectedItemColor: Colors.black,
      ),
    );
  }
}



// FUNCTIONS

Drawer menu(){
  return Drawer(
    child: ListView(
      padding: EdgeInsets.zero,
      children: const <Widget>[
        DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
          child: Text(
            'Drawer Header',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
        ),
        ListTile(
          leading: Icon(Icons.message),
          title: Text('Résultats et actualités'),
        ),
        ListTile(
          leading: Icon(Icons.account_circle),
          title: Text('Football'),
        ),
        ListTile(
          leading: Icon(Icons.settings),
          title: Text('Rugby'),
        ),
      ],
    ),
  );
}

Widget button(String text, Color backgroundColor, Color colorText){
  return FilledButton(
    onPressed: (){
      print("s'abonner");
    },
    style: FilledButton.styleFrom(
      backgroundColor: backgroundColor,
      elevation: 10,
    ),
    child: Text(
      text,
      style : TextStyle(color: colorText),
    ),
  );
}

Image fromAsset(Size size, String src) {
  return Image.asset(src, height: 180, width: size.width, fit: BoxFit.cover);
}

Widget headerArticle(String text, Color backgroundColor, Color textColor) {
  return Row(
    children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: button(text, backgroundColor, textColor),
      ),
      const Padding(
        padding: EdgeInsets.all(8.0),
        child: Text('Série'),
      ),
      const Icon(Icons.circle, color: Colors.yellow),
    ],
  );
}

Widget generateTitle(String title){
  return Text(
      title,
      style : const TextStyle(fontSize: 30, fontWeight: FontWeight.w700)
  );
}

Widget inKiosque(size){
  return Row(
    children: [
      fromAsset(size, 'images/f1.jpg'),
      const Spacer(),
      fromAsset(size, 'images/f1.jpg'),
      const Spacer(),
      fromAsset(size, 'images/f1.jpg'),
      const Spacer(),
      fromAsset(size, 'images/f1.jpg'),
    ],
  );
}

Widget genericContent(String title, String subTitle, size){
  return Row(
    children: [
      Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children : [
          Column(
            children: [
              headerArticle(title, Colors.grey, Colors.black),
              generateTitle(subTitle),
            ],
          ),
          Container(
            padding: const EdgeInsets.only(left : 38.0),
            child : fromAsset(size, 'images/f1.jpg'),
          )
        ],
      ),
    ],
  );
}

Widget divideSection(){
  return const Padding(
    padding: EdgeInsets.all(8.0),
    child: Divider(
      color: Colors.black,
      height: 10,
    ),
  );
}
