# frozen_string_literal: true

class TaskCardComponent < ApplicationComponent
  def self.for(task)
    new(task: task)
  end

  def template
    div(
      class: "px-2 py-1 bg-gray-100 border border-2 cursor-move rounded-lg",
      data: {
        sortable_id: task.id,
      }
    ) do
      div(class: "flex justify-between") do
        span { task.name }
        span(class: "text-xs text-gray-500") { task.position }
      end
    end
  end

  private

  attr_reader :task

  def initialize(task:)
    @task = task
  end
end
