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

p longest_palindrome('a') == 1
p longest_palindrome('aa') == 2
p longest_palindrome('baa') == 2
p longest_palindrome('aab') == 2
p longest_palindrome('baabcd') == 4
p longest_palindrome('baablkj12345432133d') == 9
