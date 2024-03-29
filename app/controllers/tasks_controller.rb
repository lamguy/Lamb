class TasksController < ApplicationController
  include Tasks::Followable
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  # GET /tasks
  # GET /tasks.json
  def index
    @tasks = Task.includes(:assigner, :assignee).where(:project_id => session[:project_id]).order(priority: :desc, due: :asc)
    # get the count from the comments efficently
    @task_comment_count = TaskComment.all.includes(@tasks).group(:task_id).count
  end

  # GET /tasks/1
  # GET /tasks/1.json
  def show
    @comments = Task.find(params[:id]).task_comments.includes(:user)
  end

  # GET /tasks/new
  def new
    @task = Task.new
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks
  # POST /tasks.json
  def create
    @project = Project.find(task_params[:project_id])
    @task = @project.tasks.new(task_params)
    @task.priority = 3
    @task.assigner = current_user
     
    if params[:task][:assets]
      #abort params[:task][:assets].inspect
      #===== The magic is here ;)
      params[:task][:assets].each { |file|
        @task.task_assets.build(user_id: current_user.id, :file => file)
      }
    end

    respond_to do |format|
      if @task.save
        format.html { redirect_to @task, notice: 'Task was successfully created.' }
        format.json { render :show, status: :created, location: @task }
      else
        format.html { render :new }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tasks/1
  # PATCH/PUT /tasks/1.json
  def update
    respond_to do |format|
      if @task.update(task_params)
        format.html { redirect_to @task, notice: 'Task was successfully updated.' }
        format.json { render :show, status: :ok, location: @task }
      else
        format.html { render :edit }
        format.json { render json: @task.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /tasks/1
  # DELETE /tasks/1.json
  def destroy
    @task.destroy
    respond_to do |format|
      format.html { redirect_to tasks_url, notice: 'Task was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def task_params
      params.require(:task).permit(:project_id, :assigner_id, :assignee_id, :name, :due, :priority, :description, :task_assets)
    end
end
