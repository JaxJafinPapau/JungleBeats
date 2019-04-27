require './lib/linked_list'

class JungleBeat
  attr_accessor :list
  def initialize
    @list = LinkedList.new
  end

  def append(noises)
    noises.split(" ").each do |noise|
      @list.append(noise)
    end
    noises
  end

  def count
    @list.count
  end

  def play
    `say -r 500 #{@list.to_string}`
  end
end
