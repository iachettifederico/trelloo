# frozen_string_literal: true

class List < ApplicationRecord
  belongs_to :board
  has_many :tasks, -> { order(position: :asc) }, dependent: :destroy

  def sortables
    tasks
  end

  def tasks_before_position(position)
    tasks.where("position >= 0 AND position < ?", position)
  end

  def tasks_after_position(position)
    tasks.where("position >= ?", position)
  end

  def update_task_positions!
    tasks.each_with_index do |task, position|
      task.update(position: position)
    end
  end
end
