# frozen_string_literal: true

class ApplicationForm < ApplicationComponent
  attr_reader :model

  def self.for(model, **, &)
    new(model: model, **, &)
  end

  def template(&)
    form(action: url, method: method, class: options[:class], &)
  end

  def text_field(field, placeholder: "", **html_options)
    field_for(
      field:       field,
      type:        "text",
      value:       model.send(field),
      placeholder: placeholder,
      css_class:   html_options.delete(:class),
      **html_options,
    )
  end

  def text_field_tag(field, value: "", placeholder: "", **html_options)
    input(
      name:        field,
      type:        "text",
      value:       value,
      placeholder: placeholder,
      css_class:   html_options.delete(:class),
      **html_options,
    )
  end

  def hidden_field_tag(field, value: "", placeholder: "", **html_options)
    input(
      name:        field,
      type:        "hidden",
      value:       value,
      placeholder: placeholder,
      css_class:   html_options.delete(:class),
      **html_options,
    )
  end

  def hidden_field(field, placeholder: "", **html_options)
    field_for(
      field:       field,
      type:        "hidden",
      value:       model.send(field),
      placeholder: placeholder,
      css_class:   html_options.delete(:class),
      **html_options,
    )
  end

  def number_field(field, placeholder: "", **html_options)
    field_for(
      field:       field,
      type:        "number",
      value:       model.send(field),
      placeholder: placeholder,
      css_class:   html_options.delete(:class),
      **html_options,
    )
  end

  def submit(text)
    button(type: "submit") { text }
  end

  def errors_for(field)
    return unless errors?

    div(class: "text-sm text-red-500") {
      model.errors[field].each do |error|
        div { error }
      end
    }
  end

  delegate :errors, to: :model

  def valid?
    !errors?
  end

  def errors?
    model.errors.any?
  end

  private

  attr_reader :options

  def initialize(model:, **options, &block)
    @model = model
    @options = options

    block.call(self) if block_given?
  end

  def field_for(field:, type: "text", value: "", placeholder: "", css_class: "", **)
    input(
      name:        field_name(field),
      type:        type,
      value:       value,
      class:       "p-1 #{border_for(field)} #{css_class} rounded-md",
      placeholder: placeholder,
      **,
    )
  end

  def border_for(_field)
    valid? ? "border" : "border border-red-500"
  end

  def field_name(*)
    helpers.field_name(
      ActiveModel::Naming.param_key(model.class), *
    )
  end

  def url
    helpers.url_for(controller: model.model_name.plural, action: action)
  end

  def action
    model.persisted? ? :update : :create
  end

  def method
    model.persisted? ? :patch : :post
  end
end
