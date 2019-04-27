require './test/test_helper'

class LinkedListTest < Minitest::Test
  def setup
    @linked_list = LinkedList.new
  end

  def test_it_exists
    assert_instance_of LinkedList, @linked_list
  end

  def test_head_starts_as_nil
    assert_equal @linked_list.head, nil
  end

  def test_append_returns_its_argument
    assert_equal @linked_list.append("doop"), "doop"
  end

  def test_append_adds_new_node_to_end_of_list
    @linked_list.append("doop")
    assert_instance_of Node, @linked_list.head
  end

  def test_to_string_returns_head_node
    @linked_list.append("doop")
    assert_equal @linked_list.to_string, "doop"
  end

  def test_count_returns_zero_for_empty_list
    assert_equal 0, @linked_list.count
  end

  def test_count_returns_one_for_list_with_one_node
    @linked_list.append("doop")
    assert_equal @linked_list.count, 1
  end

  def test_count_returns_three_for_list_with_three_nodes
    @linked_list.append("doop")
    @linked_list.append("beep")
    @linked_list.append("bop")

    assert_equal @linked_list.count, 3
  end

  def test_append_multiple_nodes
    @linked_list.append("doop")
    @linked_list.append("bop")
    @linked_list.append("deep")
    assert_equal @linked_list.head.next_node.data, "bop"
  end

  def test_last_node_returns_the_end_of_the_list
    @linked_list.append("doop")
    @linked_list.append("bop")
    @linked_list.append("beep")

    expected = @linked_list.last_node(@linked_list.head)
    assert_equal expected.data, "beep"
  end

  def test_count_nodes_returns_expected_aggregator
    @linked_list.append("doop")
    expected = @linked_list.count_nodes(@linked_list.head, 1)

    assert_equal expected, 1
  end

  def test_to_string_returns_all_when_list_contains_multiple_nodes
    @linked_list.append("doop")
    @linked_list.append("deep")
    @linked_list.append("bop")

    assert_equal @linked_list.to_string, "doop deep bop"
  end

  def test_prepend_put_new_node_at_head
    @linked_list.append("doop")
    @linked_list.append("deep")
    @linked_list.prepend("bop")

    assert_equal @linked_list.to_string, "bop doop deep"
  end

  def test_insert_puts_new_node_at_specified_index
    @linked_list.append("doop")
    @linked_list.append("deep")
    @linked_list.insert(1, "bop")

    assert_equal @linked_list.to_string, "doop bop deep"
  end

  def test_node_at_index_returns_correct_node
    @linked_list.append("doop")
    @linked_list.append("deep")

    expected = @linked_list.node_at_index(@linked_list.head, 1)

    assert_instance_of Node, expected
    assert_equal expected.data, "deep"
  end

  def test_find_returns_expected_node
    @linked_list.append("deep")
    @linked_list.append("boop")
    @linked_list.append("doop")
    @linked_list.append("bop")

    assert_equal @linked_list.find(1, 2), "boop doop"
  end

  def test_includes_returns_true_when_passed_noise_is_present
    @linked_list.append("deep")
    @linked_list.append("boop")
    @linked_list.append("doop")
    @linked_list.append("bop")

    assert_equal @linked_list.includes?("doop"), true
  end

  def test_includes_returns_false_when_passed_noise_is_not_present
    @linked_list.append("deep")
    @linked_list.append("boop")
    @linked_list.append("doop")
    @linked_list.append("bop")

    assert_equal @linked_list.includes?("boot"), false
  end

  def test_pop_removes_and_returns_the_last_node
    @linked_list.append("deep")
    @linked_list.append("boop")
    @linked_list.append("doop")
    @linked_list.append("bop")

    expected = @linked_list.pop
    
    assert_equal expected, "bop"
    assert_equal @linked_list.to_string, "deep boop doop"
  end
end
