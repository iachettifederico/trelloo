# frozen_string_literal: true

require "rails_helper"

RSpec.describe ColorScheme do
  it "can be instantiated" do
    color_scheme = ColorScheme.for("blue")

    expect(color_scheme.name).to eq("blue")
  end

  it "can be instantiated" do
    original = ColorScheme.for("blue")
    color_scheme = ColorScheme.for(original)

    expect(color_scheme.name).to eq("blue")
  end
end
