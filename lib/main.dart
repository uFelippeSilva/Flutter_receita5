import 'package:flutter/material.dart';

var dataObjects = [];

void main() {
  MyApp app = MyApp();
  runApp(app);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print("no build da classe MyApp");
    return MaterialApp(
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Aba de pesquisa"),
        ),
        bottomNavigationBar: NewNavBar2(onIndexChanged: (index) {
          print("Botão tocado: $index");
        }),
        body: Stack(
          children: [
            Positioned.fill(
              child: Image.network(
                "https://img.freepik.com/fotos-gratis/refrigerante-colorido-bebe-tiro-macro_53876-18225.jpg",
                fit: BoxFit.cover,
              ),
            ),
            Center(
              child: Text(
                "Seja bem vindo a nossa Loja de Drinks, abaixo temos nossas listas de bebidas!",
                style: TextStyle(fontSize: 32, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NewNavBar2 extends StatefulWidget {
  final Function(int) onIndexChanged;

  NewNavBar2({required this.onIndexChanged});

  @override
  _NewNavBar2State createState() => _NewNavBar2State();
}

class _NewNavBar2State extends State<NewNavBar2> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    print("no build da classe NewNavBar2");

    return BottomNavigationBar(
      onTap: (index) {
        setState(() {
          _currentIndex = index;
        });
        widget.onIndexChanged(index);
      },
      currentIndex: _currentIndex,
      items: const [
        BottomNavigationBarItem(
          label: "Cafés",
          icon: Icon(Icons.coffee_outlined),
        ),
        BottomNavigationBarItem(
          label: "Cervejas",
          icon: Icon(Icons.local_drink_outlined),
        ),
        BottomNavigationBarItem(
          label: "Sucos",
          icon: Icon(Icons.local_bar_outlined),
        ),
      ],
    );
  }
}

class DataTableWidget extends StatelessWidget {
  final List jsonObjects;

  DataTableWidget({this.jsonObjects = const []});

  @override
  Widget build(BuildContext context) {
    print("no build da classe DataTableWidget");

    var columnNames = ["Nome", "Estilo", "IBU"];
    var propertyNames = ["name", "style", "ibu"];

    return DataTable(
      columns: columnNames
          .map(
            (name) => DataColumn(
              label: Expanded(
                child: Text(
                  name,
                  style: TextStyle(fontStyle: FontStyle.italic),
                ),
              ),
            ),
          )
          .toList(),
      rows: jsonObjects
          .map(
            (obj) => DataRow(
              cells: propertyNames
                  .map(
                    (propName) => DataCell(
                      Text(obj[propName]),
                    ),
                  )
                  .toList(),
            ),
          )
          .toList(),
    );
  }
}
