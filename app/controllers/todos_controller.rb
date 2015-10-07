class TodosController < ApplicationController
  def index
    @todos = Todo.all

    render json: @todos
  end

  def create
    @todo = Todo.create todo_params

    render json: @todo
  end

  protected
  def todo_params
    params.require(:todo).permit :name
  end
end