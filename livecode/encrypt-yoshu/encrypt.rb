def encrypt(message)
  # define array of alphabet
  alphabet = ('A'..'Z').to_a
  # split the message into individual letters
  letters = message.chars
  encrypted_letters = letters.map do |letter|
    alphabet.index(letter) ? alphabet[alphabet.index(letter) - 3] : letter
  end
  encrypted_letters.join
end
