class Cell
  attr_accessor :x, :y, :value

  def initialize(y, x, value)
    @y = y
    @x = x
    @value = value
  end
end


module Smart
  # code here
  def self.adjacent_to x, y, board
    neighbours = []

    neighbours << Cell.new(y, x+1, board[y][x+1]) if x+1 < board[0].length
    neighbours << Cell.new(y, x-1, board[y][x-1]) if x-1 > 0
    if(y.odd?) then
      neighbours << Cell.new(y-1, x, board[y-1][x]) if y - 1 > 0
      neighbours << Cell.new(y-1, x+1, board[y-1][x+1]) if y -1 > 0 && x + 1 < board[0].length
      neighbours << Cell.new(y+1, x, board[y+1][x]) if y + 1 < board.length
      neighbours << Cell.new(y+1, x+1, board[y+1][x+1]) if x + 1 < board[0].length && y + 1 < board.length
    else
      neighbours << Cell.new(y-1, x-1, board[y-1][x-1]) if y-1 > 0 && x-1 > 0
      neighbours << Cell.new(y-1, x, board[y-1][x]) if y-1 > 0
      neighbours << Cell.new(y+1, x-1, board[y+1][x-1]) if x-1 > 0 && y+1 < board.length
      neighbours << Cell.new(y+1, x, board[y+1][x]) if y+1 < board.length
    end
    return neighbours
  end

  def self.my_cells(board, color)
    cells = []
    board.each.with_index do |row, y|
      row.each.with_index do |c, x|
        cells << Cell.new(y, x, c) if c == color
      end
    end
    return cells
  end

  def self.available_cells(cells)
    cells.reject do |c|
      c.value != 0
    end
  end
end
