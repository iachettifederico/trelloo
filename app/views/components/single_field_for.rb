# frozen_string_literal: true

class SingleFieldFor < ApplicationForm
  def initialize(model:, field:, type: :text, placeholder: nil, **html_options)
    @model = model
    @field = field
    @type = type
    @placeholder = placeholder
    @html_options = html_options
  end

  def template
    turbo_frame_tag([dom_id(model), field]) do
      render ApplicationForm.for(model) do |form|
        form.hidden_field_tag(:field, value: field)
        form.send("#{type}_field", field, placeholder: placeholder, autofocus: true, **html_options)
        errors_for(field)
      end
    end
  end

  private

  attr_reader :model
  attr_reader :field
  attr_reader :type
  attr_reader :placeholder
  attr_reader :html_options
end
