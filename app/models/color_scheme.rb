# frozen_string_literal: true

Dir["#{__dir__}/color_scheme/*.rb"].each do |subclass_file|
  require subclass_file
end

class ColorScheme
  def self.sample
    subclasses.sample.new
  end

  def self.for(color_name)
    return color_name if color_name.is_a?(self)

    subclasses.find { |subclass|
      subclass.name == color_name
    }.new
  end

  def self.name
    to_s.gsub("ColorScheme::", "").downcase
  end

  def name
    self.class.name
  end
end
