tBoard = Struct.new(:y, :x, :value)

module Smart
  # code here
  def self.adjacent_to x, y, board
    neighbours = []

    neighbours << board[y][x+1] if x+1 < board[0].length
    neighbours << board[y][x-1] if x-1 > 0
    if(y.odd?) then
      neighbours << tBoard.new(y-1, x, board[y-1][x]) if y - 1 > 0
      neighbours << tBoard.new(y-1, x+1, board[y-1][x+1]) if y -1 > 0 && x + 1 < board[0].length
      neighbours << tBoard.new(y+1, x, board[y+1][x]) if y + 1 < board.length
      neighbours << tBoard.new(y+1, x+1, board[y+1][x+1]) if x + 1 < board[0].length && y + 1 < board.length
    else
      neighbours << tBoard.new(y-1, x-1, board[y-1][x-1]) if y-1 > 0 && x-1 > 0
      neighbours << tBoard.new(y-1, x, board[y-1][x]) if y-1 > 0
      neighbours << tBoard.new(y+1, x-1, board[y+1][x-1]) if x-1 > 0 && y+1 < board.length
      neighbours << tBoard.new(y+1, x, board[y+1][x]) if y+1 < board.length
    end
    return neighbours
  end

  def self.my_cells(board, color)
    board.each.with_index do |row, y|
      row.each.with_index do |c, x|

      end
    end
  end
end
