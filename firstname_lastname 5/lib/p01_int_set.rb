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

  private

  def is_valid?(num)
  end

  def validate!(num)
  end
end


class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
  end

  def remove(num)
  end

  def include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
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
  end

  def remove(num)
  end

  def include?(num)
  end

  private

  def [](num)
    # optional but useful; return the bucket corresponding to `num`
  end

  def num_buckets
    @store.length
  end

  def resize!
  end
end
