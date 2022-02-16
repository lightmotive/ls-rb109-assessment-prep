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

def max_num(integer)
  integer.to_s.chars.sort.reverse.join.to_i
end

def sort_num_string_reverse_each!(digits_string, start_index)
  start_index.downto(1) do |index_right|
    index_left = index_right - 1
    next unless digits_string[index_right] > digits_string[index_left]

    digits_string[index_right], digits_string[index_left] =
      digits_string[index_left], digits_string[index_right]
    break
  end
end

def next_bigger_num_string_each(integer)
  digits_string = integer.to_s
  largest_number = max_num(integer)

  while digits_string.to_i < largest_number
    start_index = digits_string.length - 1

    while start_index.positive? && digits_string.to_i < largest_number
      sort_num_string_reverse_each!(digits_string, start_index)

      yield(digits_string)

      start_index -= 1
    end
  end
end

next_bigger_num_string_each(879_999_999) { |num_string| puts num_string }

def next_bigger_num(integer)
  largest_number = max_num(integer)
  return -1 if integer == largest_number

  next_bigger_num_string_each(integer) do |digits_string|
    next_num = digits_string.to_i
    return next_num if next_num > integer
  end

  -1
end

# Examples:

p next_bigger_num(9) == -1
p next_bigger_num(12) == 21
p next_bigger_num(513) == 531
p next_bigger_num(2017) == 2071
p next_bigger_num(111) == -1
p next_bigger_num(531) == -1
p next_bigger_num(123_456_789) == 123_456_798

# Additional tests (verified with `next_bigger_num_generator` method below):
p next_bigger_num(123_666_888) == 123_668_688
p next_bigger_num(123_654_999) == 123_659_499
p next_bigger_num(123_999_999) == 129_399_999
p next_bigger_num(879_999_999) == 897_999_999

# For test number generation only -- this is not an efficient solution!
def next_bigger_num_generator(integer)
  integer_chars = integer.to_s.chars
  permutations_unique = integer_chars.permutation.to_a.uniq.sort
  p "Size: #{permutations_unique.size}"

  permutations_unique.reject! do |permutation|
    [-1, 0].include?(permutation <=> integer_chars)
  end

  return -1 if permutations_unique.empty?

  permutations_unique.first.join.to_i
end
