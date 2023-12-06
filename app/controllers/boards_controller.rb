# frozen_string_literal: true

class BoardsController < ApplicationController
  def index
    render Boards::IndexView.new(boards: Board.all)
  end

  def show
    render Boards::ShowView.new(board: board)
  end

  def edit
    render SingleFieldFor.new(model: board, field: field)
  end

  def update
    if board.update(board_params)
      render Boards::ShowView.new(board: board)
    else
      ap "no"
    end
  end

  private

  def board
    Board.find(params[:id])
  end

  def board_params
    params.require(:board).permit(:name)
  end

  def field
    params[:field]
  end
end
