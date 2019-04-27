require './lib/node'

class LinkedList
  attr_accessor :head
  def initialize
    @head = nil
  end

  def append(noise)
    node = Node.new(noise)
    if @head.nil?
      self.head = node
    else
      last_node(@head).next_node = node
    end
    noise
  end

  def prepend(noise)
    node = Node.new(noise)
    node.next_node = @head
    self.head = node
  end

  def insert(index, noise)
    node = Node.new(noise)
    left_node = node_at_index(@head, index - 1)
    right_node = node_at_index(@head, index)
    left_node.next_node = node
    node.next_node = right_node
  end

  def find(index, node_count)
    first_node = node_at_index(@head, index)
    return first_node.data if node_count == 1
    recursive_string_builder(first_node.data, first_node.next_node, node_count -= 1)
  end

  def to_string
    return "" if @head.nil?
    return @head.data if @head.next_empty?
    recursive_string_builder(@head.data, @head.next_node)
  end

  def count
    if @head.nil?
      0
    else
      count_nodes(@head, 1)
    end
  end

  def last_node(starting_node)
    return starting_node if starting_node.next_empty?
    last_node(starting_node.next_node)
  end

  def count_nodes(starting_node, aggregator)
    return aggregator if starting_node.next_empty?
    count_nodes(starting_node.next_node, aggregator += 1)
  end

  def concat_nodes(noise, node)
    "#{noise} #{node.data}"
  end

  def recursive_string_builder(noise, node, end_index = nil, aggregator = 1)
    return concat_nodes(noise, node) if node.next_empty? || end_index == aggregator
    recursive_string_builder(concat_nodes(noise, node), node.next_node, end_index, aggregator += 1)
  end

  def node_at_index(starting_node, index, aggregator = 0)
    return starting_node if index == aggregator
    node_at_index(starting_node.next_node, index, aggregator += 1)
  end

  def includes?(starting_node = @head, noise)
    return true if starting_node.data == noise
    return false if starting_node.next_empty?
    includes?(starting_node.next_node, noise)
  end

  def pop
    new_last_node = node_at_index(@head, count - 2)
    old_last_node = new_last_node.next_node
    new_last_node.next_node = nil
    old_last_node.data
  end
end
