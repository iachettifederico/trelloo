# frozen_string_literal: true

class Sorting
  def initialize(id:, position:, to_parent_id:)
    @id = id
    @position = position
    @to_parent_id = to_parent_id
  end

  def call
    if parent == to_parent

      move_to_same_container
    else
      move_to_other_container

    end
  end

  private

  attr_reader :id
  attr_reader :position
  attr_reader :to_parent_id

  def item
    Task.find(id)
  end

  def parent
    item.parent
  end

  def to_parent
    List.find(to_parent_id)
  end

  def move_to_same_container
    task_list = to_parent.tasks.pluck(:position, :id).to_h

    if item.position < position
      task_list[position + 0.5] = task_list.delete(item.position)
    elsif position < item.position
      task_list[position - 0.5] = task_list.delete(item.position)
    end

    result = task_list.sort_by(&:first).map.with_index { |current_item, index|
      { id: current_item.last, position: index }
    }

    ApplicationRecord.transaction do
      result.each do |current_item|
        Task.find(current_item[:id]).update(position: current_item[:position])
      end
    end
  end

  def move_to_other_container
    to_parent.tasks_after_position(position).each_with_index do |current_item, index|
      current_item.update(position: position + index + 1)
    end
    item.update(list: to_parent, position: position)
    parent.update_task_positions!
    to_parent.update_task_positions!
  end
end
