# frozen_string_literal: true

# Basic algorithm:
# - Count chars in second string, then check whether the first string has at
#   least that many chars.

# Data structure: Hash map for chars and counts.

def char_count_map(string)
  map = Hash.new { |h, k| h[k] = 0 }

  string.chars.uniq.each do |char|
    map[char] += string.count(char)
  end

  map
end

def scramble(string1, string2)
  string2_char_count_map = char_count_map(string2)

  string2.chars.uniq.all? do |char|
    string1.count(char) >= string2_char_count_map[char]
  end
end

p scramble('javaass', 'jjss') == false
p scramble('rkqodlw', 'world') == true
p scramble('cedewaraaossoqqyt', 'codewars') == true
p scramble('katas', 'steak') == false
p scramble('scriptjava', 'javascript') == true
p scramble('scriptingjava', 'javascript') == true
