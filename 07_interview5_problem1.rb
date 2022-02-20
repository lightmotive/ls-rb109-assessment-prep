# frozen_string_literal: true

# Find the length of the longest substring in the given string that is the same
# in reverse.
#
# As an example, if the input was "I like racecars that go fast", the substring
# (racecar) length would be 7.
#
# If the length of the input string is 0, return value must be 0.

# Examples:
# "a" -> 1
# "aab" -> 2
# "abcde" -> 1
# "zzbaabcd" -> 4
# "" -> 0

# Input: String
# Output: Integer
# Mental model: given a string, which substring is the longest palindrome?

# Rules:
# Empty strings return 0.
# Include single chars in palindromes (technically not palindromes).

# * Data structure *
# Store substrings in an array.

# * Algorithm *
# Overview:
# - Extract substrings.
# - Filter those substrings to include palindromes and single chars only.
# - Get the longest of those filtered substrings.

# Define 3 methods...

def substrings(string)
  result = []

  (0...string.length).each do |start_idx|
    (start_idx...string.length).each do |end_idx|
      result << string[start_idx..end_idx]
    end
  end

  result
end

def select_palindromes(strings)
  strings.select do |string|
    string.length == 1 || string == string.reverse
  end
end

def longest_palindrome(string)
  return 0 if string.empty?

  substrings = substrings(string)
  palindromes = select_palindromes(substrings)

  palindromes.max_by(&:length).length
end

p longest_palindrome('a') == 1
p longest_palindrome('aa') == 2
p longest_palindrome('baa') == 2
p longest_palindrome('aab') == 2
p longest_palindrome('baabcd') == 4
p longest_palindrome('baablkj12345432133d') == 9
