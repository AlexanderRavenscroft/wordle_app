import 'package:flutter/material.dart';
import 'package:wordle_app/services/api_service.dart';

class WordService extends ChangeNotifier{
  String _choosenWord = '';
  String _typedWord = '';
  int _currentRow = 0;
  
  List<List<String>> _guesses = [[]];

  // Getters:
  List<List<String>> get guesses => _guesses;


  void typeLetter(String letter) {
    if(_typedWord.length < 5) {
      _typedWord += letter;
      _guesses[_currentRow].add(letter);
      notifyListeners();
    }
  }

  void removeLetter() {
    if (_typedWord.isNotEmpty) {
      _typedWord = _typedWord.substring(0, _typedWord.length-1);
      _guesses[_currentRow].removeLast();
      notifyListeners();
    }
  }

  void checkWord() {
    if (_typedWord.length == 5) {
      // Restart game - You won
      if(_typedWord == _choosenWord) {
        print('MATCH');

      // Wrong answer, still left tries
      } else if(_guesses.length <= 5) {
          _guesses.add([]);
          _currentRow++;
          print(_guesses);

      // Restart game - You lost
      } else {
        print('gg');
      }

      _typedWord = '';
      notifyListeners();
    }
  }

  void resetGame() async {
    // Reset vars
    _choosenWord = '';
    _typedWord = '';
    _currentRow = 0;
    _guesses = [[]];

    // Get new word
    _choosenWord = await APIService.fetchWord();
    debugPrint(_choosenWord);
    
    notifyListeners();
  }
}