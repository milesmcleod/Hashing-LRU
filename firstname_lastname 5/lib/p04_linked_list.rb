class Node
  attr_accessor :key, :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    @next.prev = @prev
    @prev.next = @next
  end
end

class LinkedList

  include Enumerable

  def initialize
    @front = Node.new()
    @back = Node.new()
    @front.next = @back
    @back.prev = @front
  end

  def [](i)
    count = 0
    each do |el|
      return el if i == count
      count += 1
    end
  end

  def first
    empty? ? nil : @front.next
  end

  def last
    empty? ? nil : @back.prev
  end

  def empty?
    @front.next == @back
  end

  def get(key)
    each { |el| return el.val if el.key == key }
    nil
  end

  def include?(key)
    each { |el| return true if el.key == key }
    false
  end

  def append(key, val)
    node = Node.new(key, val)
    last = @back.prev
    node.prev = last
    node.next = @back
    last.next = node
    @back.prev = node
  end

  def update(key, val)
    each { |el| el.val = val if el.key == key }
  end

  def remove(key)
    each { |el| el.remove if el.key == key }
  end

  def each
    current_node = @front.next
    until current_node == @back
      yield current_node
      current_node = current_node.next
    end
  end

  # uncomment when you have `each` working and `Enumerable` included
  def to_s
    inject([]) { |acc, node| acc << "[#{node.key}, #{node.val}]" }.join(", ")
  end
end
