import 'package:desafio_web_services/pages/home_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/repository/comic_repository.dart';
import '../strings.dart';

class RegistrationPage extends StatelessWidget {
  const RegistrationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: null,
      resizeToAvoidBottomInset: true,
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          clipBehavior: Clip.none,
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                height: 325,
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      margin: EdgeInsets.zero,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            const TextField(
                              decoration: InputDecoration(
                                hintText: Strings.name,
                              ),
                            ),
                            const TextField(
                              decoration: InputDecoration(
                                hintText: Strings.email,
                              ),
                            ),
                            const TextField(
                              obscureText: true,
                              decoration: InputDecoration(
                                hintText: Strings.password,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 16.0),
                              child: ElevatedButton(
                                onPressed: () {
                                  Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) {
                                        return RepositoryProvider(
                                          create: (context) =>
                                              ComicRepository(),
                                          child: const HomePage(),
                                        );
                                      },
                                    ),
                                    (route) => false,
                                  );
                                },
                                child: Text(Strings.save.toUpperCase()),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Positioned(
              height: 110,
              top: -30,
              left: 0,
              right: 0,
              child: CircleAvatar(
                backgroundColor: Colors.white,
                child: Align(
                  child: Icon(
                    Icons.person_outline,
                    color: Colors.black,
                    size: 100,
                  ),
                ),
              ),
              // width: 100,
            ),
          ],
        ),
      ),
    );
  }
}
