import 'package:flutter/material.dart';
import '../components/main_drawer.dart';
import '../models/settings.dart';

class SettingsScreen extends StatefulWidget {

  final Settings settings;
  final void Function(Settings) onSettingsChanged;

  SettingsScreen({this.settings, this.onSettingsChanged});

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  var settings = new Settings();

  @override
  void initState(){
    super.initState();
    this.settings = this.widget.settings;
  }

  Widget _createSwitch(
      String title, String subtitle, bool value, void Function(bool) onChanged) {
    return SwitchListTile.adaptive(
      title: Text(title),
      subtitle: Text(subtitle),
      value: value,
      onChanged: (value){
        onChanged(value);
        this.widget.onSettingsChanged(settings);
      } ,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Configurações'),
      ),
      drawer: MainDrawer(),
      body: Column(
        children: <Widget>[
          Container(
              padding: EdgeInsets.all(20),
              child: Text(
                'Configurações',
                style: Theme.of(context).textTheme.title,
              )),
          Expanded(
            child: ListView(children: [
              this._createSwitch(
                'Sem Glúten',
                'Só exibirá receitas que não contenham glúten!',
                settings.isGlutenFree,
                (value) => setState((){settings.isGlutenFree = value;}) ,
              ),
              this._createSwitch(
                'Sem Lactose',
                'Só exibirá receitas que não contenham lactose!',
                settings.isLactoseFree,
                (value) => setState((){settings.isLactoseFree = value;}),
              ),
              this._createSwitch(
                'Vegano',
                'Refeições que respeitam a cultura vegana',
                settings.isVegan,
                (value) => setState((){settings.isVegan = value;}),
              ),
              this._createSwitch(
                'Vegetariana',
                'Receitas vegetarianas',
                settings.isVegetarian,
                (value) => settings.isVegetarian = value,
              ),
            ]),
          )
        ],
      ),
    );
  }
}
