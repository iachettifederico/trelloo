# frozen_string_literal: true

class ListComponent < ApplicationComponent
  def self.for(list)
    new(list: list)
  end

  def template
    div(class: "py-2 bg-gray-50 border border-2") {
      h2(class: "flex justify-between px-2 font-semibold border-b") {
        span { list.name }
        span(class: "text-xs text-gray-500") { list.id }
      }

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
end
