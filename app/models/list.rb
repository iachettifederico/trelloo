# frozen_string_literal: true

class List < ApplicationRecord
  belongs_to :board, touch: true
  has_many :tasks, -> { order(position: :asc) }, dependent: :destroy

  broadcasts_refreshes

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

# == Schema Information
#
# Table name: lists
#
#  id         :integer          not null, primary key
#  name       :string
#  board_id   :integer          not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_lists_on_board_id  (board_id)
#
# Foreign Keys
#
#  board_id  (board_id => boards.id)
#
