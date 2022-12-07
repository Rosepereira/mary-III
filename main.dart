import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meu App ',
      //home: MyHome(),
      initialRoute: '/',
      routes: {
        '/': (context) => const MyHome(),
        '/Documentos': (context) => const Documentos(),
        'Mymaps': (context) => const Mymaps(),
      },
    );
  }
}

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  int _selectedIndex = 0;

  final List<Widget> _children = [
    Login(),
    Home(),
    Settings(),
    Pessoas(),
  ];

  void_onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Meu App'),
      ),
      drawer: Drawer(
        width: 250,
        backgroundColor: Colors.amber,
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Text('Menu'),
              decoration: BoxDecoration(
                color: Colors.green,
              ),
            ),
            ListTile(
              leading: Icon(Icons.map),
              title: Text('Mapa'),
            ),
            ListTile(
              leading: Icon(Icons.photo_album),
              title: Text('Album'),
            ),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text('Fone'),
            ),
          ],
        ),
      ),
      body: _children[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Pessoas',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: void_onItemTapped,
      ),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Image.asset(
            'image/ifpi.png',
            height: 300,
          ),
          Row(
            children: [
              Container(
                color: Colors.blue,
                height: 100,
                width: 160,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => Contatos(),
                      ),
                    );
                  },
                  child: Text('Contatos'),
                ),
              ),
              Container(
                color: Colors.amber,
                height: 100,
                width: 160,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => Agenda(),
                      ),
                    );
                  },
                  child: Text('Agenda'),
                ),
              ),
            ],
          ),
          Row(
            children: [
              Container(
                color: Colors.red,
                height: 100,
                width: 160,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => Mymaps(),
                      ),
                    );
                  },
                  child: Text('Mapas'),
                ),
              ),
              Container(
                color: Colors.red,
                height: 100,
                width: 160,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => Fotos(),
                      ),
                    );
                  },
                  child: Text('Fotos'),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class Documentos extends StatefulWidget {
  const Documentos({super.key});

  @override
  State<Documentos> createState() => _DocumentosState();
}

class _DocumentosState extends State<Documentos> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class Agenda extends StatefulWidget {
  const Agenda({super.key});

  @override
  State<Agenda> createState() => _AgendaState();
}

class _AgendaState extends State<Agenda> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class Eventos extends StatefulWidget {
  const Eventos({super.key});

  @override
  State<Eventos> createState() => _EventosState();
}

class _EventosState extends State<Eventos> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class Fotos extends StatefulWidget {
  const Fotos({super.key});

  @override
  State<Fotos> createState() => _FotosState();
}

class _FotosState extends State<Fotos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Minha seção de fotos'),
      ),
      body: ListView(
        children: <Widget>[
          ListTile(
            leading: Icon(Icons.map),
            title: Text('Fotos da familia'),
          ),
          ListTile(
            leading: Icon(Icons.photo_album),
            title: Text('Fotos da igreja'),
          ),
          ListTile(
            leading: Icon(Icons.phone),
            title: Text('Fone'),
          ),
        ],
      ),
    );
  }
}

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: Text(
        'Settings',
        style: TextStyle(fontSize: 30.0),
      )),
    );
  }
}

class Pessoas extends StatefulWidget {
  const Pessoas({super.key});

  @override
  State<Pessoas> createState() => _PessoasState();
}

class _PessoasState extends State<Pessoas> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Text(
          'Pessoas',
          style: TextStyle(fontSize: 30.0),
        ),
      ),
    );
  }
}

class Mymaps extends StatefulWidget {
  const Mymaps({super.key});

  @override
  State<Mymaps> createState() => _MymapsState();
}

class _MymapsState extends State<Mymaps> {
  late GoogleMapController mapController;

  final LatLng_center = const LatLng(-5.088109441679283, -42.81107543835478);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Maps Sample App'),
        backgroundColor: Colors.green[700],
      ),
      body: GoogleMap(
        onMapCreated: _onMapCreated,
        initialCameraPosition: CameraPosition(
          target: LatLng_center,
          zoom: 14.0,
        ),
      ),
    );
  }
}

class Contatos extends StatefulWidget {
  const Contatos({super.key});

  @override
  State<Contatos> createState() => _ContatosState();
}

class _ContatosState extends State<Contatos> {
  int? idContato;
  var nomeContato;

  _openBanco() async {
    var dataBasePath = await getDatabasesPath();
    String path = join(dataBasePath, 'banco.db');
    var db = await openDatabase(path, version: 1,
        onCreate: (db, VersaoRecente) async {
      String sql =
          "CREATE TABLE : contatos (id INTEGER PRIMARY KEY AUTOINCREMENT, nome VARCHAR)";
      await db.execute(sql);
    });
    print('Banco: ' + db.isOpen.toString());
    return db;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Contatos'),
        ),
        body: Column());
  }
}

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Image.asset('image/ifpi.png'),
          TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(label: const Text('email')),
          ),
          TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(label: const Text('Login')),
          )
        ],
      ),
    );
  }
}
