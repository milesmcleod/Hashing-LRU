class MaxIntSet
  def initialize(max)
    @store = Array.new(max)
  end

  def insert(num)
    if num > 0 && num < @store.length
      @store[num] = true
    else
      raise "Out of bounds"
    end
  end

  def remove(num)
    if num > 0 && num < @store.length
      @store[num] = false
    else
      raise "Out of bounds"
    end
  end

  def include?(num)
    if num > 0 && num < @store.length
      @store[num]
    else
      raise "Out of bounds"
    end
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    self[num].push(num)
  end

  def remove(num)
    self[num].delete(num)
  end

  def include?(num)
    self[num].include?(num)
  end

  private

  def [](num)
    @store[num % @store.length]
  end

  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count

  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end

  def insert(num)
    @count += 1
    resize! if @count == num_buckets
    self[num].push(num)
  end

  def remove(num)
    self[num].delete(num)
    @count -= 1
  end

  def include?(num)
    self[num].include?(num)
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
        if el % num_buckets != idx
          arr.delete(el)
          self[el].push(el)
        end
      end
    end
  end
end
