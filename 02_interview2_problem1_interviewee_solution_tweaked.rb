require_relative '02_interview2_problem1'

# * Tweak the Launch School-approved interviewee solution to make it work. *

def next_bigger_num_interview(input)
  max = max_num(input)
  (input + 1..max).each do |num|
    return num if max == max_num(num)
  end
  -1
end

require_relative '../ruby-common/test'
require_relative '../ruby-common/benchmark_report'

TESTS = [
  { input: 9, expected_output: -1 },
  { input: 12, expected_output: 21 },
  { input: 513, expected_output: 531 },
  { input: 2017, expected_output: 2071 },
  { input: 111, expected_output: -1 },
  { input: 531, expected_output: -1 },
  { input: 123_456_789, expected_output: 123_456_798 },
  { input: 123_666_888, expected_output: 123_668_688 },
  { input: 123_654_999, expected_output: 123_659_499 },
  { input: 123_999_999, expected_output: 129_399_999 }
].freeze

run_tests('next_bigger_num',
          TESTS, ->(input) { next_bigger_num(input) })
run_tests('next_bigger_num_interview',
          TESTS, ->(input) { next_bigger_num_interview(input) })

benchmark_report(
  1, 1, TESTS,
  [
    { label: 'next_bigger_num',
      method: ->(input) { next_bigger_num(input) } },
    { label: 'next_bigger_num_interview',
      method: ->(input) { next_bigger_num_interview(input) } }
  ]
)

# * Analysis *
# The solution passed in the interview doesn't work with larger numbers.
# The program is killed for using too much memory, so I'm not sure why it was
# given a pass. See 02_interview2_problem1_screenshot_program_killed.png in
# this file's directory.

# Will inquire with Launch School staff--possibly an oversight, or maybe I
# need to adjust configured limits.
