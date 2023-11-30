# frozen_string_literal: true

class Task < ApplicationRecord
  belongs_to :list

  has_rich_text :description
end
