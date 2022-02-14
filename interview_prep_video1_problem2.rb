# frozen_string_literal: true

# Given an array of strings made only from lowercase letters, return an array
# of all characters that show up in all strings within the given array
# (including duplicates).
# For example, if a character occurs 3 times in all strings but not 4 times,
# you need to include that character three times in the final answer.

# - Input: Array of lowercase strings
# - Output: Array of characters, including duplicates, that show up in all
#   strings.
#
# Mental model: Find all characters that repeat across all strings. If a
#   character repeats multiple times across all strings, include those
#   globally duplicated repetitions.

# * Data Structure *
# Store the globally duplicated characters in a new array.
#
# * Algorithm *
# Given an array called `strings`:
#
# - duplicate_chars = []
# - Find the longest_string.
# - Iterate through each unique char in longest_string
#   - Count the char occurrences across each string
#   - If all counts are greater than 0:
#     - Take the smallest_count from each string.
#     - Add the character to the array [smallest_count] times to
#       duplicate_chars.
# - Return duplicate_chars

# Examples:
p common_chars(%w[bella label roller]) == %w[e l l]
p common_chars(%w[cool lock cook]) == %w[c o]
p common_chars(%w[hello goodbye booya random]) == %w[o]
p common_chars(%w[aabbaaaa ccdddddd eeffee ggrrrrr yyyzzz]) == []
p common_chars(%w[aa aa aa aa]) == %w[a a]
p common_chars(%w[aa aa aa aaa]) == %w[a a]
