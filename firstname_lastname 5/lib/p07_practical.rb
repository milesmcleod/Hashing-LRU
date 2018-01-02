require_relative 'p05_hash_map'

def can_string_be_palindrome?(string)
  map = HashMap.new
  single_counts = 0
  string.split("").each do |char|
    if map[char]
      map[char] += 1
    else
      map[char] = 1
    end
  end
  map.each do |k, v|
    single_counts += 1 if v % 2 != 0
  end
  return false if single_counts > 1
  true
end
