class TodosController < ApplicationController
  # ---------------------------------------------------------------------- /
  # list all todos
  # ---------------------------------------------------------------------- /
  def index
    @todos = Todo.all
  end

  # ---------------------------------------------------------------------- /
  # show a todo
  # ---------------------------------------------------------------------- /
  def show
    @todo = Todo.find(params[:id])
  end

  # ---------------------------------------------------------------------- /
  # new todo
  # ---------------------------------------------------------------------- /
  def new
    @todo = Todo.new
  end

  # ---------------------------------------------------------------------- /
  # create
  # ---------------------------------------------------------------------- /
  def create
    @todo = Todo.new(todo_params)
    if @todo.save
      flash[:notice] = "Successful commit"
      redirect_to todo_path(@todo)
    else
      render "new"
    end
  end

  # ---------------------------------------------------------------------- /
  # edit
  # ---------------------------------------------------------------------- /
  def edit
    @todo = Todo.find(params[:id])
  end

  # ---------------------------------------------------------------------- /
  # update
  # ---------------------------------------------------------------------- /
  def update
    @todo = Todo.find(params[:id])
    if @todo.update(todo_params)
      flash[:notice] = "Update successful"
      redirect_to todo_path(@todo)
    else
      render "edit"
    end
  end

  # ---------------------------------------------------------------------- /
  # zap a todo
  # ---------------------------------------------------------------------- /
  def destroy
    @todo = Todo.find(params[:id])
    @todo.destroy
    flash[:notice] = "Zapped ToDo"
    redirect_to todos_path
  end

  # ---------------------------------------------------------------------- /
  # white-listed parameters...
  # ---------------------------------------------------------------------- /
  private def todo_params
    params.require(:todo).permit(:name, :description)
  end

end
