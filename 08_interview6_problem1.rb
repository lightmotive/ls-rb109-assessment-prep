# frozen_string_literal: true

# You are going to be given an array of integers. Your job is to take that array
# and find an index N where the sum of the integers to the left of N is equal to
# the sum of the integers to the right of N. If there is no index that would
# make this happen, return -1.
#
# For example:
#
# Let's say you are given the array [1,2,3,4,3,2,1]:
# Your method will return the index 3, because at the 3rd position of the array,
# the sum of left side of the index [1,2,3] and the sum of the right side of the
# index [3,2,1] both equal 6.
#
# Another one:
# You are given the array [20,10,-80,10,10,15,35]
# At index 0 the left side is []
# The right side is [10,-80,10,10,15,35]
# They both are equal to 0 when added. (Empty arrays are equal to 0 in this
# problem.)
# Index 0 is the place where the left side and right side are equal.

# Input: Array of integers
# Output: Integer - index where sum of integers to left equal sum to right.

# Rules:
# - Find the index where right sum is equal to left sum.
# - Empty array (index 0 to left, and last index to right) sum equals 0.
# - Return -1 if no index meets those conditions.

# Mental model: At which index is the sum to the left equal to the sum to
# the right? If none, return -1.

# Data structure:
# - No additional data structures required for this problem--just variables for
#   storing sums. Iterate through the array without mutating it.

# Algorithm:
# Given an array of `numbers`:

# - Initialize `left_sum` = 0 and `right_sum = numbers.sum`.
# - Iterate through array with `number` and `idx`.
#   - `right_sum -= number`.
#   - Compare `left_sum` to `right_sum`
#     - Return `idx` if equal.
#   - `left_sum += current_value`
# - Return -1 to indicate no sum was found.

# Tests:
p find_even_index([1, 2, 3, 4, 3, 2, 1]) == 3
p find_even_index([1, 100, 50, -51, 1, 1]) == 1
p find_even_index([1, 2, 3, 4, 5, 6]) == -1
p find_even_index([20, 10, 30, 10, 10, 15, 35]) == 3
p find_even_index([20, 10, -80, 10, 10, 15, 35]).zero?
p find_even_index([10, -80, 10, 10, 15, 35, 20]) == 6
p find_even_index([-1, -2, -3, -4, -3, -2, -1]) == 3
