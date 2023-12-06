# frozen_string_literal: true

class Boards::ShowView < ApplicationView
  def initialize(board:)
    @board = board
  end

  def template
    single_field_wrapper(model: board, field: :name) do
      link_to(board.name, edit_board_path(board, field: :name), class: "mb-3 font-semibold text-lg")
    end

    div(class: "mt-4 flex gap-2") {
      board.lists.each do |list|
        render ListComponent.for(list)
      end
    }
  end

  private

  attr_reader :board
end
