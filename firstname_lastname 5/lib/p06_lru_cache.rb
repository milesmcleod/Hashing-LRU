require_relative 'p05_hash_map'
require_relative 'p04_linked_list'
require 'byebug'

class LRUCache
  attr_reader :count
  def initialize(max, prc)
    @map = HashMap.new
    @store = LinkedList.new
    @max = max
    @prc = prc
  end

  def count
    @map.count
  end

  def get(key)
    if @map[key]
      update_node!(@map[key])
    else
      calc!(key)
    end
    @map[key].val
  end

  def to_s
    "Map: " + @map.to_s + "\n" + "Store: " + @store.to_s
  end

  private

  def calc!(key)
    eject! if @map.count == @max
    square = @prc.call(key)
    @store.append(key, square)
    @map[key] = @store.last
  end

  def update_node!(node)
    node.remove
    @store.append(node.key, node.val)
  end

  def eject!
    node = @store.first
    node.remove
    @map.delete(node.key)
  end
end
