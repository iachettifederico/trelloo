# frozen_string_literal: true

class Boards::IndexView < ApplicationView
  def initialize(boards:)
    @boards = boards
  end

  def template
    div(class: "") {
      boards.each do |board|
        link_to board.name, board_path(board), class: "bg-green-100 hover:bg-green-50 p-8 border shadow-lg hover:shadow-none"
      end
    }
  end

  private

  attr_reader :boards
end
