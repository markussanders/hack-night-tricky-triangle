class Board

  BOARD_SIZE = 5
  PEG_MARKER = '•'
  HOLE_MARKER = 'o'

  def initialize
    @board = create_initial_board
  end

  def create_initial_board
    number_of_spaces = find_number_of_spaces
    positions = all_positions(number_of_spaces)
    divide_board(positions)
  end

  def find_number_of_spaces
    (BOARD_SIZE * BOARD_SIZE) - BOARD_SIZE
  end

  def all_positions(number_of_spaces)
    positions = Array.new(number_of_spaces, PEG_MARKER)
    positions[0] = HOLE_MARKER
    positions
  end

  def divide_board(positions)
    board = []
    positions.each_with_index do |_a, i|
      board.push(positions.shift(i + 1))
    end
    board
  end

  def print_board
    column_num = 1
    puts "               #{column_num}"
    @board.each_with_index do |row, index|
      column_num += 1
      print "#{map_row_to_alphabet(index)}#{row_front_padding(index)}"
      print_board_row(row)
      print_column_number(column_num)
    end
  end

  def print_board_row(row)
    row.each do |space|
      print "#{space}   "
    end
  end

  def print_column_number(column_number)
     puts (column_number <= BOARD_SIZE ? "#{column_number}" : '')
  end

  def row_front_padding(row_number)
    '  ' * ((BOARD_SIZE + 1) - row_number)
  end

  def map_row_to_alphabet(row_number)
    alphabet = 'A'..'Z'
    rows = alphabet.to_a.first(BOARD_SIZE)
    rows[row_number]
  end

end

Board.new.print_board
