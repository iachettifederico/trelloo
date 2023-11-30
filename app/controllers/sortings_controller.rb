# frozen_string_literal: true

class SortingsController < ApplicationController
  def create
    ap(
      sorting_params: sorting_params.to_unsafe_hash,
    )
    Sorting.new(
      id:           id,
      position:     position,
      to_parent_id: to_parent_id
    ).call

    redirect_to board_path(item.board)
  end

  private

  def sorting_params
    params.require(:sorting).permit(:id, :position, :to_parent_id)
  end

  def id
    sorting_params.fetch(:id)
  end

  def item
    Task.find(id)
  end

  def position
    sorting_params.fetch(:position)
  end

  def to_parent_id
    sorting_params.fetch(:to_parent_id)
  end
end
