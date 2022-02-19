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

p max_sequence([]).zero?
p max_sequence([-2, 1, -3, 4, -1, 2, 1, -5, 4]) == 6
p max_sequence([11]) == 11
p max_sequence([-32]).zero?
p max_sequence([-2, 1, -7, 4, -10, 2, 1, 5, 4]) == 12
