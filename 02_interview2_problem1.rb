# You have to create a method that takes a positive integer number and returns
# the next bigger number formed by the same digits:
# 12 ==> 21
# 513 ==> 531
# 2017 ==> 2071

# If no bigger number can be composed using those digits, return -1:
# 9 ==> -1
# 111 ==> -1
# 531 ==> -1

# Input: Positive integer
# Output: Positive integer or -1
# Rules:
# - Return -1 if no bigger number can be formed with the provided digits.
# Mental model: Rearrange the digits to form a larger number if possible;
#   otherwise, return -1.

# Data structure:
# - Store the digits in an array to simplify access and reorganization.
# - Store the reorganized digits in a string that one can convert to an integer
#   for comparison purposes.

# Algorithm:
# * We'll consider performance optimizations later, if necessary. *
#
# Overview: from right-to-left, find the first digit that's larger than the
# digit to its left. Compare 2 digits at a time.
#
# Given an `integer`:
#
# digits_string = integer.to_s.chars
# largest_number_string = digits_string.sort.reverse.join
# largest_number = largest_number_string.to_i
# return -1 if digits_string == largest_number_string
# start_index = digits_string.length - 1
# While digits_string.to_i < largest_number:
#   Loop from start_index to 1 with index_right:
#     index_left = index_right - 1
#     Compare element at index_right to element at index_left as strings.
#       If right is greater than left, swap and return the string converted
#         to an integer. Eventually, the string will be sorted from largest to
#         smallest.
#   start_index -= 1
#
# return -1

def next_bigger_num(integer)
  digits_string = integer.to_s.chars
  largest_number_string = digits_string.sort.reverse.join
  largest_number = largest_number_string.to_i

  return -1 if digits_string == largest_number_string

  start_index = digits_string.length - 1
  # While digits_string.to_i < largest_number:
  #   Loop from start_index to 1 with index_right:
  #     index_left = index_right - 1
  #     Compare element at index_right to element at index_left as strings.
  #       If right is greater than left, swap and return the string converted
  #         to an integer. Eventually, the string will be sorted from largest to
  #         smallest.
  #   start_index -= 1
  #
  # return -1
end

# Examples:

p next_bigger_num(9) == -1
p next_bigger_num(12) == 21
p next_bigger_num(513) == 531
p next_bigger_num(2017) == 2071
p next_bigger_num(111) == -1
p next_bigger_num(531) == -1
p next_bigger_num(123_456_789) == 123_456_798
