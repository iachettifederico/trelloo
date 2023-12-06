# frozen_string_literal: true

class SingleTextField < ApplicationForm
  def initialize(model:, field:, placeholder: nil, **html_options)
    @model = model
    @field = field
    @placeholder = placeholder
    @html_options = html_options
  end

  def template
    ap model: model, field: field
    turbo_frame_tag([dom_id(model), field]) do
      render ApplicationForm.for(model) do |form|
        form.text_field(field, placeholder: placeholder, autofocus: true, **html_options)
      end
    end
  end

  private

  attr_reader :model
  attr_reader :field
  attr_reader :placeholder
  attr_reader :html_options
end
