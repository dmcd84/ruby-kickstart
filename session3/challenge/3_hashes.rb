# Write a method that takes a string and returns an array
# whose keys are all the downcased words in the string,
# and values are the number of times these words were seen.
#
# No punctuation will appear in the strings.
#
# Example:
# word_count "The dog and the cat" # => {"the" => 2, "dog" => 1, "and" => 1, "cat" => 1}

def word_count(string)
  words = Hash.new { 0 }
  string.split.each { |word| words[word.downcase] += 1 }
  words
end

# words has default value of 0
# the sting that is input is seperated into indiviual words
# for each of these words, the block is called.
# the for each word the word is downcased
# each time the word is encoutered the words default value is incremented by 1\
# words is then returned on ln 13 
