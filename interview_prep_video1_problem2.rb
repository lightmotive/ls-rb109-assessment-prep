# frozen_string_literal: true

# Given an array of strings made only from lowercase letters, return an array
# of all characters that show up in all strings within the given array
# (including duplicates).
# For example, if a character occurs 3 times in all strings but not 4 times,
# you need to include that character three times in the final answer.

# Examples:
p common_chars(%w[bella label roller]) == %w[e l l]
p common_chars(%w[cool lock cook]) == %w[c o]
p common_chars(%w[hello goodbye booya random]) == %w[o]
p common_chars(%w[aabbaaaa ccdddddd eeffee ggrrrrr yyyzzz]) == []
