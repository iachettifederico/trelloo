# frozen_string_literal: true

class Board < ApplicationRecord
  has_many :lists, dependent: :destroy
end

# == Schema Information
#
# Table name: boards
#
#  id         :integer          not null, primary key
#  name       :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
