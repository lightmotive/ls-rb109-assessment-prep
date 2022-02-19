# frozen_string_literal: true

# Given 2 strings, your job is to find out if there is a substring
# that appears in both strings. You will return true if you find a
# substring that appears in both strings, or false if you do not.
# We only care about substrings that are longer than one letter long.

# Input: 2 strings
# Output: Boolean

# Rules:
# - If either string is empty or has a length of 1, return false.
# - Only compare substrings that are at least 2 letters long.
# - Compare case-insensitively.

# Mental model: considering all substrings of at least 2 characters in each
# string, do any substrings match?

# Data structure
# - Store substrings for each word in an array.

# Algorithm
# Overview: Generate all substrings for each string in an array, then return
# true any substrings match. Otherwise, return false.

def substrings(string)
  result = []

  (0...string.length).each do |start_idx|
    (start_idx...string.length).each do |end_idx|
      result << string[start_idx..end_idx]
    end
  end

  result
end

def substring_test(string1, string2)
  # Return true if any substrings match case-insensitively;
  # otherwise, return false.
end

# Examples:

p substring_test('Something', 'Fun') == false
p substring_test('Something', 'Home') == true
p substring_test('Something', '') == false
p substring_test('', 'Something') == false
p substring_test('BANANA', 'banana') == true
p substring_test('test', 'lllt') == false
p substring_test('t', 't') == false
p substring_test('', '') == false
p substring_test('1234567', '541265') == true
p substring_test('supercalifragilisticexpialidocious',
                 'SoundofItIsAtrocious') == true
