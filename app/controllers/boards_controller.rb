# frozen_string_literal: true

class BoardsController < ApplicationController
  def index
    render Boards::IndexView.new(boards: Board.all)
  end

  def show
    render Boards::ShowView.new(board: board)
  end

  private

  def board
    Board.find(params[:id])
  end
end
