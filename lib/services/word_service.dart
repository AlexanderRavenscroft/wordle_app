class WordService {
  static String choosenWord = '';
  static String typedWord = '';
  static List<String> guesses = [];

  static void typeLetter(String letter) {
    if(typedWord.length < 5) {
      typedWord += letter;
      print(typedWord);
    }
  }

  static void removeLetter(String letter) {
    if (typedWord.isNotEmpty) {
      typedWord = typedWord.substring(0, typedWord.length-1);
      print(typedWord);
    }
  }

  static void checkWord() {
    if (typedWord.length == 5)  {
      if(typedWord == choosenWord) {
        print('MATCH');
        // Restart game
      } else if(guesses.length <= 5) {
        // Add word to the guesses
        guesses.add(typedWord);
        print(guesses);
      } else {
        print('gg');
      }
      typedWord = '';
    }
  }
}