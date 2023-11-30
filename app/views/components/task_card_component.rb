# frozen_string_literal: true

class TaskCardComponent < ApplicationComponent
  def self.for(task)
    new(task: task)
  end

  def template
    div(class: "px-2 py-1 bg-gray-100 border border-2 cursor-move rounded-lg") do
      task.name
    end
  end

  private

  attr_reader :task

  def initialize(task:)
    @task = task
  end
end
