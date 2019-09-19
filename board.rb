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
    p board 
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

  def translate(letter)
    dictionary = ['A', 'B', 'C', 'D', 'E']
    dictionary.index(letter)
  end

  def select_peg
    puts "Please select a peg (i.e. C3)" 
    user_input = gets.chomp
    letter = user_input.split('')[0]
    letter_index = self.translate(letter)
    row = @board[letter_index]
    selected_index = user_input.split('')[1].to_i - 1
    selected_peg = row[selected_index]
    if is_peg?(selected_peg)
      self.move_peg(letter_index, selected_index)
    else 
      puts 'Selected space is not a peg, please try again.'
      select_peg
    end

  end

  def is_peg?(selected_peg)
    selected_peg == PEG_MARKER
  end

  def is_hole?(selected_peg)
    selected_peg == HOLE_MARKER
  end

  def move_peg(x, peg)
    puts "Where would you like to move this peg? (i.e. A1)"
    user_input = gets.chomp
    letter = user_input.split('')[0]
    letter_index = self.translate(letter)
    row = @board[letter_index]
    selected_index = user_input.split('')[1].to_i - 1
    selected_peg = row[selected_index]
    if is_hole?(selected_peg)
      @board[letter_index][selected_index] = PEG_MARKER
      @board[x][peg] = HOLE_MARKER
      p @board
      # skipped_peg
      if letter_index == x
       index_of_peg_to_skip = peg > selected_index ? peg - 1 : selected_index - 1
       @board[letter_index][index_of_peg_to_skip] = HOLE_MARKER
       p @board
      else 
        row_skipped = x > letter_index ? x - 1 : letter_index - 1 
        row_index = peg > selected_index ? selected_index - 1 : peg == selected_index ? selected_index : peg - 1
        @board[row_skipped][row_index] = HOLE_MARKER
      end
      select_peg
    else 
      puts 'Please selected an empty space'
      move_peg(x, peg)
    end
    p @board
  end


end

Board.new.print_board
Board.new.select_peg

#get user input 
## C 3
 #check if C3 is PegMarker 

#prompt where to move selected peg
#get user input
## A 1 
  # check if A 1 is HoleMarker

#replace selected peg with HoleMarker
#replace HoleMarker with PegMarker

## find skipped over peg and replace with HoleMarker