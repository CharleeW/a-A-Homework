class Board
  attr_accessor :cups
 
  def initialize(name1, name2)
    @name1 = name1
    @name2 = name2
    @cups = Array.new(14){Array.new}
    place_stones
  end

  def place_stones
    @cups[0..5].each {|arr| 4.times {arr << :stone}}
    @cups[7..12].each {|arr| 4.times {arr << :stone}}
  end

  def valid_move?(start_pos)
      raise "Invalid starting cup" if !(0...6).include?(start_pos) && !(7...13).include?(start_pos)
      raise "Starting cup is empty" if @cups[start_pos].empty?
  end

  def make_move(start_pos, current_player_name)
    quantity = @cups[start_pos].length
    @cups[start_pos] = Array.new

      if current_player_name == @name1
        skip = 13 
      else
        skip = 6
      end
      ending_cup_idx = drop_stones(start_pos, quantity, skip)
      render
      next_turn(ending_cup_idx)
  end

  def drop_stones(i, quantity, skip)

    until quantity == 0 do
      i = (i + 1) % 14
      if i != skip
        @cups[i] << :stone 
        quantity -= 1
      end
    end
    return i
  end


  def next_turn(ending_cup_idx)
    # helper method to determine whether #make_move returns :switch, :prompt, or ending_cup_idx
    p ending_cup_idx
    return :prompt if ending_cup_idx == 13 || ending_cup_idx == 6
    return :switch if @cups[ending_cup_idx].length == 1
    return ending_cup_idx if !(@cups[ending_cup_idx].empty?)

  end

  def render
    print "      #{@cups[7..12].reverse.map { |cup| cup.count }}      \n"
    puts "#{@cups[13].count} -------------------------- #{@cups[6].count}"
    print "      #{@cups.take(6).map { |cup| cup.count }}      \n"
    puts ""
    puts ""
  end

  def one_side_empty?
    top_half = @cups[7...13]
    bottom_half = @cups[0...6]
    return true if top_half.all? {|ele| ele.empty? } || bottom_half.all? {|ele| ele.empty? }
    false
  end

  def winner
    return :draw if @cups[6] == @cups[13]
    if @cups[6].length > @cups[13].length
      return @name1 
    else
      return @name2
    end
  end
end
