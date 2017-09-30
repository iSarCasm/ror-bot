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
    render json: {
      status: :ok,
      move_from: [0,2],
      move_to: [0,3]
    }
  end

  def update
    p params
    render json: {status: :ok}
  end

  def destroy
    p params
    render json: {status: :ok}
  end

  private

  def game_params

  end

end
