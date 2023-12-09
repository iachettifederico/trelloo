# frozen_string_literal: true

class TasksController < ApplicationController
  def show
    render Tasks::ShowView.for(task)
  end

  def edit
    render SingleFieldFor.new(model: task, field: field)
  end

  def update
    if task.update(task_params)
      render Tasks::ShowView.for(task)
    else
      render SingleFieldFor.new(model: task, field: field)
    end
  end

  private

  def task_params
    params.require(:task).permit(:name)
  end

  def task
    @task ||= Task.find(params[:id])
  end

  def field
    params[:field]
  end
end
