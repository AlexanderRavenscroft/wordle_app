class WordService {
  static String choosenWord = '';
  static String typedWord = '';
  static int currentRow = 0;
  
  static List<List<String>> guesses = [
    [],
  ];

  static void typeLetter(String letter) {
    if(typedWord.length < 5) {
      typedWord += letter;
      guesses[currentRow].add(letter);
      print(guesses);
    }
  }

  static void removeLetter(String letter) {
    if (typedWord.isNotEmpty) {
      typedWord = typedWord.substring(0, typedWord.length-1);
      guesses[currentRow].removeLast();
      print(guesses);
    }
  }

  static void checkWord() {
    if (typedWord.length == 5)  {
      if(typedWord == choosenWord) {
        print('MATCH');
        // Restart game
      } else if(guesses.length <= 5) {
          guesses.add([]);
          currentRow++;

        print(guesses);
      } else {
        print('gg');
      }
      typedWord = '';
    }
  }
}