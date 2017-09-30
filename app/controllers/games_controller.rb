class GamesController < ApplicationController

  def create
    p params
    Game.create(
      id_s: params[:id],
      first_turn: params[:first_turn],
      training: params[:training],
      jumps: params[:jumps],
      board: params[:board]
    )
    render json: {status: :ok}
  end

  def show
    p params
    game = Game.find_by(id_s: params[:id])
    p game
    color = params[:color]

    board = game.board['cells']
    my_cells = Smart.my_cells(board, color.to_i)

    # my_cells.delete_if do |cell|
    #   adjacent = Smart.adjacent_to(cell.x, cell.y, board)
    #   free_adjacent = Smart.available_cells(adjacent)
    #   free_adjacent.empty?
    # end
    #
    # my_cell = my_cells.sample
    # adjacent = Smart.adjacent_to(my_cell.x, my_cell.y, board)
    # free_adjacent = Smart.available_cells(adjacent)
    # move_to = free_adjacent.sample
    enemy_color = (color.to_i == 1 ? 2 : 1)
    jumps = 0
    # binding.pry
    move = Smart.priority_move(my_cells, enemy_color, board, jumps)

    # binding.pry
    # render json: {
    #   status: :ok,
    #   move_from: [0 ,2],
    #   move_to: [0, 3]
    # }
    render json: {
      status: :ok,
      move_from: [move.from.y, move.from.x],
      move_to: [move.to.y, move.to.x]
    }
  end

  def update
    p params
    game = Game.find_by(id_s: params[:id])
    board = updated_board(game.board, params[:changes])
    p board
    game.update(
      jumps: params[:jumps],
      board: board
    )
    render json: {status: :ok}
  end

  def destroy
    p params
    Game.find_by(id_s: params[:id]).destroy
    render json: {status: :ok}
  end

  private

  def updated_board(board, changes)
    changes.each do |change|
      board["cells"][change[0]][change[1]] = change[3]
    end
    return board
  end
end
