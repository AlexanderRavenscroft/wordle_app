import 'package:flutter/material.dart';
import 'package:wordle_app/components/menu/menu_message_dialog.dart';
import 'package:wordle_app/services/api_service.dart';
import 'package:wordle_app/themes/themes.dart';

class WordService extends ChangeNotifier{
  String _choosenWord = '';
  String _typedWord = '';
  int _currentRow = 0;
  
  List<List<Map<String, Color>>> _guesses = [[{}]];

  final Map<String, Color> _keys = {
    for (var key in [
      'Q', 'W', 'E', 'R', 'T', 'Y', 'U', 'I', 'O', 'P',
      'A', 'S', 'D', 'F', 'G', 'H', 'J', 'K', 'L',
      'ENTER', 'Z', 'X', 'C', 'V', 'B', 'N', 'M', 'BACKSPACE',
    ]) key: AppColors.card,
  };


  // Getters:
  List<List<Map<String, Color>>> get guesses => _guesses;
  Map<String, Color> get keys => _keys;

  void typeLetter(String letter) {
    if(_typedWord.length < 5) {
      _typedWord += letter;
      _guesses[_currentRow].add({letter: AppColors.background});
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
        if(context.mounted) {
          endGame(context, AppColors.primary, 'YOU WIN');
        }

      // Wrong answer, still left tries
      } else if(_guesses.length <= 5) {
          _guesses.add([]);
          _currentRow++;

      // Restart game - You lost
      } else {
        if(context.mounted) {
          endGame(context, AppColors.error, 'YOU LOST');
        }
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

    _keys.updateAll((key, value) => AppColors.card);

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
      Color letterColor;

      // Check if letter is in the word
      if(_choosenWord.contains(_typedWord[i])) {
        
        // Check if letter is at the right place
        if(_typedWord[i] == _choosenWord[i]) {
          letterColor = AppColors.primary;
          _keys[_typedWord[i]] = AppColors.primary;
          

        // Check if letter is at the wrong place
        } else {
          letterColor = AppColors.secondary;
            _keys[_typedWord[i]] = AppColors.secondary;
        }
        
        // If its not in the word
      } else {
          letterColor = AppColors.card;
          _keys[_typedWord[i]] = AppColors.surface;
      }
      // Update the tile color for the correct letter
      _guesses[_currentRow][i] = {_typedWord[i]: letterColor};
    }
    notifyListeners();
  }
}