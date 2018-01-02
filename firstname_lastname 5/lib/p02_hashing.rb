class Fixnum
  # Fixnum#hash already implemented for you
end

class Array
  def hash
    hash = 1
    self.each_with_index do |num, idx|
      hash *= (((19 * idx) + num) * 187)
    end
    hash
  end
end

class String
  def hash
    hash = 1
    alphabet = ("A".."z").to_a
    arr = self.split("")
    arr.each_with_index do |char, idx|
      hash *= (((19 * idx) + alphabet.index(char)) * 187)
    end
    hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    hash = 1
    self.each { |k, v| hash *= (k.hash + v.hash) }
    hash
  end
end
