# frozen_string_literal: true

require "rails_helper"

RSpec.describe List, type: :model do
  describe "color scheme" do
    it "has a color scheme" do
      list = List.new(name: "a blue list", color_scheme: "blue")

      expect(list.color_scheme.name).to eq("blue")
    end

    it "can be initialized with a ColorScheme" do
      color_scheme = ColorScheme.for("blue")

      list = List.new(name: "another blue list", color_scheme: color_scheme)

      expect(list.color_scheme.name).to eq("blue")
    end
  end
end
