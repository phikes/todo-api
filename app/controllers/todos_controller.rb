# This is the RESTful controller for managing Todos.
class TodosController < ApplicationController
  def index
    @todos = Todo.all

    render json: @todos
  end

  def create
    @todo = Todo.new todo_params

    if @todo.save
      render json: @todo
    else
      render json: @todo.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @todo = Todo.find params[:id]

    @todo.destroy
    render json: @todo
  end

  protected

  def todo_params
    params.require(:todo).permit :name
  end
end
