bool isPanlindrome(String sentence) {
  return sentence == sentence.split('').reversed.join();
}
