import 'package:flutter/material.dart';

class AwardsScreen extends StatelessWidget {
  final List<String> myAwards;
  const AwardsScreen({super.key, required this.myAwards});

  @override
  Widget build(BuildContext context) {
    List<String> imagenes = [
      'assets/insignias/jugar_1_partida.png',
      'assets/insignias/ganar_1_partida.png',
      'assets/insignias/ganar_10_partidas.png',
      'assets/insignias/ganar_100_partidas.png',
      'assets/insignias/añadir_1_amigo.png',
      'assets/insignias/conquista_1_territorio.png',
      'assets/insignias/comprar_1_fabrica.png',
      'assets/insignias/comprar_15_fabricas.png',
      'assets/insignias/conseguir_99_tropas.png',
      'assets/insignias/conseguir_1000_monedas.png'
    ];

    List<String> nomLogros = [
      'Bienvenido a WealthWars',
      'Comandante principiante',
      'Comandante experimentado',
      'Comandante veterano',
      'Tu primer compañero',
      'Conquistador',
      'Industrializador',
      'Revolución industrial',
      'La Armada Invencible',
      'Mileurista'
    ];

    List<String> descLogros = [
      'Juega tu primera partida',
      'Gana tu primera partida',
      'Gana 10 partidas',
      'Gana 100 partidas',
      'Haz tu primer amigo',
      'Conquista un territorio en una partida',
      'Compra una fábrica en una partida',
      'Obten 15 fábricas en una sola partida',
      'Alcanza a tener 99 tropas en un solo territorio',
      'Obten 1000 monedas en una sola partida',
    ];

    return Scaffold(
      backgroundColor: const Color(0xFF083344),
      appBar: AppBar(
        iconTheme: const IconThemeData(
          color: Colors.white,
        ),
        title: const Text(
          'Logros:',
          style: TextStyle(color: Colors.white),
        ),
        automaticallyImplyLeading: true,
        backgroundColor: const Color(0xFF083344),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: ListView.separated(
                  itemCount: 10,
                  separatorBuilder: (context, index) =>
                      const Divider(color: Colors.white24),
                  itemBuilder: (context, index) {
                    IconData icono =
                        contieneElementoEnComun(nomLogros[index], myAwards)
                            ? Icons.check
                            : Icons.lock;
                    return ListTile(
                      leading: Image.asset(
                        imagenes[index],
                        width: 40,
                        height: 40,
                      ),
                      title: Text(
                        nomLogros[index],
                        style: const TextStyle(color: Colors.white),
                      ),
                      subtitle: Text(
                        descLogros[index],
                        style: const TextStyle(color: Colors.white70),
                      ),
                      trailing: Icon(
                        icono,
                        color: Colors.white,
                      ),
                      tileColor: const Color(0xFF0066CC),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

bool contieneElementoEnComun(String item, List<String> lista) {
  return lista.contains(item);
}
