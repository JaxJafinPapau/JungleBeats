require './test/test_helper'

class JungleBeatTest < Minitest::Test
  def setup
    @jb = JungleBeat.new
  end

  def test_it_exists
    assert_instance_of JungleBeat, @jb
  end

  def test_list_starts_with_no_nodes
    assert_nil @jb.list.head
  end

  def test_append_returns_its_argument
    noises = "deep doo ditt"
    assert_equal @jb.append(noises), noises
  end

  def test_append_adds_nodes_to_list
    noises = "deep doo ditt"
    @jb.append(noises)

    assert_equal @jb.list.head.data, "deep"
    assert_equal @jb.list.head.next_node.data, "doo"
  end

  def test_count_gives_a_count_of_beats
    noises = "deep doo ditt"
    @jb.append(noises)
    @jb.append("beep bop")

    assert_equal @jb.count, 5
  end

  def skip_test_play_outputs_expected_string_to_terminal
    noises = "deep doo ditt"
    @jb.append(noises)

    assert_output(/say -r 500 "deep doo ditt"/) {@jb.play}
  end
end
