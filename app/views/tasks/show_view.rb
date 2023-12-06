# frozen_string_literal: true

class Tasks::ShowView < ApplicationView
  def self.for(task)
    new(task: task)
  end

  def template
    turbo_frame_tag(:modal) do
      h1(class: "mb-3 font-semibold text-lg") { task.name }
    end
  end

  private

  attr_reader :task

  def initialize(task:)
    @task = task
  end
end
