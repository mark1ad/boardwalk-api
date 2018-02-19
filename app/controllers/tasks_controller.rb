class TasksController < ApplicationController
  before_action :set_task, only: [:show, :update, :destroy]

  # TODO: Check that tasklist has board_id

  # GET /boards/1/tasklists/1/tasks
  def index
    @tasks = Task.where(tasklist_id: params[:tasklist_id])

    render json: @tasks
  end

  # GET /boards/1/tasklists/1/tasks/1
  def show
    if @task.tasklist_id.to_s() == params[:tasklist_id]
      render json: @task
    else
      render json: {error: "Not Found"}, status: :not_found
    end
  end

  # POST /boards/1/tasklists/1/tasks
  def create
    @task = Task.new(task_params)
    @task.tasklist_id = params[:tasklist_id]

    if @task.save
      render json: @task, status: :created
    else
      render json: @task.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /boards/1/tasklists/1/tasks/1
  def update
    if @task.tasklist_id.to_s() == params[:tasklist_id]
      if @task.update(task_params)
        render json: @task
      else
        render json: @task.errors, status: :unprocessable_entity
      end
    else
      render json: {error: "Not Found"}, status: :not_found
    end
  end

  # DELETE /boards/1/tasklists/1/tasks/1
  def destroy
    if @task.tasklist_id.to_s() == params[:tasklist_id]
      @task.destroy
    else
      render json: {error: "Not Found"}, status: :not_found
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def task_params
      params.require(:task).permit(:name, :tasklist_id)
    end
end
