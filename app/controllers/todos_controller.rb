class TodosController < ApplicationController

  before_action :select_todo, only: [:edit, :update, :show, :destroy]

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
    # see before action filter
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
    # see before action filter
  end

  # ---------------------------------------------------------------------- /
  # update
  # ---------------------------------------------------------------------- /
  def update
    # see before action filter
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
    # see before action filter
    @todo.destroy
    flash[:notice] = "Zapped ToDo"
    redirect_to todos_path
  end

  # ====================================================================== /
  # Private methods :
  # ====================================================================== /
  private

    # ---------------------------------------------------------------------- /
    # white-listed parameters...
    # ---------------------------------------------------------------------- /
    def todo_params
      params.require(:todo).permit(:name, :description)
    end

    # ---------------------------------------------------------------------- /
    # DRY : refactor...
    # ---------------------------------------------------------------------- /
    def select_todo
      @todo = Todo.find(params[:id])
    end

end
