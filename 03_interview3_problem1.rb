# frozen_string_literal: true

# The maximum sum subarray problem consists of finding the maximum sum of a
# contiguous subsequence in an array of integers:
# maxSequence [-2, 1, -3, 4, -1, 2, 1, -5, 4]
# -- should be 6: [4, -1, 2, 1]
# Easy case is when the array is made up of only positive numbers and the
# maximum sum is the sum of the whole array. If the array is made up of only
# negative numbers, return 0 instead.

# Empty array is considered to have zero greatest sum. Note that the empty
# array is also a valid subarray.

# Input: Array of integers
# Output: Integer (maximum sum sub-array)

# Rules:
# - If all numbers are negative or the array is empty, return 0.
# - If all numbers are positive, return the sum of the entire array.

# Mental model:
# Which sub-array of numbers has the highest sum?

# Questions:
# - What if multiple duplicate sub-arrays have the same sum?
#   - Since this is an exercise, I will assume that we'll use the first
#     sub-array.

# Examples:

# p max_sequence([]).zero?
# p max_sequence([-2, 1, -3, 4, -1, 2, 1, -5, 4]) == 6
# p max_sequence([11]) == 11
# p max_sequence([-32]).zero?
# p max_sequence([-2, 1, -7, 4, -10, 2, 1, 5, 4]) == 12

# Data structure
# - Sequentially extract all possible sub-arrays into a temporary array.
#   2-dimensional array of sub-arrays.

# Algorithm
# - Check easy rules.
# - Extract all sub-arrays.
# - Calculate the sum of each and return the largest value.

def max_sequence(integer_array)
  return 0 if integer_array.empty? || integer_array.all?(&:negative?)
  return integer_array.sum if integer_array.all?(&:positive?)

  # - Extract all sub-arrays.
  #   - Get a range of elements, starting with one element at position 0.
  #     Gradually and independently increase the starting position and size.
  #     - [0..0], [0..1], [0..2], ... (start = 0; end = 0; end += 1 - inner loop)
  #     - [1..1], [1..2], ... (start += 1 - outer loop)
  # - Calculate the sum of each and return the largest value.
  #   - Return sub_arrays.max_by(&:sum).sum.
end

p max_sequence([]).zero?
p max_sequence([-2, 1, -3, 4, -1, 2, 1, -5, 4]) == 6
p max_sequence([11]) == 11
p max_sequence([-32]).zero?
p max_sequence([-2, 1, -7, 4, -10, 2, 1, 5, 4]) == 12
