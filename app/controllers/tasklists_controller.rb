class TasklistsController < ApplicationController
  before_action :set_tasklist, only: [:show, :update, :destroy]

  # GET /tasklists
  def index
    @tasklists = Tasklist.all

    render json: @tasklists
  end

  # GET /tasklists/1
  def show
    render json: @tasklist
  end

  # POST /tasklists
  def create
    @tasklist = Tasklist.new(tasklist_params)

    if @tasklist.save
      render json: @tasklist, status: :created, location: @tasklist
    else
      render json: @tasklist.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /tasklists/1
  def update
    if @tasklist.update(tasklist_params)
      render json: @tasklist
    else
      render json: @tasklist.errors, status: :unprocessable_entity
    end
  end

  # DELETE /tasklists/1
  def destroy
    @tasklist.destroy
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
