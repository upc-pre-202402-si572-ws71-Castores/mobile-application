
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DashboardCarrier extends StatelessWidget {
  const DashboardCarrier({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    Color.fromARGB(255, 0, 17, 35),
                    Color.fromARGB(255, 10, 35, 78),
                    Color.fromARGB(255, 37, 62, 107)
                  ],
                  stops: [
                    0.04,
                    0.5,
                    0.8
                  ],
                  begin: FractionalOffset.bottomCenter,
                  end: FractionalOffset.topCenter),
              borderRadius:
                  BorderRadius.vertical(bottom: Radius.circular(25.0))),
        ),
        title: Container(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 30.0),
                //alignment: Alignment.bottomLeft,
                child: Text(
                  'Dashboard',
                  style: TextStyle(
                    fontSize: 35,
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 18.0),
                child: InkWell(
                  onTap: () {
                    print('Ícono presionado');
                    //fix
                  },
                  child: const Icon(
                    Icons.notification_add_rounded,
                    size: 40,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
        toolbarHeight: 110,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //2 box

            //responsive

            SizedBox(
              height: 140,
              child: GridView.builder(
                  itemCount: 2,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, childAspectRatio: 2 / 1),
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(13.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.black54,
                              blurRadius: 6,
                              offset: Offset(0, 4),
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Center(
                              child: Text(
                                index == 0
                                    ? 'Actual Temperature'
                                    : 'Actual Weight',
                                //'Actual Weight',
                                style: const TextStyle(
                                  fontSize: 20,
                                  color: Color.fromARGB(255, 10, 35, 78),
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  index == 0
                                      ? Icons.snowing
                                      : Icons.height_outlined,
                                  size: 40,
                                  color: const Color.fromARGB(255, 10, 35, 78),
                                ),
                                Text(
                                  index == 0 ? '05º C' : '1 KG',
                                  style: const TextStyle(
                                    fontSize: 40,
                                    color: Color.fromARGB(255, 10, 35, 78),
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),

                        //iconos
                      ),
                    );
                  }),
            ),
            //),

            Container(
              padding: const EdgeInsets.all(9.0),
              height: 290,
              margin: const EdgeInsets.all(6.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black54,
                    blurRadius: 6,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                children: [
                  const Text(
                    'Current request',
                    style: TextStyle(
                      fontSize: 30,
                      color: Color.fromARGB(255, 10, 35, 78),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Container(
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(52, 158, 158, 158),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: const Column(
                            children: [
                              Text(
                                'Ideal Temperature',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                '21ºC',
                                style: TextStyle(
                                  fontSize: 35,
                                  color: Color.fromARGB(255, 10, 35, 78),
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                              // Añade más widgets aquí para la segunda columna
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Container(
                          margin: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(52, 158, 158, 158),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: const Column(
                            children: [
                              Text(
                                'Ideal Weight',
                                style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.grey,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                '2.7 KG',
                                style: TextStyle(
                                  fontSize: 35,
                                  color: Color.fromARGB(255, 10, 35, 78),
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                              // Añade más widgets aquí para la tercera columna
                            ],
                          ),
                        ),
                      ),
                      Expanded(
                        child: Column(
                          children: [
                            const Text(
                              'Carrier',
                              style: TextStyle(
                                fontSize: 15,
                                color: Color.fromARGB(255, 10, 35, 78),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(8.0),
                              child: ClipOval(
                                child: Image.asset(
                                  'lib/shared/assets/userpic.jpg',
                                  width: 80.0,
                                  height: 80.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            const Text(
                              'Carlos Benites',
                              style: TextStyle(
                                fontSize: 15,
                                color: Color.fromARGB(255, 10, 35, 78),
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                  Container(
                    padding: const EdgeInsets.all(12.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            child: const Column(
                              children: [
                                Text(
                                  'Start Location',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Color.fromARGB(255, 10, 35, 78),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'Lima',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                                // Añade más widgets aquí para la tercera columna
                              ],
                            ),
                          ),
                        ),
                        const Icon(
                          Icons.arrow_forward_ios_outlined,
                          size: 20,
                          color: Color.fromARGB(255, 10, 35, 78),
                        ),
                        Expanded(
                          child: Container(
                            child: const Column(
                              children: [
                                Text(
                                  'Arrival Place',
                                  style: TextStyle(
                                    fontSize: 20,
                                    color: Color.fromARGB(255, 10, 35, 78),
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'Callao',
                                  style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            Container(
              padding: const EdgeInsets.all(9.0),
              margin: const EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.black54,
                    blurRadius: 6,
                    offset: Offset(0, 4),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Alarms',
                        style: TextStyle(
                          fontSize: 30,
                          color: Color.fromARGB(255, 10, 35, 78),
                          fontWeight: FontWeight.bold,
                        )),
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          buildBullet('Temperature near of 5º'),
                          buildBullet('Delay alarm'),
                          buildBullet('Cargo tampering alarm'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBullet(String text) {
    return Row(
      crossAxisAlignment:
          CrossAxisAlignment.start, // Alinear la viñeta con el texto
      children: [
        // Este ícono actúa como la viñeta
        const Icon(
          Icons.circle, // Puedes usar cualquier ícono o imagen
          size: 8.0, // Tamaño del ícono
          color: Colors.black, // Color de la viñeta
        ),
        const SizedBox(width: 8), // Espacio entre la viñeta y el texto
        Expanded(
          child: Text(
            text,
            style: const TextStyle(fontSize: 20),
            selectionColor: Colors.grey, // Estilo del texto
          ),
        ),
      ],
    );
  }
}


