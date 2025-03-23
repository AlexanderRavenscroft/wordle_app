import 'package:flutter/material.dart';
import 'package:wordle_app/components/menu/menu_message_dialog.dart';
import 'package:wordle_app/services/api_service.dart';
import 'package:wordle_app/themes/themes.dart';

class WordService extends ChangeNotifier{
  String _choosenWord = '';
  String _typedWord = '';
  int _currentRow = 0;
  
  Color _tileColor = AppColors.background;

  List<List<String>> _guesses = [[]];

  // Getters:
  List<List<String>> get guesses => _guesses;
  Color get tileColor => _tileColor;


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

  void checkWord(BuildContext context) async {
    if (_typedWord.length == 5) {

      await checkLetters();

      // Restart game - You won
      if(_typedWord == _choosenWord) {
        endGame(context, AppColors.primary, 'YOU WIN');

      // Wrong answer, still left tries
      } else if(_guesses.length <= 5) {
          _guesses.add([]);
          _currentRow++;

      // Restart game - You lost
      } else {
        endGame(context, AppColors.error, 'YOU LOST');
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

  void endGame(BuildContext context, Color headingColor, String headingText) {
    showDialog(
      context: context, 
      builder: (context) => MenuMessageDialog(
        headingColor: headingColor,
        headingText: headingText, 
        contentText: 'The choosen word was: $_choosenWord',
      )
    );
    notifyListeners();
  }

  Future<void> checkLetters() async{
    for (int i=0; i<_typedWord.length; i++) {
      // Check if letter is in the word
      if(_choosenWord.contains(_typedWord[i])) {
        
        // Check if its in the right place
        if(_typedWord[i] == _choosenWord[i]) {
          _tileColor = AppColors.primary;
          notifyListeners();
          print('${_typedWord[i]} jest w słowie i na dobrym miejscu');
        } else {
          _tileColor = AppColors.secondary;
          notifyListeners();
          print('${_typedWord[i]} jest w słowie i na złym miejscu');
        }
        
      } else {
        print('${_typedWord[i]} nie jest w słowie');
      }
    }

  }
}