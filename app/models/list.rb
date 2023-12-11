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

  def color_scheme
    ColorScheme.for(read_attribute(:color_scheme))
  end

  def color_scheme=(a_color_scheme)
    raise "Invalid color scheme" unless a_color_scheme.is_a?(String) || a_color_scheme.is_a?(ColorScheme)

    write_attribute(:color_scheme, ColorScheme.for(a_color_scheme).name)
  end
end

# == Schema Information
#
# Table name: lists
#
#  id           :integer          not null, primary key
#  name         :string
#  board_id     :integer          not null
#  color_scheme :string
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#
# Indexes
#
#  index_lists_on_board_id  (board_id)
#
# Foreign Keys
#
#  board_id  (board_id => boards.id)
#
