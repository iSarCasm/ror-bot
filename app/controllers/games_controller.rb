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
    render json: {
      status: :ok,
      move_from: [0,2],
      move_to: [0,3]
    }
  end

  def update
    p params
    game = Game.find_by(id_s: params[:id])
    board = updated_board(game.board, params[:changes])
    p "HELLOOOO"
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
