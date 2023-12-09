# frozen_string_literal: true

class Task < ApplicationRecord
  broadcasts_refreshes

  belongs_to :list, touch: true
  has_one :board, through: :list, dependent: :destroy

  has_rich_text :description

  validates :name, presence: true

  def parent = list

  delegate :task_bg_color, to: :list
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
