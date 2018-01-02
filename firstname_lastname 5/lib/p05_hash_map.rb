require_relative 'p02_hashing'
require_relative 'p04_linked_list'

class HashMap
  include Enumerable

  attr_reader :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { LinkedList.new }
    @count = 0
  end

  def include?(key)
    hash = key.hash
    @store[hash % num_buckets].include?(key)
  end

  def set(key, val)
    hash = key.hash
    if self.include?(key)
      @store[hash % num_buckets].update(key, val)
    else
      resize! if @count == num_buckets
      @store[hash % num_buckets].append(key, val)
      @count += 1
    end
  end

  def get(key)
    hash = key.hash
    @store[hash % num_buckets].get(key)
  end

  def delete(key)
    hash = key.hash
    if self.include?(key)
      @store[hash % num_buckets].remove(key)
      @count -= 1
    end
  end

  def each
    @store.each do |list|
      list.each { |node| yield [node.key, node.val] }
    end
  end

  # uncomment when you have Enumerable included
  def to_s
    pairs = inject([]) do |strs, (k, v)|
      strs << "#{k.to_s} => #{v.to_s}"
    end
    "{\n" + pairs.join(",\n") + "\n}"
  end

  alias_method :[], :get
  alias_method :[]=, :set

  private

  def num_buckets
    @store.length
  end

  def resize!
    @store.concat(Array.new(num_buckets) { LinkedList.new })
    @store.each_with_index do |list, idx|
      list.each do |el|
        list.remove(el)
        set(el.key, el.val)
      end
    end
  end

  def bucket(key)
    # optional but useful; return the bucket corresponding to `key`
  end
end
