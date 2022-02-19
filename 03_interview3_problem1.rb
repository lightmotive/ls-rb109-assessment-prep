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

  sub_arrays = []

  (0...integer_array.size).each do |start_idx|
    (start_idx...integer_array.size).each do |end_idx|
      sub_arrays << integer_array[start_idx..end_idx]
    end
  end

  sub_arrays.max_by(&:sum).sum
end

p max_sequence([]).zero?
p max_sequence([-2, 1, -3, 4, -1, 2, 1, -5, 4]) == 6
p max_sequence([11]) == 11
p max_sequence([-32]).zero?
p max_sequence([-2, 1, -7, 4, -10, 2, 1, 5, 4]) == 12
