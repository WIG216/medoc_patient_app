String capitalizeFirstLetter(String word) {
  if (word.isEmpty) {
    return word; // Return empty string if the word is empty
  } else {
    return word[0].toUpperCase() + word.substring(1); // Capitalize first letter and append the rest of the word
  }
}