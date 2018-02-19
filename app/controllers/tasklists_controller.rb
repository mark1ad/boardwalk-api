class TasklistsController < ApplicationController
  before_action :set_tasklist, only: [:show, :update, :destroy]

  # GET boards/1/tasklists
  def index
    @tasklists = Tasklist.where(board_id: params[:board_id])

    @data = []
    # Get the tasks for each list
    @tasklists.each { |tl|
      @tasks = Task.where(tasklist_id: tl.id)
      @data.push({tasklist: tl, tasks: @tasks})
    }

    render json: @data
  end

  # GET boards/1/tasklists/1
  def show
    if @tasklist.board_id.to_s() == params[:board_id]
      @tasks = Task.where(tasklist_id: @tasklist.id)
      @tasklist.tasks = @tasks
      render json: {tasklist: @tasklist, tasks: @tasks }
    else
      render json: {error: "Not Found"}, status: :not_found
    end
  end

  # POST boards/1/tasklists
  def create
    @tasklist = Tasklist.new(tasklist_params)
    @tasklist.board_id = params[:board_id]

    if @tasklist.save
      render json: @tasklist, status: :created
    else
      render json: @tasklist.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT boards/1/tasklists/1
  def update
    if @tasklist.board_id.to_s() == params[:board_id]
      if @tasklist.update(tasklist_params)
        render json: @tasklist
      else
        render json: @tasklist.error, status: :unprocessable_entity
      end
    else
      render json: {error: "Not Found"}, status: :not_found
    end
  end

  # DELETE boards/1/tasklists/1
  def destroy
    if @tasklist.board_id.to_s() == params[:board_id]
      @tasklist.destroy
    else
      render json: {error: "Not Found"}, status: :not_found
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tasklist
      @tasklist = Tasklist.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def tasklist_params
      params.require(:tasklist).permit(:name)
    end
end
