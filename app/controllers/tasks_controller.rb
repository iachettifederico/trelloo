class TasksController < ApplicationController
  def update
    task.update(name: new_name)

    redirect_to board_path(task.board)
  end

  private

  def task
    Task.find(params[:id])
  end

  def new_name
    params[:new_name]
  end
end
