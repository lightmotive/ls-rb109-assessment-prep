# frozen_string_literal: true

# Basic algorithm:
# - For each char in the second string, check whether first string has at least
#   as many of those chars as the second string.

def scramble(string1, string2)
  string2.chars.uniq.all? { |char| string1.count(char) >= string2.count(char) }
end

p scramble('javaass', 'jjss') == false
p scramble('rkqodlw', 'world') == true
p scramble('cedewaraaossoqqyt', 'codewars') == true
p scramble('katas', 'steak') == false
p scramble('scriptjava', 'javascript') == true
p scramble('scriptingjava', 'javascript') == true
