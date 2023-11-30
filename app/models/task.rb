# frozen_string_literal: true

class Task < ApplicationRecord
  belongs_to :list

  has_one :board, through: :list

  has_rich_text :description

  def parent
    list
  end
end
