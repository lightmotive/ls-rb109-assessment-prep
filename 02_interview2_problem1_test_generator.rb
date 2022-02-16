# frozen_string_literal: true

require_relative '02_interview2_problem1'

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

def print_next_bigger_number_details(permutations_unique)
  return puts 'No bigger numbers.' if permutations_unique.empty?

  puts "Next bigger number: #{permutations_unique.first.join.to_i}"
  puts "Unique permutations of bigger numbers: #{permutations_unique.size}"
end

def print_test_number_generator_results(test_number)
  permutations_unique = bigger_number_permutations_unique(test_number)

  print_next_bigger_number_details(permutations_unique)
  return if permutations_unique.empty?

  order_matches =
    solution_sequence_matches_permutation_sequence(
      test_number, permutations_unique
    )

  puts 'Solution enumeration sequence matches sorted permutations? ' \
  "#{order_matches ? 'Yes' : 'No'}"

  nil
end

system('clear')
puts "* Find the next-biggest number using the digits of a number *\n\n"
loop do
  print "What's the number? "
  number = gets.chomp.to_i

  puts
  print_test_number_generator_results(number)

  print "\nWould you like to check another number? "
  break if gets.strip.downcase[0] != 'y'

  puts
end
