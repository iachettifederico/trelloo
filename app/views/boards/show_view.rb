# frozen_string_literal: true

class Boards::ShowView < ApplicationView
  def initialize(board:)
    @board = board
  end

  def template
    h1(class: "mb-3 font-semibold text-lg") { board.name }

    div(
      class: "flex gap-2",
      data:  { controller: "sortable" },
    ) {
      board.lists.each do |list|
        render ListComponent.for(list)
      end
    }
  end

  private

  attr_reader :board
end
