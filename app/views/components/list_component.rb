# frozen_string_literal: true

class ListComponent < ApplicationComponent
  def self.for(list)
    new(list: list)
  end

  def template
    helpers.turbo_stream_from(list)

    div(class: "#{color_scheme.list_bg_color} py-2 border border-2 rounded-lg") {
      h2(class: "flex justify-between px-2 font-semibold border-b") { list.name }

      div(
        class: "flex flex-col gap-2 py-2 px-1 w-48",
        data:  {
          controller:            "sortable",
          sortable_to_parent_id: list.id,
        }
      ) {
        list.tasks.each do |task|
          render TaskCardComponent.for(task)
        end
      }
    }
  end

  private

  attr_reader :list

  def initialize(list:)
    @list = list
  end

  def color_scheme
    list.color_scheme
  end
end
