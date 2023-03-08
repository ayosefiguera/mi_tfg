import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Settings'),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 50),
          child: Column(
            children: [
//TODO: Profile card

              Text(
                'Configuración de cuenta',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 12,
              ),
              ListView(
                shrinkWrap: true,
                children: [
                  ListTile(
                    title: Text(
                      'información personal',
                      style: TextStyle(color: Colors.grey),
                    ),
                    leading: Icon(Icons.person_2_outlined),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () {},
                  ),
                  ListTile(
                    title: Text(
                      'Metodos de pagos y cobros',
                      style: TextStyle(color: Colors.grey),
                    ),
                    leading: Icon(Icons.credit_card_rounded),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () {},
                  ),
                ],
              ),
              SizedBox(
                height: 24,
              ),

              Text(
                'Legal',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 12,
              ),
              ListView(
                shrinkWrap: true,
                children: [
                  ListTile(
                    title: Text(
                      'Terminos y servicios',
                      style: TextStyle(color: Colors.grey),
                    ),
                    leading: Icon(Icons.balance),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () {},
                  ),
                  ListTile(
                    title: Text(
                      'Politica de privacidad',
                      style: TextStyle(color: Colors.grey),
                    ),
                    leading: Icon(Icons.shield_outlined),
                    trailing: Icon(Icons.arrow_forward_ios),
                    onTap: () {},
                  ),
                ],
              ),
              ListTile(
                title: Text(
                  'Cerrar Sesión',
                  style: TextStyle(color: Colors.grey),
                ),
                leading: Icon(Icons.exit_to_app_outlined),
                trailing: Icon(Icons.arrow_forward_ios),
                onTap: () {},
              ),
            ],
          ),
        ));
  }
}
