# Today's objective
# 1. write tests using rspec done
# 2. refactor the code
# 3. separate the files

def acronymize(sentence)
  # TODO: make acroynm out of the sentence given
  # Split the sentence into words => Array of words
  # Get the first letters of this words => Array
  # Join those letters -> upcase
  sentence.split(" ").map { |word| word[0] }.join.upcase
end
