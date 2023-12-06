# frozen_string_literal: true

class Task < ApplicationRecord
  belongs_to :list, touch: true
  has_one :board, through: :list, dependent: :destroy

  has_rich_text :description

  broadcasts_refreshes

  def parent
    list
  end

  def task_bg_color
    list.task_bg_color
  end
end

# == Schema Information
#
# Table name: tasks
#
#  id         :integer          not null, primary key
#  name       :string
#  list_id    :integer          not null
#  position   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_tasks_on_list_id  (list_id)
#
# Foreign Keys
#
#  list_id  (list_id => lists.id)
#
