bool isPanlindrome(String word) {
  return word == word.split('').reversed.join();
}

bool findPalindromes(String sentence) {
  bool palindomeFound = false;

  List<String> wordList = sentence.split(" ");
  for (final word in wordList) {
    if (isPanlindrome(word)) {
      palindomeFound = true;
      break;
    }
  }

  if (palindomeFound) {
    print("The sentence contains a palindrome.");
  } else {
    print("The sentence does not contain a palindrome.");
  }
}
