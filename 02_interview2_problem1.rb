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
# int_str = integer.to_s.chars
# largest_number_string = int_str.sort.reverse.join
# largest_number = largest_number_string.to_i
# return -1 if int_str == largest_number_string
# index_start = int_str.length - 1
# While int_str.to_i < largest_number:
#   Loop from index_start to 1 with index_right:
#     index_left = index_right - 1
#     Compare element at index_right to element at index_left as strings.
#       If right is greater than left, swap and return the string converted
#         to an integer. Eventually, the string will be sorted from largest to
#         smallest.
#   index_start -= 1
#
# return -1

def integer_digits_max(integer)
  integer.to_s.chars.sort.reverse.join.to_i
end

def string_sort_reverse_swap!(str, index_right, index_left)
  str[index_right], str[index_left] = str[index_left], str[index_right]
end

# Iterate through each swap from a specified starting point
def sort_reverse_each_uniq!(collection, index_start)
  index_start.downto(1) do |index_right|
    index_left = index_right - 1
    next unless collection[index_right] > collection[index_left]

    string_sort_reverse_swap!(collection, index_right, index_left)
    break
  end
end

# This generates successively bigger numbers, but not every bigger number.
def bigger_num_string_each(integer)
  int_str = integer.to_s
  int_max = integer_digits_max(integer)
  digits_str_last_unique = nil

  while int_str.to_i < int_max
    index_start = int_str.length - 1

    while index_start.positive? && int_str.to_i < int_max
      sort_reverse_each_uniq!(int_str, index_start)

      if int_str != digits_str_last_unique
        digits_str_last_unique = int_str.dup
        yield(int_str)
      end

      index_start -= 1
    end
  end
end

def next_bigger_num(integer)
  int_max = integer_digits_max(integer)
  return -1 if integer == int_max

  bigger_num_string_each(integer) do |int_next_str|
    int_next = int_next_str.to_i
    return int_next if int_next > integer
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

# Additional tests (verified with `bigger_number_permutations_unique` method below):
p next_bigger_num(123_666_888) == 123_668_688
p next_bigger_num(123_654_999) == 123_659_499
p next_bigger_num(123_999_999) == 129_399_999
p next_bigger_num(879_999_999) == 897_999_999

# ***
#
# Below: test number generation only -- this is not the most efficient solution.
#
# ***
def integer_chars(integer)
  integer.to_s.chars
end

def integer_chars_permutations(integer)
  integer_chars(integer).permutation.to_a
end

def bigger_number_permutations_unique(integer)
  permutations = integer_chars_permutations(integer)
  permutations_unique = permutations.uniq.sort

  integer_chars = integer_chars(integer)
  permutations_unique.reject! do |permutation|
    [-1, 0].include?(permutation <=> integer_chars)
  end

  permutations_unique
end

# The solution enumeration sequence relative to sorted permutations.
def solution_to_permutation_index_map(
  test_number, numbers_sorted
)
  indices = []

  bigger_num_string_each(test_number) do |num_string|
    indices.push(numbers_sorted.index(num_string.to_i))
  end

  indices
end

def solution_sequence_matches_permutation_sequence(
  test_number, permutations_unique
)
  numbers_sorted = permutations_unique.map do |permutation|
    permutation.join.to_i
  end

  index_map = solution_to_permutation_index_map(test_number, numbers_sorted)

  index_map == index_map.dup.sort
end

def print_next_bigger_number_details(test_number, permutations_unique)
  puts "* Test number generator - next biggest number for #{test_number} *"
  puts "Next bigger number: #{permutations_unique.first.join.to_i}"
  puts "Unique permutations: #{permutations_unique.size}"
end

def print_test_number_generator_results(test_number)
  permutations_unique = bigger_number_permutations_unique(test_number)

  print_next_bigger_number_details(test_number, permutations_unique)

  order_matches =
    solution_sequence_matches_permutation_sequence(
      test_number, permutations_unique
    )

  p 'Does solution enumeration sequence match sorted permutations for the ' \
  "number #{test_number}? #{order_matches ? 'Yes' : 'No'}"
end

print_test_number_generator_results(123_456_789)
