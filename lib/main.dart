import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "WELCOME TO FLUTTER",
      home: _randomWords());
  }
}

class _randomWords extends StatefulWidget {
  const _randomWords({Key? key}) : super(key: key);

  @override
  _randomWordsState createState() => _randomWordsState();
}

class _randomWordsState extends State<_randomWords> {
  final _suggestions = <WordPair>[];
  final _biggerFont = const TextStyle(fontSize: 18);
  @override
  Widget build(BuildContext context) {
    return Scaffold (
        appBar: AppBar(
        title: Text('STARTUP NAME GENERATOR')),
    body: _buildSuggestions(),
    );
  }

  Widget _buildSuggestions(){
    return ListView.builder(
        padding: const EdgeInsets.all(16),
        itemBuilder: (BuildContext _context, int i) {
          if (i.isOdd) {
            return Divider();
          }
          final int index = i ~/ 2;
          if (index >= _suggestions.length) {
            _suggestions.addAll(generateWordPairs().take(10));
          }
          return _buildRow(_suggestions[index]);
        }
        );
  }

  Widget _buildRow(WordPair pair) {
    return ListTile(
      title: Text(
        pair.asPascalCase,
        style: _biggerFont,
      ),
    );
  }
}



