require './test/test_helper'

class NodeTest < Minitest::Test
  def setup
    @node = Node.new("plop")

  end
  def test_it_exists
    assert_instance_of Node, @node
  end

  def test_data_returns_plop
    assert_equal @node.data, "plop"
  end

  def test_next_node_returns_nil
    assert_equal @node.next_node, nil
  end

  def test_next_empty_returns_true_if_next_node_is_nil
    assert_equal @node.next_empty?, true
  end

  def test_next_node_can_receive_and_hold_data
    @node.next_node = "boop"

    assert_equal @node.next_node, "boop"
  end
end
