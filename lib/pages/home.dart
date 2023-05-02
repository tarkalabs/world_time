import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map? data = {};

  @override
  Widget build(BuildContext context) {
    data = data?.isNotEmpty ?? false ? data : ModalRoute.of(context)?.settings.arguments as Map;
    String bgImage = data?['isDayTime'] ?? false ? 'day.png' : 'night.png';

    return Scaffold(
      body: SafeArea(child: Container(
        color: Colors.white,
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/$bgImage'),
                fit: BoxFit.cover
              )
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(0, 120, 0, 0),
              child: Column(
                children: [
                  MaterialButton(
                      onPressed: () async {
                        dynamic result = await Navigator.pushNamed(context, '/location');
                        print (result);
                        setState(() {
                          data = result as Map;
                        });
                      },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Icon(
                            Icons.edit_location,
                          color: Colors.white,
                        ),
                        Text(
                            'Edit Location',
                          style: TextStyle(
                            color: Colors.white,
                          )
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                          data?['location'] ?? "",
                          style: const TextStyle(
                              fontSize: 28.0,
                              letterSpacing: 2.0,
                            color: Colors.white
                          )
                      ),
                    ],
                  ),
                  const SizedBox(height: 20.0),
                  Text(
                      data?['time'] ?? "",
                    style: const TextStyle(
                      fontSize: 66.0,
                      color: Colors.white
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
