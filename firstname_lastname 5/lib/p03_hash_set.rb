require_relative 'p02_hashing'

class HashSet
  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(key)
    @count += 1
    resize! if count >= num_buckets
    self[key.hash].push(key)
  end

  def include?(key)
    self[key.hash].include?(key)
  end

  def remove(key)
    self[key.hash].delete(key)
    @count -= 1
  end

  private

  def [](num)
    @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    @store.concat(Array.new(num_buckets) { Array.new })
    @store.each_with_index do |arr, idx|
      arr.each do |el|
        if el.hash % num_buckets != idx
          arr.delete(el)
          self[el.hash].push(el)
        end
      end
    end
  end
end
