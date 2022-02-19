# frozen_string_literal: true

# Write a method to find the longest common prefix string amongst an array of
# strings.

# Basic algorithm:
# - Loop through each character of the first word.
#   - Check whether each of the remaining words have the same character at
#     the same index.
#     - If yes, add the character to the result and continue checking
#       characters.
#     - If no, return the result.

def common_prefix(words)
  result = String.new
  # - Loop through each character of the first word.
  first_word = words[0]

  first_word.chars.each_with_index do |char, idx|
    #   - Check whether each of the remaining words have the same character at
    #     the same index.
    words[1..-1].each do |word|
      #     - If yes, add the character to the result and continue checking
      #       characters.
      #     - If no, return the result.
      other_char = word[idx]
      return result if other_char != char
    end
    result << char
  end

  result
end

p common_prefix(%w[flower flow flight]) == 'fl'
p common_prefix(%w[dog racecar car]) == ''
p common_prefix(%w[interspecies interstellar interstate]) == 'inters'
p common_prefix(%w[throne dungeon]) == ''
p common_prefix(%w[throne throne]) == 'throne'
