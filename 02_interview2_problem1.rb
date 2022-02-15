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

# Examples:

p next_bigger_num(9) == -1
p next_bigger_num(12) == 21
p next_bigger_num(513) == 531
p next_bigger_num(2017) == 2071
p next_bigger_num(111) == -1
p next_bigger_num(531) == -1
p next_bigger_num(123_456_789) == 123_456_798
