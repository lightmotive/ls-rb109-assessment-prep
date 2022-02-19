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
